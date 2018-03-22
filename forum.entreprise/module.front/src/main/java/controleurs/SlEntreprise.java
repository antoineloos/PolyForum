package controleurs;

import java.io.IOException;
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
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.model.Entreprise;
import forum.app.dao.model.Entretien;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.ChoixEntrepriseDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.impl.EntretienDao;
import forum.app.dao.impl.SalleDao;
import forum.app.dao.model.Salle;
import forum.app.dao.util.Constantes;
import forum.app.dao.util.Utilitaire;
import java.util.regex.*;

@SuppressWarnings("serial")
public class SlEntreprise extends HttpServlet {

    private String UNDERSCORE = "_";

    private static Logger logger = Logger.getLogger(SlEntreprise.class);

    private String erreur = "";
    private String notif = "";
    private EntrepriseDao entrepriseDao;
    private ChoixEntrepriseDao choixEntrepriseDao;
    private CandidatDao candidatDao;
    private SalleDao salleDao;
    private EntretienDao entretienDao;
    private static Pattern pattern;
    private static Matcher matcher;

    public SlEntreprise() {
        pattern = Pattern.compile("[a-zA-Z0-9áàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ._\\s-]+");
    }

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
            if (demande.equalsIgnoreCase("choixEnt.chxE")) {
                vueReponse = enregistrerChoixEntreprise(request);
            } else if (demande.equalsIgnoreCase("consulter.chxE")) {
                vueReponse = consulterChoixEntreprise(request);
            } else if (demande.equalsIgnoreCase("modifierChoixEnt.chxE")) {
                vueReponse = rafraichirPriorite(request);
            } else if (demande.equalsIgnoreCase("initSaisieChoixEnt.chxE")) {
                vueReponse = initSaisieChoixEnt(request);
            } else if (demande.equalsIgnoreCase("supprimerChoix.chxE")) {
                vueReponse = supprimerChoix(request);
            } else if (demande.equalsIgnoreCase("consulterPlanning.chxE")) {
                vueReponse = consulterPlanning(request);
            }

        } catch (Exception e) {
            erreur = e.getMessage();
            logger.error(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), "entreprise", true, erreur));
        } finally {
            request.setAttribute("erreurR", erreur);
            request.setAttribute("notifR", notif);
            if (!"".equalsIgnoreCase(erreur) && getDemande(request).equalsIgnoreCase("choixEnt.chxE")) {
                vueReponse = "/saisieChoixEntreprise.jsp";
            }
            logger.debug(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), "entreprise", false, vueReponse));
            request.setAttribute("pageR", vueReponse);
            RequestDispatcher dsp = request.getRequestDispatcher(vueReponse);
            dsp.forward(request, response);
        }
    }

    public void initAttr() {
        entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
        candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
        choixEntrepriseDao = (ChoixEntrepriseDao) DaoFactory.getDaoInstance(Constantes.CHOIX_ENTREPRISE);
        entretienDao = (EntretienDao) DaoFactory.getDaoInstance(Constantes.ENTRETIEN);
         salleDao = (SalleDao) DaoFactory.getDaoInstance(Constantes.SALLE);
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
        String entreprise = "";

        int idEntreprise = (int) session.getAttribute("idCompte");
        List<Entretien> listeEntretiens = entretienDao.getByIdEntreprise(idEntreprise);
        if (listeEntretiens.size() == 0) {
            throw new Exception("Votre planning n'a pas encore été généré, veuillez contacter l'administrateur du site.");
        }

        entretiens = entretiens + idEntreprise + "/_";
        List<Entretien> liste = entretienDao.getByIdEntreprise(idEntreprise);
        Entreprise ent = entrepriseDao.getById(idEntreprise);
        for (Entretien e : liste) {
            Candidat c = candidatDao.getById(e.getEntretienPK().getIdCandidat());
            e.setCandidat(c);
            e.setEntreprise(ent);
               Salle s = salleDao.getById(e.getEntretienPK().getIdSalle());
            entretiens = entretiens + majAuDebut(c.getNom()) + UNDERSCORE + majAuDebut(c.getPrenom()) + UNDERSCORE
                    + majAuDebut(ent.getNom()) + " (Salle " + s.getIdSalle() + ")" + UNDERSCORE
                    + e.getHeure() + UNDERSCORE + e.getHeureFin() + UNDERSCORE;

        }
     
        entreprise = entreprise + idEntreprise + UNDERSCORE + majAuDebut(ent.getNom()) + UNDERSCORE + "(Salle "
                + ")" + UNDERSCORE;

        session.setAttribute("entretiensEnt", liste);
        session.setAttribute("entreprise", entreprise);
        return "/planningEnt.jsp";
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

    public String initSaisieChoixEnt(HttpServletRequest request) {
        String vueReponse = "/saisieChoixEntreprise.jsp";
        HttpSession session = request.getSession();
        int idEntreprise = (int) session.getAttribute("idCompte");
        List<Candidat> listeCandidats = choixEntrepriseDao.getCandidatNonChoisi(idEntreprise);
        session.setAttribute("listeCandidats", listeCandidats);
        return vueReponse;
    }

    public String enregistrerChoixEntreprise(HttpServletRequest request) throws Exception {
        String vueReponse;
        int priorite = candidatDao.getAll().size();
        int i = 2;
        while (i < candidatDao.getAll().size() * 3) {
            if (request.getParameter("id" + i) != null) {
                int idCandidat = Integer.parseInt(request.getParameter("id" + i));
                int duree = Integer.parseInt(request.getParameter("duree" + i));
                if (idCandidat != -1) {
                    HttpSession session = request.getSession(true);
                    int idCompte = (int) session.getAttribute("idCompte");
                    ChoixEntreprise chxEnt = new ChoixEntreprise(idCompte, idCandidat);
                    chxEnt.setPriorite(priorite);
                    chxEnt.setTempsVoulu(duree);
                    notif = "Vos choix ont été validés, vous pouvez dès à présent les consulter.";
                    choixEntrepriseDao.createChoixEntreprise(chxEnt);
                } else {
                    throw new Exception("Une erreur s'est produite, le candidat " + idCandidat + " n'existe pas !");
                }
                priorite--;
            }
            i++;
        }
        return "/index.jsp";
    }

    @SuppressWarnings("unchecked")
    public String modifierChoixEntreprise(HttpServletRequest request) throws Exception {
        String vueReponse;
        HttpSession session = request.getSession(true);
        List<ChoixEntreprise> listeChoix = (List<ChoixEntreprise>) session.getAttribute("listeChoix");
        int priorite = candidatDao.getAll().size();
        int idCompte = (int) session.getAttribute("idCompte");
        choixEntrepriseDao.deleteAllEntreprise(idCompte);
        for (int i = 0; i < listeChoix.size(); i++) {
            ChoixEntreprise chxEnt = new ChoixEntreprise(listeChoix.get(i).getChoixEntreprisePK().getIdCandidat(),
                    listeChoix.get(i).getChoixEntreprisePK().getIdEntreprise());

            chxEnt.setPriorite(priorite);
            chxEnt.setTempsVoulu(listeChoix.get(i).getTempsVoulu());
            choixEntrepriseDao.createChoixEntreprise(chxEnt);
            priorite--;
        }
        return "/listeChoix.jsp";
    }

    public String consulterChoixEntreprise(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int idEntreprise = (int) session.getAttribute("idCompte");
        List<ChoixEntreprise> choix = choixEntrepriseDao.getByIdEntreprise(idEntreprise);
        session.setAttribute("listeChoix", choix);
        return "/listeChoixEnt.jsp";
    }

    public String rafraichirPriorite(HttpServletRequest request) {
        Map<String, String> test = request.getParameterMap();
        for (String ent : test.keySet()) {
            List<String> params = getParamsFromQueryString(request.getParameter(ent));
            int i = 0;
            int priorite = candidatDao.getAll().size();
            while (i < params.size()) {
                if (i % 5 == 0) {
                    int idCandidat = retrouverCandidat(params.get(i + 1), params.get(i));
                    HttpSession session = request.getSession();
                    int idEntreprise = (int) session.getAttribute("idCompte");
                    List<ChoixEntreprise> liste = choixEntrepriseDao.getByIdEntreprise(idEntreprise);
                    for (ChoixEntreprise chx : liste) {
                        if (chx.getChoixEntreprisePK().getIdCandidat() == idCandidat) {
                            chx.setPriorite(priorite);
                            choixEntrepriseDao.updateEntreprise(chx);
                            priorite--;
                        }
                    }
                }
                i++;
            }
        }
        return "jsdhgfsdgfshdgfhdsfghdfghdfhfgkgj";
    }

    public List<String> getParamsFromQueryString(String chaine) {
        List<String> result = new ArrayList<String>();
        System.out.println(chaine);
        // la chaine nécessite des modifications
        
        chaine = chaine.replaceAll("\t", "");
        String[] fields = chaine.split("\n");
        
        int i = 0;
        while (i < fields.length) {
            if (!"".equals(fields[i].replaceAll("\\s", ""))) {
                result.add(fields[i].replaceAll("\\s", ""));
            }
            i++;
        }
        
        System.out.println(result);
        result.remove(3);
        result.remove(2);
        result.remove(1);
        result.remove(0);

        return result;
    }

    public int retrouverCandidat(String nom, String prenom) {
        List<Candidat> liste = candidatDao.getAll();
        for (Candidat c : liste) {
            if (nom.equalsIgnoreCase(c.getNom()) && prenom.equalsIgnoreCase(c.getPrenom())) {
                return c.getIdCandidat();
            }
        }
        // code d'erreur
        return -1;
    }

    public String supprimerChoix(HttpServletRequest request) {
        String[] idEntrepriseCandidat = request.getParameter("chaine").split(" ");
        int idEntreprise = Integer.parseInt(idEntrepriseCandidat[0]);
        int idCandidat = Integer.parseInt(idEntrepriseCandidat[1]);
        ChoixEntreprise choix = choixEntrepriseDao.getByIdEntrepriseIdCandidat(idEntreprise, idCandidat);
        choixEntrepriseDao.removeChoixEntreprise(choix);
        notif = "Le candidat a bien été supprimée de vos choix.";
        return consulterChoixEntreprise(request);
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
