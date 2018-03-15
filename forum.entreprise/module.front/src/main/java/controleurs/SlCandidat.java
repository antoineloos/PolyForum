package controleurs;

import java.io.IOException;
import java.security.KeyStore.Entry;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.model.Entreprise;
import forum.app.dao.model.Entretien;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.ChoixCandidatDao;
import forum.app.dao.impl.ChoixEntrepriseDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.impl.EntretienDao;
import forum.app.dao.util.Constantes;
import forum.app.dao.util.Utilitaire;

@SuppressWarnings("serial")
public class SlCandidat extends HttpServlet {

	private static Logger logger = Logger.getLogger(SlCandidat.class);

	private String erreur = "";
	private String UNDERSCORE = "_";

	private EntrepriseDao entrepriseDao;
	private ChoixCandidatDao choixCandidatDao;
	private CandidatDao candidatDao;
	private EntretienDao entretienDao;
	
	public SlCandidat(){}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idCompte = (int) session.getAttribute("idCompte");
        String demande;
        String vueReponse = "/index.jsp";
        initAttr();
        erreur = "";
        request.getSession().removeAttribute("notifR");
        try {
            demande = getDemande(request);
            if (demande.equalsIgnoreCase("choixCan.can")) {
                vueReponse = enregistrerChoixCandidat(request);
            } else if (demande.equalsIgnoreCase("consulter.can")) {
                vueReponse = consulterChoixCandidat(request);
            } else if (demande.equalsIgnoreCase("modifierChoixCan.can")) {
                vueReponse = rafraichirPriorite(request);
            } else if (demande.equalsIgnoreCase("initSaisieChoixCan.can")) {
            	vueReponse = initSaisieChoixCan(request);
            } else if (demande.equalsIgnoreCase("supprimerChoix.can")) {
            	vueReponse = supprimerChoix(request);
            } else if (demande.equalsIgnoreCase("consulterPlanning.can")) {
				vueReponse = consulterPlanning(request);
			}
        } catch (Exception e) {
            erreur = e.getMessage();
            logger.error(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), "candidat", true, erreur));
        } finally {
            request.setAttribute("erreurR", erreur);
            if (!"".equalsIgnoreCase(erreur) && getDemande(request).equalsIgnoreCase("choixCan.can")){
            	vueReponse = "/saisieChoixCandidat.jsp";
            }
            logger.debug(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), "candidat", false, vueReponse));
            request.setAttribute("pageR", vueReponse);            
            RequestDispatcher dsp = request.getRequestDispatcher(vueReponse);
            dsp.forward(request, response);
        }
    }
	
	public void initAttr(){
		entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
		candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
		choixCandidatDao = (ChoixCandidatDao) DaoFactory.getDaoInstance(Constantes.CHOIX_CANDIDAT);
		entretienDao = (EntretienDao) DaoFactory.getDaoInstance(Constantes.ENTRETIEN);
	}
	
	
	private String getDemande(HttpServletRequest request) {
        String demande = "";
        demande = request.getRequestURI();
        demande = demande.substring(demande.lastIndexOf("/") + 1);
        return demande;
    }
	
	private String consulterPlanning(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String entretiens = "";
		String candidat = "";

		int idCandidat = (int) session.getAttribute("idCompte");
		List<Entretien> listeEntretiens = entretienDao.getByIdCandidat(idCandidat);
		if (listeEntretiens.size() == 0){
			throw new Exception("Votre planning n'a pas encore été généré, veuillez contacter l'administrateur du site.");
		}
		
		List<Entretien> liste = entretienDao.getByIdCandidat(idCandidat);
		Candidat can = candidatDao.getById(idCandidat);
		for (Entretien e : liste) {
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        e.setEntreprise(ent);
			entretiens = entretiens + majAuDebut(ent.getNom()) + " (Salle " + e.getIdSalle() + ")" + UNDERSCORE
					+ e.getHeure() + UNDERSCORE + e.getHeureFin() + UNDERSCORE;

		}
		candidat = can.getPrenom() + " " + can.getNom();

		session.setAttribute("entretiens", entretiens);
		session.setAttribute("candidat", candidat);
		return "/planningCan.jsp";
	}

	public String convertirHeure(Timestamp t) {
		String heure = String.valueOf(t.getHours());
		String minute = String.valueOf(t.getMinutes());
		if (minute.length() == 1) {
			minute = "0" + minute;
		}
		return heure + ":" + minute;
	}

	public String majAuDebut(String chaine) {
		String chaineMaj = chaine.replaceFirst(".", (chaine.charAt(0) + "").toUpperCase());
		return chaineMaj;
	}
	
	public String initSaisieChoixCan(HttpServletRequest request) {
		String vueReponse = "/saisieChoixCandidat.jsp";
		HttpSession session = request.getSession();
	    int idCandidat = (int) session.getAttribute("idCompte");
	    List<Entreprise> listeEntreprises = choixCandidatDao.getEntrepriseNonChoisi(idCandidat);
	    session.setAttribute("listeEntreprises", listeEntreprises);
		return vueReponse;
	}
	
	public String enregistrerChoixCandidat(HttpServletRequest request) throws Exception {
		int priorite = entrepriseDao.getAll().size();
		int i = 2;
		while (i < candidatDao.getAll().size()*3){
			if (request.getParameter("id"+i) != null) {
				int idEntreprise = Integer.parseInt(request.getParameter("id"+i));
				if (idEntreprise != -1){
		            HttpSession session = request.getSession(true);
		            int idCompte = (int) session.getAttribute("idCompte");
					ChoixCandidat chxCan = new ChoixCandidat(idCompte, idEntreprise);	
                                        chxCan.setPriorite(priorite);
					choixCandidatDao.createChoixCandidat(chxCan);
				} else {
					logger.error(Utilitaire.creerMsgPourLogs(String.valueOf(-1), "Candidat", true, "Une erreur s'est produite, l'entreprise " + idEntreprise + " n'existe pas !"));
					throw new Exception("Une erreur s'est produite, l'entreprise " + idEntreprise + " n'existe pas !");
				}	
				priorite --;
			}
			i++;		
		}
		return "/listeChoixCan.jsp";
	}
	
	@SuppressWarnings("unchecked")
	public String modifierChoixCandidat(HttpServletRequest request) throws Exception {
		String vueReponse;
        HttpSession session = request.getSession(true);
		List<ChoixCandidat> listeChoix = (List<ChoixCandidat>) session.getAttribute("listeChoix");
		int priorite = entrepriseDao.getAll().size();
        int idCompte = (int) session.getAttribute("idCompte");
        choixCandidatDao.deleteAllCandidat(idCompte);
        for(int i = 0; i < listeChoix.size(); i++){
        	ChoixCandidat chxCan = new ChoixCandidat(listeChoix.get(i).getChoixCandidatPK().getIdCandidat(), listeChoix.get(i).getChoixCandidatPK().getIdEntreprise());	
                chxCan.setPriorite(priorite);
        	choixCandidatDao.createChoixCandidat(chxCan);
			priorite --;
        }
		return "/listeChoixCan.jsp";
	}
	
	public String consulterChoixCandidat(HttpServletRequest request){
		HttpSession session = request.getSession();
	    int idCandidat = (int) session.getAttribute("idCompte");
	    List<ChoixCandidat> choix = choixCandidatDao.getByIdCandidat(idCandidat);
            
	    session.setAttribute("listeChoix", choix);
		return "/listeChoixCan.jsp";
	}
	
	public String rafraichirPriorite(HttpServletRequest request){
		Map<String, String> test = request.getParameterMap();
		for (String ent : test.keySet()){
			List<String> params = getParamsFromQueryString(request.getParameter(ent));
			int i = 0;
			int priorite = entrepriseDao.getAll().size();
			while (i < params.size()){
				if (i%3 == 0){
					int idEntreprise = retrouverEntreprise(params.get(i));
					HttpSession session = request.getSession();
				    int idCandidat = (int) session.getAttribute("idCompte");
					List<ChoixCandidat> liste = choixCandidatDao.getByIdCandidat(idCandidat);
					for (ChoixCandidat chx : liste){
						if (chx.getChoixCandidatPK().getIdEntreprise() == idEntreprise){
							chx.setPriorite(priorite);
							choixCandidatDao.updateCandidat(chx);
							priorite--;
						}
					}
				}
				i++;
			}
		}
		return "jsdhgfsdgfshdgfhdsfghdfghdfhfgkgj";
	}
	
	
	
	public List<String> getParamsFromQueryString(String chaine){
		List<String> result = new ArrayList<String>();
		System.out.println(chaine);
		// la chaine nécessite des modifications
		chaine = chaine.replaceAll("\t", "");
		String[] fields = chaine.split("\n");
		int i = 0;
		while (i < fields.length){
			if (!"".equals(fields[i])){
				result.add(fields[i]);
			}
			i++;
		}
		result.remove(1);
		result.remove(0);
		return result;
	}
	
	public int retrouverEntreprise(String nom){
		List<Entreprise> liste = entrepriseDao.getAll();
		for(Entreprise c : liste){
			if (nom.equalsIgnoreCase(c.getNom())){
				return c.getIdEntreprise();
			}
		}
		// code d'erreur
		return -1;
	}
	
	public String supprimerChoix(HttpServletRequest request) {
		String[] idEntrepriseCandidat = request.getParameter("chaine").split(" ");
		int idEntreprise = Integer.parseInt(idEntrepriseCandidat[0]);
		int idCandidat = Integer.parseInt(idEntrepriseCandidat[1]);
		ChoixCandidat choix = choixCandidatDao.getByIdEntrepriseIdCandidat(idCandidat, idEntreprise);
		choixCandidatDao.removeChoixCandidat(choix);
		return consulterChoixCandidat(request);
	}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	processRequest(request, response);
    }
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
	
}
