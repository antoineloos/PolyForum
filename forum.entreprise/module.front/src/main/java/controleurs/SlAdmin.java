package controleurs;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.Security;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.model.Entreprise;
import forum.app.dao.model.Entretien;
import forum.app.dao.model.Salle;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.ChoixCandidatDao;
import forum.app.dao.impl.ChoixEntrepriseDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.impl.EntretienDao;
import forum.app.dao.impl.SalleDao;
import forum.app.dao.model.EntretienPK;
import forum.app.dao.util.Constantes;
import forum.app.dao.util.ImportExcel;
import forum.app.dao.util.Utilitaire;
import forum.app.planning.Plannification;

public class SlAdmin extends HttpServlet {

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
	private static Logger logger = Logger.getLogger(SlAdmin.class);
	
	private String erreur = "";
	private String notif = "";
	private String ESPACE = " ";
	private String UNDERSCORE = "_";
	private String dirName;
	private String templateDirName;
	private String link;
	private String separator;
	private static ResourceBundle rb = ResourceBundle.getBundle("config");

	private EntrepriseDao entrepriseDao;
	private ChoixEntrepriseDao choixEntrepriseDao;
	private ChoixCandidatDao choixCandidatDao;
	private CandidatDao candidatDao;
	private EntretienDao entretienDao;
	private SalleDao salleDao;
	private Map<Integer, Integer> corresp;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response, String demandeBis)
			throws ServletException, IOException {
		if (demandeBis != null) {
			RequestDispatcher dsp = request.getRequestDispatcher(demandeBis);
			dsp.forward(request, response);
		}
		String demande;
		String vueReponse = "/admin.jsp";
		initAttr();
		erreur = null;
		notif = null;
		request.getSession().removeAttribute("notifR");
		request.getSession().removeAttribute("typePlanning");
		request.getSession().removeAttribute("listeEntreprises");
		request.getSession().removeAttribute("listeCandidats");
		request.getSession().removeAttribute("entretiensEnt");
		try {
			demande = getDemande(request);
			if (demande.equalsIgnoreCase("saisieEnt.adm")) {
				vueReponse = enregistrerEntreprise(request);
			} else if (demande.equalsIgnoreCase("consulterEnt.adm")) {
				vueReponse = consulterEntreprises(request);
			} else if (demande.equalsIgnoreCase("saisieCan.adm")) {
				vueReponse = enregistrerCandidat(request);
			} else if (demande.equalsIgnoreCase("consulterCan.adm")) {
				vueReponse = consulterCandidats(request);
			} else if (demande.equalsIgnoreCase("genererPlanning.adm")) {
				vueReponse = genererPlanning(request);
			} else if (demande.equalsIgnoreCase("vider.adm")) {
				vueReponse = vider(request);
			} else if (demande.equalsIgnoreCase("consulterPlanning.adm")) {
				vueReponse = consulterPlanning(request);
			} else if (demande.equalsIgnoreCase("planningIndEnt.adm")) {
				vueReponse = consulterPlanningEntreprise(request);
			} else if (demande.equalsIgnoreCase("planningIndCan.adm")) {
				vueReponse = consulterPlanningCandidat(request);
			} else if (demande.equalsIgnoreCase("modifierListeSal.adm")) {
				vueReponse = modifierListeSalle(request);
			} else if (demande.equalsIgnoreCase("modifierListeCan.adm")) {
				vueReponse = modifierListeCandidat(request);
			} else if (demande.equalsIgnoreCase("modifierListeEnt.adm")) {
				vueReponse = modifierListeEntreprise(request);
			} else if (demande.equalsIgnoreCase("supprEntretien.adm")) {
				vueReponse = supprimerEntretien(request);
			} else if (demande.equalsIgnoreCase("modifEntretien.adm")) {
				vueReponse = modifierEntretien(request);
			} else if (demande.equalsIgnoreCase("creerEntretien.adm")) {
				vueReponse = creerEntretien(request);
			} else if (demande.equalsIgnoreCase("modifDureeEntretien.adm")) {
				vueReponse = modifierDureeEntretien(request);
			} else if (demande.equalsIgnoreCase("typePlanning.adm")) {
				vueReponse = choisirTypePlanning(request);
			} else if (demande.equalsIgnoreCase("typeDocument.adm")) {
				vueReponse = typeDocument(request);
			} else if (demande.equalsIgnoreCase("choixTypeDocument.adm")) {
				vueReponse = choisirTypeDocument(request);
			} else if (demande.equalsIgnoreCase("gererSalles.adm")) {
				vueReponse = gererSalles(request);
			} else if (demande.equalsIgnoreCase("saisieEntreprise.adm")) {
				vueReponse = saisieEntreprise(request);
			} else if (demande.equalsIgnoreCase("saisieCandidat.adm")) {
				vueReponse = saisieCandidat(request);
			} else if (demande.equalsIgnoreCase("saisieSalle.adm")) {
				vueReponse = saisieSalle(request);
			} else if (demande.equalsIgnoreCase("ajoutSalle.adm")) {
				vueReponse = ajoutSalle(request);
			} else if (demande.equalsIgnoreCase("presenceCan.adm")) {
				vueReponse = presenceCan(request);
			}  else if (demande.equalsIgnoreCase("presenceEnt.adm")) {
				vueReponse = presenceEnt(request);
			} else if (demande.equalsIgnoreCase("dispoSalle.adm")) {
				vueReponse = dispoSalle(request);
			} else if (demande.equalsIgnoreCase("excelCandidat.adm")) {
				vueReponse = importerExcelCandidat(request, response);
			} else if (demande.equalsIgnoreCase("excelEntreprise.adm")) {
				vueReponse = importerExcelEntreprise(request, response);
			} else if (demande.equalsIgnoreCase("templateExcelCandidat.adm")){
				vueReponse = telechargerTemplateExcel(request, response, "candidat");
			} else if (demande.equalsIgnoreCase("templateExcelEntreprise.adm")){
				vueReponse = telechargerTemplateExcel(request, response, "entreprise");
			} else if (demande.equalsIgnoreCase("consulterMdp.adm")) {
				vueReponse = consulterMdp(request);
			} else if (demande.equalsIgnoreCase("changeEnt.adm")){
                            vueReponse = consulterPlanningEntrepriseAdm(request);
                        } else if (demande.equalsIgnoreCase("changeCan.adm")){
                            vueReponse = consulterPlanningCandidatAdm(request);
                        }
		} catch (Exception e) {
			erreur = e.getMessage();
		} finally {
			request.setAttribute("erreurR", erreur);
			request.setAttribute("notifR", notif);
			if (erreur != null) {
				vueReponse = "/admin.jsp";
				logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, erreur));
			}
            // Permet d'eviter les exceptions "java.lang.IllegalStateException: Committed" de jetty dans le cas d'un download de fichier
            if(!vueReponse.equals("OK")){
				logger.debug(Utilitaire.creerMsgPourLogs("admin", "admin", false, vueReponse));
				request.setAttribute("pageR", vueReponse);
				RequestDispatcher dsp = request.getRequestDispatcher(vueReponse);
				dsp.forward(request, response);
            }
		}
	}

	public String saisieEntreprise(HttpServletRequest request) {
		return "/saisieEntreprise.jsp";
	}

	public String saisieCandidat(HttpServletRequest request) {
		return "/saisieCandidat.jsp";
	}

	public String saisieSalle(HttpServletRequest request) {
		return "/saisieSalle.jsp";
	}

	public String gererSalles(HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<Salle> salles = salleDao.getAll();
		session.setAttribute("salles", salles);
		return "/gererSalles.jsp";
	}

	public String presenceEnt(HttpServletRequest request) {
		int idEntreprise = Integer.parseInt(request.getParameter("chaine"));
		Entreprise entreprise = entrepriseDao.getById(idEntreprise);
		if(entreprise.getPresent()) entreprise.setPresent(false);
		else entreprise.setPresent(true);
		entrepriseDao.updateEntreprise(entreprise);
		return "/listeEnt.jsp";
	}

	public String dispoSalle(HttpServletRequest request) {
		int idSalle = Integer.parseInt(request.getParameter("chaine"));
		Salle salle = salleDao.getById(idSalle);
		if(salle.getDisponible()) salle.setDisponible(false);
		else salle.setDisponible(true);
		salleDao.updateSalle(salle);
		return "/gererSalles.jsp";
	}
	
	public String presenceCan(HttpServletRequest request) {
		int idCandidat = Integer.parseInt(request.getParameter("chaine"));
		Candidat candidat = candidatDao.getById(idCandidat);
		if(candidat.getPresent()) candidat.setPresent(false);
		else candidat.setPresent(true);
		candidatDao.updateCandidat(candidat);
		return "/listeCan.jsp";
	}
	
	public String creerEntretien(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String param = request.getParameter("chaine");

		String[] params = param.split("_");

		int idEntreprise = getIdEntrepriseByName(params[0]);

		String heureD = params[1];
		String heureF = params[2];
		if (heureD.equals(heureF)) {
			return "/consulterPlanning.adm";
		}
		Timestamp heure = convertStringToTimestamp(heureD);
		Timestamp heureFin = convertStringToTimestamp(heureF);

		int idCandidat = Integer.parseInt(params[3]);

		String salle = getIdSalle(idEntreprise);

		List<Entretien> entretiens = entretienDao.getByIdCandidat(idCandidat);
		entretiens.addAll(entretienDao.getByIdEntreprise(idEntreprise));
		if (isDateAvailable(entretiens, heure.getTime(), heureFin.getTime(), idCandidat, idEntreprise)) {
			try {
				Entretien e = entretienDao.getById(idCandidat, idEntreprise);
				if (e != null) {
					logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Un entretien existe déjà pour ce candidat avec cette entreprise !"));
					throw new Exception("Un entretien existe déjà pour ce candidat avec cette entreprise !");
				}
			} catch (IndexOutOfBoundsException ex) {
				logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, ex.getMessage()));
				Entretien e = new Entretien(new EntretienPK(idEntreprise, idCandidat), heure, heureFin);
                                e.setIdSalle(salle);
				entretienDao.createEntretien(e);
			}
		} else {
			logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "L'horaire choisie est invalide !"));
			throw new Exception("L'horaire choisie est invalide !");
		}

		return "/consulterPlanning.adm";
	}

	public int getIdEntrepriseByName(String name) {
		List<Entreprise> entreprises = entrepriseDao.getAll();
		for (Entreprise entreprise : entreprises) {
			if (entreprise.getNom().equalsIgnoreCase(name)) {
				return entreprise.getIdEntreprise();
			}
		}
		return -1;
	}

	public Timestamp convertStringToTimestamp(String heure) throws Exception {
		heure = heure + ":00";
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		long date = format.parse(heure).getTime();
		return new Timestamp(date);
	}

	public String modifierDureeEntretien(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String param = request.getParameter("chaine");
		String[] params = param.split("_");
		// Olivier Penas 15:10-15:32_Olivier_Penas_Volvo_Salle_15

		// prénom / nom candidat
		String prenom = params[1];
		String nom = params[2];
		int idCandidat = retrouverCandidat(nom, prenom);

		// entreprise
		String entreprise = params[3];
		int idEntreprise = -1;
		List<Entreprise> entreprises = entrepriseDao.getAll();
		for (Entreprise e : entreprises) {
			if (e.getNom().equalsIgnoreCase(entreprise)) {
				idEntreprise = e.getIdEntreprise();
			}
		}

		// salle
		String salle = params[5];

		// heures
		String heures = params[0].split(" ")[2];
		String heureD = heures.split("-")[0];
		String heureF = heures.split("-")[1];

		// on modifier la duree l'entretien voulu
		List<Entretien> entretiens = entretienDao.getAll();
		for (Entretien e : entretiens) {
			if (idEntreprise == -1) {
				logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Erreur lors de la modification de l'entretien"));
				throw (new Exception("Erreur lors de la modification de l'entretien"));
			}
			if (e.getEntretienPK().getIdCandidat() == idCandidat && e.getEntretienPK().getIdEntreprise() == idEntreprise) {
				if (e.getIdSalle() == salle) {
					modifierDureeEntretien(e, heureD, heureF);
				}
			}
		}
		return "/consulterPlanning.adm";
	}

	public void modifierDureeEntretien(Entretien e, String heureDebut, String heureFin) throws ParseException {

		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		String fechaStr1 = heureDebut + ":00";
		String fechaStr2 = heureFin + ":00";
		long debut = format.parse(fechaStr1).getTime();
		long fin = format.parse(fechaStr2).getTime();
		List<Entretien> entretiens = entretienDao.getByIdCandidat(e.getEntretienPK().getIdCandidat());
		entretiens.addAll(entretienDao.getByIdEntreprise(e.getEntretienPK().getIdEntreprise()));
		if (isDateAvailable(entretiens, debut, fin, e.getEntretienPK().getIdCandidat(), e.getEntretienPK().getIdEntreprise())) {
			e.setHeure(new Timestamp(debut));
			e.setHeureFin(new Timestamp(fin));
			entretienDao.updateEntretien(e);
		}
	}

	public String modifierEntretien(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String param = request.getParameter("chaine");
		String[] params = param.split("_");
		// Nicolas_Balligand_Worldline_Salle_15_15:03_0:40

		// prénom / nom candidat
		String prenom = params[0];
		String nom = params[1];
		int idCandidat = retrouverCandidat(nom, prenom);

		// entreprise
		String entreprise = params[2];
		int idEntreprise = -1;
		List<Entreprise> entreprises = entrepriseDao.getAll();
		for (Entreprise e : entreprises) {
			if (e.getNom().equalsIgnoreCase(entreprise)) {
				idEntreprise = e.getIdEntreprise();
			}
		}

		// salle
		String salle = params[4];

		// on modifie l'entretien voulu
		List<Entretien> entretiens = entretienDao.getAll();
		for (Entretien e : entretiens) {
			if (idEntreprise == -1) {
				throw (new Exception("Erreur lors de la modification de l'entretien"));
			}
			if (e.getEntretienPK().getIdCandidat() == idCandidat && e.getEntretienPK().getIdEntreprise() == idEntreprise) {
				if (e.getIdSalle() == salle) {
					modifierHeureEntretien(e, params[5], getDuree(e));
				}
			}
		}
		return "/consulterPlanning.adm";
	}

	public long getDuree(Entretien e) {
		long debut = e.getHeure().getTime();
		long fin = e.getHeureFin().getTime();
		return fin - debut;
	}

	public void modifierHeureEntretien(Entretien e, String heure, long duree) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		if (heure.startsWith("13:")) {
			heure = "14:00";
		}
		String fechaStr1 = heure + ":00";
		long debut = format.parse(fechaStr1).getTime();
		long fin = debut + duree;
		List<Entretien> entretiens = entretienDao.getByIdCandidat(e.getEntretienPK().getIdCandidat());
		entretiens.addAll(entretienDao.getByIdEntreprise(e.getEntretienPK().getIdEntreprise()));
		if (isDateAvailable(entretiens, debut, fin, e.getEntretienPK().getIdCandidat(), e.getEntretienPK().getIdEntreprise())) {
			e.setHeure(new Timestamp(debut));
			e.setHeureFin(new Timestamp(fin));
			entretienDao.updateEntretien(e);
		}
	}

	public boolean isDateAvailable(List<Entretien> entretiens, long debutVoulu, long finVoulue, int idCandidat,
			int idEntreprise) {
		for (Entretien e : entretiens) {
			long debutOccupe = e.getHeure().getTime();
			long finOccupe = e.getHeureFin().getTime();
			if (debutOccupe > debutVoulu && finOccupe < finVoulue) {
				// s'il y a un creneau entre les dates de debut et de fin
				// voulues
				if (logicalXOR(e.getEntretienPK().getIdCandidat() == idCandidat, e.getEntretienPK().getIdEntreprise() == idEntreprise)) {
					return false;
				}
			}
			if (debutOccupe == debutVoulu) {
				// si les créneaux se chevauchent
				if (logicalXOR(e.getEntretienPK().getIdCandidat() == idCandidat, e.getEntretienPK().getIdEntreprise() == idEntreprise)) {
					return false;
				}
			}
			// créneau "a l'intérieur"
			if (debutOccupe < debutVoulu && finOccupe > finVoulue) {
				if (logicalXOR(e.getEntretienPK().getIdCandidat() == idCandidat, e.getEntretienPK().getIdEntreprise() == idEntreprise)) {
					return false;
				}
			}
			// créneau a cheval
			if (debutOccupe < debutVoulu && finOccupe < finVoulue && finOccupe > debutVoulu) {
				if (logicalXOR(e.getEntretienPK().getIdCandidat() == idCandidat, e.getEntretienPK().getIdEntreprise() == idEntreprise)) {
					return false;
				}
			}
			// créneau a cheval
			if (debutOccupe > debutVoulu && finOccupe > finVoulue && debutVoulu < finOccupe
					&& !(finVoulue <= debutOccupe)) {
				if (logicalXOR(e.getEntretienPK().getIdCandidat() == idCandidat, e.getEntretienPK().getIdEntreprise() == idEntreprise)) {
					return false;
				}
			}
		}
		return true;
	}

	public boolean logicalXOR(boolean x, boolean y) {
		return ((x || y) && !(x && y));
	}

	public String getHeureDeFin(String heureDebut, String duree) {
		String[] tab1 = heureDebut.split(":");
		String[] tab2 = duree.split(":");
		int hours = Integer.parseInt(tab1[0]) + Integer.parseInt(tab2[0]);
		int minutes = Integer.parseInt(tab1[1]) + Integer.parseInt(tab2[1]);
		if (minutes > 60) {
			hours++;
			minutes -= 60;
		}
		String result = hours + ":" + minutes;
		return result;
	}

	public String supprimerEntretien(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		String param = request.getParameter("chaine");
		String[] params = param.split("_");
		// Olivier_Penas_Worldline_(Salle_15)

		// prénom / nom candidat
		String prenom = params[0];
		String nom = params[1];
		int idCandidat = retrouverCandidat(nom, prenom);

		// entreprise
		String entreprise = params[2];
		int idEntreprise = -1;
		List<Entreprise> entreprises = entrepriseDao.getAll();
		for (Entreprise e : entreprises) {
			if (e.getNom().equalsIgnoreCase(entreprise)) {
				idEntreprise = e.getIdEntreprise();
			}
		}

		// salle
		String salle = params[4].replaceAll("\\)", "");

		// on supprime l'entretien voulu
		List<Entretien> entretiens = entretienDao.getAll();
		for (Entretien e : entretiens) {
			if (idEntreprise == -1) {
				throw (new Exception("Erreur lors de la suppression de l'entretien"));
			}
			if (e.getEntretienPK().getIdCandidat() == idCandidat && e.getEntretienPK().getIdEntreprise() == idEntreprise) {
				if (e.getIdSalle().equals(salle)) {
					entretienDao.removeEntretien(e);
				}
			}
		}
		return "/consulterPlanning.adm";
	}

	public String typeDocument(HttpServletRequest request) throws Exception {
		String vueResponse = "/admin.jsp";
		if (request.getParameter("boutton_cv") != null) {
			vueResponse = "planningForAllEnt.jsp";
		} else if (request.getParameter("boutton_offre") != null) {

			vueResponse = "planningForAllCan.jsp";

		}
		return vueResponse;
	}

	public String choisirTypeDocument(HttpServletRequest request) {
		return "/choixTypeDocument.jsp";
	}

	public String consulterPlanningCandidat(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int idCandidat = Integer.parseInt(request.getParameter("candidats"));
		List<Entretien> liste = entretienDao.getByIdCandidat(idCandidat);
		String text = "";
		Candidat c = candidatDao.getById(idCandidat);
		for (Entretien e : liste) {
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        e.setCandidat(c);
                        e.setEntreprise(ent);
			text = text + majAuDebut(majAuDebut(ent.getNom()) + ESPACE + "(Salle " + e.getIdSalle() + ")") + ESPACE
					+ e.getIdSalle() + ESPACE + e.getHeure() + ESPACE + e.getHeureFin()
					+ ESPACE;
		}

		String candidats = majAuDebut(c.getPrenom()) + " " + majAuDebut(c.getNom());

		session.setAttribute("entretiensEnt", liste);
		session.setAttribute("candidats", candidats);

		request.getSession().removeAttribute("typePlanning");
		request.getSession().removeAttribute("listeEntreprises");
		request.getSession().removeAttribute("listeCandidats");
                session.setAttribute("candidats", candidats);
		return "/planningCan.jsp";
	}

	public String consulterPlanningEntreprise(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
               // int idEntreprise = Integer.parseInt(request.getParameter("isTitles"));
		int idEntreprise = Integer.parseInt(request.getParameter("entreprises"));
                String nomRepr = request.getParameter("ent1");
		List<Entretien> liste = entretienDao.getByIdEntreprise(idEntreprise);
		String text = "";
		for (Entretien e : liste) {
			Candidat c = candidatDao.getById(e.getEntretienPK().getIdCandidat());
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        
                        e.setCandidat(c);
                        e.setEntreprise(ent);
			text = text + majAuDebut(c.getPrenom()) + ESPACE + majAuDebut(c.getNom()) + ESPACE
					+ majAuDebut(ent.getNom() + " (Salle " + e.getIdSalle() + ")") + ESPACE + e.getIdSalle() + ESPACE
					+ e.getHeure() + ESPACE + e.getHeureFin() + ESPACE;
		}
		String entreprises = "";

		Entreprise ent = entrepriseDao.getById(idEntreprise);
		entreprises = majAuDebut(ent.getNom()) + " (Salle " + getIdSalle(idEntreprise) + ")";

		session.setAttribute("entretiensEnt", liste);
		session.setAttribute("entreprisesEnt", entreprises);

		request.getSession().removeAttribute("typePlanning");
		request.getSession().removeAttribute("listeEntreprises");
		request.getSession().removeAttribute("listeCandidats");
		return "/planningEnt.jsp";
	}
        
        public String consulterPlanningEntrepriseAdm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
                int idEntreprise = Integer.parseInt(request.getParameter("isTitles"));
		//int idEntreprise = Integer.parseInt(request.getParameter("entreprises"));
              
		List<Entretien> liste = entretienDao.getByIdEntreprise(idEntreprise);
		String text = "";
		for (Entretien e : liste) {
			Candidat c = candidatDao.getById(e.getEntretienPK().getIdCandidat());
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        e.setCandidat(c);
                        e.setEntreprise(ent);
			text = text + majAuDebut(c.getPrenom()) + ESPACE + majAuDebut(c.getNom()) + ESPACE
					+ majAuDebut(ent.getNom() + " (Salle " + e.getIdSalle() + ")") + ESPACE + e.getIdSalle() + ESPACE
					+ e.getHeure() + ESPACE + e.getHeureFin() + ESPACE;
		}
		String entreprises = "";

		Entreprise ent = entrepriseDao.getById(idEntreprise);
		entreprises = majAuDebut(ent.getNom()) + " (Salle " + getIdSalle(idEntreprise) + ")";

		session.setAttribute("entretiensEnt", liste);
		session.setAttribute("entreprisesEnt", entreprises);

		request.getSession().removeAttribute("typePlanning");
		request.getSession().removeAttribute("listeEntreprises");
		request.getSession().removeAttribute("listeCandidats");
		return "/planningEnt.jsp";
	}
        public String consulterPlanningCandidatAdm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		int idCandidat = Integer.parseInt(request.getParameter("isTitles"));
		List<Entretien> liste = entretienDao.getByIdCandidat(idCandidat);
		String text = "";
		Candidat c = candidatDao.getById(idCandidat);
		for (Entretien e : liste) {
                        e.setCandidat(c);
                       
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        e.setEntreprise(ent);
			text = text + majAuDebut(majAuDebut(ent.getNom()) + ESPACE + "(Salle " + e.getIdSalle() + ")") + ESPACE
					+ e.getIdSalle() + ESPACE + e.getHeure() + ESPACE + e.getHeureFin()
					+ ESPACE;
		}

		String candidats = majAuDebut(c.getPrenom()) + " " + majAuDebut(c.getNom());

		session.setAttribute("entretiensEnt", liste);
		session.setAttribute("candidats", candidats);

		request.getSession().removeAttribute("typePlanning");
		request.getSession().removeAttribute("listeEntreprises");
		request.getSession().removeAttribute("listeCandidats");
		return "/planningCan.jsp";
	}

	public String consulterPlanning(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		List<Entretien> liste = entretienDao.getAll();
		if(liste.size()==0){
			throw new Exception(
					"Le planning n'a pas encore été  généré. Veuillez générer un planning avant de le consulter.");
		
		}
		String text = "";
		for (Entretien e : liste) {
			Candidat c = candidatDao.getById(e.getEntretienPK().getIdCandidat());
			Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                        e.setCandidat(c);
                        e.setEntreprise(ent);
                        /*
			text = text + majAuDebut(c.getPrenom()) + ESPACE + majAuDebut(c.getNom()) + ESPACE
					+ majAuDebut(ent.getNom() + " (Salle " + e.getIdSalle() + ")") + ESPACE + e.getIdSalle() + ESPACE
					+ e.getHeure() + ESPACE + e.getHeureFin() + ESPACE;  */
		}
		List<Entreprise> ents = entrepriseDao.getAll();
		String entreprises = "";
		for (Entreprise ent : ents) {
			String idSalle = getIdSalle(ent.getIdEntreprise());
			if (idSalle != null && ent.getPresent()) {
				entreprises = entreprises + majAuDebut(ent.getNom()) + " (Salle " + idSalle + ")";
				if (ents.get(ents.size() - 1) != ent) {
					entreprises = entreprises + " ";
				}
			}
		}

		session.setAttribute("entretiens", liste);
		session.setAttribute("entreprises", entreprises);

		List<Candidat> listeCandidats = candidatDao.getAll();
		session.setAttribute("listeCandidats", listeCandidats);
		return "/planningGlobal.jsp";
	}

	public String getIdSalle(int idEntreprise) throws Exception {
		try {
			List<Entretien> entretiens = entretienDao.getByIdEntreprise(idEntreprise);
			if (entretiens.size() == 0) {
				if(corresp != null && corresp.containsKey(idEntreprise)){
					return String.valueOf(corresp.get(idEntreprise));
				}
				else {
					return null;
				}
			}
			return String.valueOf(entretiens.get(0).getIdSalle());
		} catch (Exception e) {
			throw new Exception(
					"Le planning n'a pas encore été  généré. Veuillez générer un planning avant de le consulter.");
		}
	}

	public String majAuDebut(String chaine) {
		String chaineMaj = chaine.replaceFirst(".", (chaine.charAt(0) + "").toUpperCase());
		return chaineMaj;
	}

	public String convertirHeure(Timestamp t) {
		String heure = String.valueOf(t.getHours());
		String minute = String.valueOf(t.getMinutes());
		if (minute.length() == 1) {
			minute = "0" + minute;
		}
		return heure + ":" + minute;
	}

	public String modifierListeSalle(HttpServletRequest request) throws Exception {
		int idSalle = Integer.parseInt(request.getParameter("chaine"));
		Salle salle = salleDao.getById(idSalle);
		List<Entretien> entretiens = entretienDao.getByIdSalle(idSalle);
		if (entretiens.size() != 0) {
			throw new Exception(
					"Des entretiens existent pour la salle sélectionnée, impossible de supprimer la salle.");
		}
		salleDao.removeSalle(salle);

		return "/gererSalles.jsp";
	}

	public String modifierListeCandidat(HttpServletRequest request) {
		int idCandidat = Integer.parseInt(request.getParameter("chaine"));
		Candidat candidat = candidatDao.getById(idCandidat);
		// on supprime les choix des entreprises pour ce candidat
		List<ChoixEntreprise> listeChxEnt = choixEntrepriseDao.getAll();
		// on supprime les choix du candidat
		List<ChoixCandidat> listeChxCan = choixCandidatDao.getAll();
		for (ChoixCandidat ch : listeChxCan) {
			if (ch.getChoixCandidatPK().getIdCandidat() == candidat.getIdCandidat()) {
				choixCandidatDao.removeChoixCandidat(ch);
			}
		}
		// On supprime le candidat
		candidatDao.removeCandidat(candidat);
		majChoixEntreprise(listeChxEnt, candidat.getIdCandidat());
		// On supprime les choix des entreprises concernant ce candidat
		for (ChoixEntreprise ch : listeChxEnt) {
			if (ch.getChoixEntreprisePK().getIdCandidat() == candidat.getIdCandidat()) {
				choixEntrepriseDao.removeChoixEntreprise(ch);
			}
		}
		return "/listeCan.jsp";
	}

	public String choisirTypePlanning(HttpServletRequest request) throws Exception {
		String vueResponse = "/admin.jsp";
		if (request.getParameter("boutton_entreprise") != null) {
			planningForEntreprises(request);
			vueResponse = "planningForAllEnt.jsp";
		} else if (request.getParameter("boutton_candidat") != null) {

			planningForCandidats(request);
			vueResponse = "planningForAllCan.jsp";

		}
		return vueResponse;
	}

	public void planningForCandidats(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("typePlanning", "candidat");
		List<Candidat> listeCandidats = candidatDao.getAll();
		session.setAttribute("listeCandidats", listeCandidats);

		String entretiens = "";
		String candidats = "";

		for (Candidat can : listeCandidats) {
			entretiens = entretiens + can.getIdCandidat() + "/_";
			List<Entretien> liste = entretienDao.getByIdCandidat(can.getIdCandidat());
			for (Entretien e : liste) {
				Entreprise ent = entrepriseDao.getById(e.getEntretienPK().getIdEntreprise());
                                e.setEntreprise(ent);
				entretiens = entretiens + majAuDebut(ent.getNom()) + " (Salle " + e.getIdSalle() + ")" + UNDERSCORE
						+ majAuDebut(can.getNom()) + UNDERSCORE + majAuDebut(can.getPrenom()) + UNDERSCORE
						+ e.getHeure() + UNDERSCORE + e.getHeureFin() + UNDERSCORE;

			}

			candidats = candidats + majAuDebut(can.getNom()) + UNDERSCORE + majAuDebut(can.getPrenom()) + UNDERSCORE;
		}

		session.setAttribute("entretiens", entretiens);
		session.setAttribute("candidats", listeCandidats);
	}

	public void planningForEntreprises(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("typePlanning", "entreprise");
		List<Entreprise> listeEntreprises = entrepriseDao.getAll();
		session.setAttribute("listeEntreprises", listeEntreprises);

		String entretiens = "";
		String entreprise = "";

		for (Entreprise ent : listeEntreprises) {
			entretiens = entretiens + ent.getIdEntreprise() + "/_";
			List<Entretien> liste = entretienDao.getByIdEntreprise(ent.getIdEntreprise());
			for (Entretien e : liste) {
				Candidat c = candidatDao.getById(e.getEntretienPK().getIdCandidat());
				entretiens = entretiens + majAuDebut(c.getNom()) + UNDERSCORE + majAuDebut(c.getPrenom()) + UNDERSCORE
						+ majAuDebut(ent.getNom()) + " (Salle " + e.getIdSalle() + ")" + UNDERSCORE
						+ e.getHeure() + UNDERSCORE + e.getHeureFin() + UNDERSCORE;

			}
			String salle = String.valueOf(getIdSalle(ent.getIdEntreprise()));
			entreprise = entreprise + ent.getIdEntreprise() + UNDERSCORE + majAuDebut(ent.getNom()) + UNDERSCORE
					+ "(Salle " + salle + ")" + UNDERSCORE;
		}

		session.setAttribute("entretiens", entretiens);
		session.setAttribute("entreprise", entreprise);
                session.setAttribute("entreprises", listeEntreprises);
	}

	public String modifierListeEntreprise(HttpServletRequest request) {
		int idEntreprise = Integer.parseInt(request.getParameter("chaine"));
		Entreprise entreprise = entrepriseDao.getById(idEntreprise);
		// on supprime les choix de l'entreprise
		List<ChoixEntreprise> listeChoix = choixEntrepriseDao.getByIdEntreprise(idEntreprise);
		for (ChoixEntreprise choix : listeChoix) {
			choixEntrepriseDao.removeChoixEntreprise(choix);
		}
		// on supprime les choix des candidats
		List<ChoixCandidat> listeChxCan = choixCandidatDao.getAll();
		// On supprime l'entreprise
		entrepriseDao.removeEntreprise(entreprise);
		majChoixCandidat(listeChxCan, entreprise.getIdEntreprise());
		for (ChoixCandidat ch : listeChxCan) {
			if (ch.getChoixCandidatPK().getIdEntreprise() == entreprise.getIdEntreprise()) {
				choixCandidatDao.removeChoixCandidat(ch);
			}
		}
		return "/listeEnt.jsp";
	}

	public String ajoutSalle(HttpServletRequest request) throws Exception {
		int i = 2;
		List<Integer> avoidToAdd = new ArrayList<Integer>();
		while (request.getParameter("salle" + i) != null) {
			int idSalle = Integer.parseInt(request.getParameter("salle" + i));
			int capaciteSalle = Integer.parseInt(request.getParameter("cap" + i));
			int result = idSalleAlreadyExists(idSalle);
			
			if (result == -1) {
				Salle salle = new Salle(idSalle);
                              
                                salle.setCapacite(capaciteSalle);
                                salle.setDisponible(true);
				salleDao.createSalle(salle);
			} else {
				avoidToAdd.add(result);
			}
			i++;
		}
		if (avoidToAdd.size() != 0){
			logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Certaines salles existent déjà et n'ont pas été ajoutées : " + listToString(avoidToAdd)));
			throw new Exception("Certaines salles existent déjà et n'ont pas été ajoutées : " + listToString(avoidToAdd));
		}
		return "admin.jsp";
	}
	
	public String listToString(List<Integer> liste){
		String response = "";
		for (int i : liste){
			if (liste.indexOf(i) != liste.size()-1){
				response = response + i + ", ";
			} else {
				if (liste.size() != 1) {
					response = response + " et " + i;
				} else {
					response = response + i;
				}
			}
		}
		return response;
	}
	
	public int idSalleAlreadyExists(int id){
		List<Salle> salles = salleDao.getAll();
		for (Salle s : salles){
			if (s.getIdSalle() == id){
				return id;
			}
		}
		return -1;
	}

	public void majChoixEntreprise(List<ChoixEntreprise> liste, int idCandidat) {
		int max = candidatDao.getAll().size();
		int previous = -1;
		for (ChoixEntreprise ch : liste) {
			if (ch.getChoixEntreprisePK().getIdEntreprise() != previous) {
				List<ChoixEntreprise> listeForEntreprise = choixEntrepriseDao.getByIdEntreprise(ch.getChoixEntreprisePK().getIdEntreprise());
				int maxForEntreprise = getPrioMaxInListOfEntreprise(listeForEntreprise);
				if (maxForEntreprise > max && ch.getPriorite() == maxForEntreprise) {
					majDeEntreprise(ch.getChoixEntreprisePK().getIdEntreprise());
					previous = ch.getChoixEntreprisePK().getIdEntreprise();
				}
			}
		}
	}

	public void majChoixCandidat(List<ChoixCandidat> liste, int idEntreprise) {
		int max = entrepriseDao.getAll().size();
		int previous = -1;
		for (ChoixCandidat ch : liste) {
			if (ch.getChoixCandidatPK().getIdCandidat() != previous) {
				List<ChoixCandidat> listeForCandidat = choixCandidatDao.getByIdCandidat(ch.getChoixCandidatPK().getIdCandidat());
				int maxForCandidat = getPrioMaxInListOfCandidat(listeForCandidat);
				if (maxForCandidat > max && ch.getPriorite() == maxForCandidat) {
					if (ch.getChoixCandidatPK().getIdEntreprise() != idEntreprise) {
						majDuCandidat(ch.getChoixCandidatPK().getIdCandidat());
						previous = ch.getChoixCandidatPK().getIdCandidat();
					}
				}
			}
		}
	}

	public int getPrioMaxInListOfEntreprise(List<ChoixEntreprise> listeForEntreprise) {
		int result = 0;
		for (ChoixEntreprise ch : listeForEntreprise) {
			if (ch.getPriorite() > result) {
				result = ch.getPriorite();
			}
		}
		return result;
	}

	public int getPrioMaxInListOfCandidat(List<ChoixCandidat> listeForCandidat) {
		int result = 0;
		for (ChoixCandidat ch : listeForCandidat) {
			if (ch.getPriorite() > result) {
				result = ch.getPriorite();
			}
		}
		return result;
	}

	public void majDeEntreprise(int id) {
		List<ChoixEntreprise> liste = choixEntrepriseDao.getByIdEntreprise(id);
		for (ChoixEntreprise ch : liste) {
			ch.setPriorite(ch.getPriorite() - 1);
			choixEntrepriseDao.updateEntreprise(ch);
		}
	}

	public void majDuCandidat(int id) {
		List<ChoixCandidat> liste = choixCandidatDao.getByIdCandidat(id);
		for (ChoixCandidat ch : liste) {
			ch.setPriorite(ch.getPriorite() - 1);
			choixCandidatDao.updateCandidat(ch);
		}
	}

	public String genererPlanning(HttpServletRequest request) throws Exception {
		resetSalle();
		supprimerEntretiensExistant();
		Plannification p = new Plannification();
		corresp = p.genererPlanning();
		notif = "Le planning a été correctement généré !";
		return "/admin.jsp";
	}
	
	public String vider(HttpServletRequest request) throws Exception {
		supprimerEntretiensExistant();
		notif = "Le planning a été correctement vidé !";
		return "/admin.jsp";
	}

	public void supprimerEntretiensExistant() throws Exception {
		List<Entretien> entretiens = entretienDao.getAll();
		List<Integer> listeEnt = new ArrayList<Integer>();
		List<Entreprise> entreprise = entrepriseDao.getAll();
		if(entretiens.size()>0){
			for (Entreprise e : entreprise){
				String idSalle = getIdSalle(e.getIdEntreprise());
				if(null != idSalle){
					Salle s = salleDao.getById(Integer.parseInt(getIdSalle(e.getIdEntreprise())));
					if(s != null){
						if (s.getCapacite() < s.getCapaciteTotale()){
							s.setCapacite(s.getCapacite() + 1);
							salleDao.updateSalle(s);
						}
					}
				}
			}
		}
		for (Entretien e : entretiens) {
			entretienDao.removeEntretien(e);
			if (!listeEnt.contains(e.getEntretienPK().getIdEntreprise())) {
				//Salle s = salleDao.getById(e.getIdSalle());
				//s.setCapacite(s.getCapacite() + 1);
				//salleDao.updateSalle(s);
				listeEnt.add(e.getEntretienPK().getIdEntreprise());
			}
		}
		
	}

	public void resetSalle() throws Exception {
		List<Salle> salles = salleDao.getAll();
		for(Salle s : salles){
			if (s.getCapacite() != s.getCapaciteTotale()){
				s.setCapacite(s.getCapaciteTotale());
				salleDao.updateSalle(s);

			}
		}
	}
	
	public void initAttr() {
		choixEntrepriseDao = (ChoixEntrepriseDao) DaoFactory.getDaoInstance(Constantes.CHOIX_ENTREPRISE);
		choixCandidatDao = (ChoixCandidatDao) DaoFactory.getDaoInstance(Constantes.CHOIX_CANDIDAT);
		entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
		candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
		entretienDao = (EntretienDao) DaoFactory.getDaoInstance(Constantes.ENTRETIEN);
		salleDao = (SalleDao) DaoFactory.getDaoInstance(Constantes.SALLE);
    	dirName = rb.getString("path");
    	templateDirName = rb.getString("template");
    	link = "http://" + rb.getString("link");
    	separator = rb.getString("separator");
	}

	public String consulterCandidats(HttpServletRequest request) {
		String vueReponse;
		HttpSession session = request.getSession();
		List<Candidat> candidats = candidatDao.getAll();
		session.setAttribute("listeCandidat", candidats);
		return "/listeCan.jsp";
	}
	
	public String consulterMdp(HttpServletRequest request) {
		String vueReponse;
		HttpSession session = request.getSession();
		if("admin".equalsIgnoreCase((String) session.getAttribute("type"))){
			List<Candidat> candidats = candidatDao.getAll();
			session.setAttribute("listeCandidat", candidats);
			List<Entreprise> entreprises = entrepriseDao.getAll();
			session.setAttribute("listeEntreprise", entreprises);
			return "/listeMdp.jsp";
		}
		else {
			return "/home.jsp";
		}
	}

	public String consulterEntreprises(HttpServletRequest request) {
		String vueReponse;
		HttpSession session = request.getSession();
		List<Entreprise> entreprises = entrepriseDao.getAll();
		session.setAttribute("listeEntreprise", entreprises);
		return "/listeEnt.jsp";
	}

	private String getDemande(HttpServletRequest request) {
		String demande = "";
		demande = request.getRequestURI();
		demande = demande.substring(demande.lastIndexOf("/") + 1);
		return demande;
	}

	private String setDemande(HttpServletRequest request) {
		String demande = "";
		demande = request.getRequestURI();
		demande = demande.replace(getDemande(request), "home.jsp");
		demande = demande.substring(demande.lastIndexOf("/") + 1);
		return demande;
	}

	public String enregistrerCandidat(HttpServletRequest request) throws Exception {
		int i = 2;
		String listeErreurs = "";
		int cpt = 0;
		while (request.getParameter("nom" + i) != null || cpt < 5) {
			if (request.getParameter("nom" + i) != null){
				cpt = 0;
				String nomCan = request.getParameter("nom" + i);
				String prenomCan = request.getParameter("prenom" + i);
				String mailCan = request.getParameter("mail" + i);
				int idC = retrouverCandidat(nomCan.trim(), prenomCan.trim());
				if (idC == -1) {
					if(!validateAdress(mailCan)){
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mailCan + " est invalide pour le candidat " + prenomCan  + " " + nomCan + " !"));
						listeErreurs += "Le mail " + mailCan + " est invalide pour le candidat " + prenomCan + " " + nomCan + " ! \n";
					} else if (mailAlreadyExistsForCandidat(mailCan)){
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mailCan + " est déjà utilisé !"));
						listeErreurs += "Le mail " + mailCan + " est déjà utilisé ! \n";
					}
					else {
						Candidat can = new Candidat(0,nomCan);
                                            
                                                can.setPrenom(prenomCan);
                                                can.setPresent(Boolean.TRUE);
                                                can.setTrouve(Boolean.TRUE);
						can.setLogin(mailCan.toLowerCase());
						can.setNom(nomCan);
						can.setPrenom(prenomCan);
						can.setPassword(generatePassword(nomCan.toLowerCase()));
						augmenterPrioriteChoixEntreprise();
						candidatDao.createCandidat(can);
						envoiMail(can.getLogin(), can.getPassword());
					}
				} else {
					logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Une erreur s'est produite, le candidat " + prenomCan + " " + nomCan + " existe déjà !"));
					throw new Exception(
							"Une erreur s'est produite, le candidat " + prenomCan + " " + nomCan + " existe déjà !");
				}
			} else {
				cpt++;
			}
			i++;
		}
		if(listeErreurs.length() > 0){
			throw new Exception(listeErreurs);
		}
		return "admin.jsp";
	}

	public boolean mailAlreadyExistsForCandidat(String mail){
		for (Candidat c : candidatDao.getAll()){
			if (c.getLogin().equals(mail)){
				return true;
			}
		}
		return false;
	}

	public boolean mailAlreadyExistsForEntreprise(String mail){
		for (Entreprise e : entrepriseDao.getAll()){
			if (e.getLogin().equals(mail)){
				return true;
			}
		}
		return false;
	}
	
	public static boolean validateAdress(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(emailStr);
        return matcher.find();
	}
	
	public void envoiMail(String login, String mdp) throws Exception {
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Constantes.MAILPOLYFORUM, Constantes.PWDPOLYFORUM);
			}
		});
		session.setDebug(true);
		Transport transport = session.getTransport();
		InternetAddress addressFrom = new InternetAddress(Constantes.MAILPOLYFORUM);
		MimeMessage message = new MimeMessage(session);
		message.setSender(addressFrom);

		message.setSubject("Confirmation de votre inscription à PolyForum");
		String content = "";
		
		content = content + "<br>Bonjour, <br><br>";
		content = content + "Si vous n'êtes pas concerné par l'évènement, merci de faire suivre ce mail aux personnes présentes au forum Polytech.<br>";
		content = content + "Voici vos identifiants pour vous connecter à PolyForum:<br><br>";
		content = content + "Login: " + login + "<br>";
		content = content + "Mot de passe: " + mdp + "<br><br>";
		
		if (!link.equals("") && link != null){
			content = content + "Vous pouvez vous connecter à votre compte sur <a href=\"" + link + "\">notre site</a><br><br>";
		}
		
		content = content + "Cordialement,<br>";
		content = content + "L'équipe PolyForum";
		
		MimeBodyPart messageBodyPart = new MimeBodyPart();

		// Fill the message
		messageBodyPart.setText(content,"UTF-8","html");

		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart);

		// Put parts in message
		message.setContent(multipart);
		
		
		
		//message.setContent(content, "text/html; charset=utf-8");
		//message.setText(content, "UTF-8", "html");
		//message.setText(content, "UTF-8", "html");
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(login));

		transport.connect();
		transport.send(message);
		transport.close();
	}

	public void augmenterPrioriteChoixEntreprise() {
		List<ChoixEntreprise> liste = choixEntrepriseDao.getAll();
		for (ChoixEntreprise ch : liste) {
			ch.setPriorite(ch.getPriorite() + 1);
			choixEntrepriseDao.updateEntreprise(ch);
		}
	}

	public void augmenterPrioriteChoixCandidat() {
		List<ChoixCandidat> liste = choixCandidatDao.getAll();
		for (ChoixCandidat ch : liste) {
			ch.setPriorite(ch.getPriorite() + 1);
			choixCandidatDao.updateCandidat(ch);
		}
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

	public String enregistrerEntreprise(HttpServletRequest request) throws Exception {
		int i = 2;
		String listeErreurs = "";
		int cpt = 0;
		while (request.getParameter("ent" + i) != null ||  cpt < 5) {
			if (request.getParameter("ent" + i) != null){
				cpt = 0;
				String nomEnt = request.getParameter("ent" + i);
				String nomRepr = request.getParameter("repr" + i);
				String mailRepr = request.getParameter("mail" + i);
				int idE = retrouverEntreprise(nomEnt.trim(), nomRepr.trim());
				if (idE == -1) {
					if(!validateAdress(mailRepr)){
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mailRepr + " est invalide pour l'entreprise " + nomEnt + " !"));
						listeErreurs += "Le mail " + mailRepr + " est invalide pour l'entreprise " + nomEnt + " ! \n";
					} else if (mailAlreadyExistsForEntreprise(mailRepr)){
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mailRepr + " est déjà utilisé !"));
						listeErreurs += "Le mail " + mailRepr + " est déjà utilisé ! \n";
					}
					else {
						Entreprise ent = new Entreprise(0,nomEnt);
                                               
                                                ent.setNomRepresentant(nomRepr);
                                                ent.setPresent(Boolean.TRUE);
                                               
						ent.setLogin(mailRepr.toLowerCase());
						ent.setPassword(generatePassword(nomEnt.toLowerCase()));
						augmenterPrioriteChoixCandidat();
						entrepriseDao.createEntreprise(ent);
						//envoiMail(ent.getLogin(), ent.getPassword());
					}
				} else {
					logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Une erreur s'est produite, l'entreprise " + nomEnt + " " + nomRepr + " existe déjà !"));
					throw new Exception(
							"Une erreur s'est produite, l'entreprise " + nomEnt + " " + nomRepr + " existe déjà !");
				}
			} else {
				cpt++;
			}
			i++;
		}
		if(listeErreurs.length() > 0){
			throw new Exception(listeErreurs);
		}
		return "admin.jsp";
	}

	public String generatePassword(String nom) {
		String result = nom;
		int i = 0;
		int num;
		while (i < 4) {
			Double nume = new Double(Math.random() * (9 - 1));
			num = nume.intValue();
			result = result + num;
			i++;
		}
		return result;
	}

	public int retrouverEntreprise(String nomEnt, String nomRepr) {
		List<Entreprise> liste = entrepriseDao.getAll();
		for (Entreprise e : liste) {
			if (nomEnt.equalsIgnoreCase(e.getNom()) && nomRepr.equalsIgnoreCase(e.getNomRepresentant())) {
				return e.getIdEntreprise();
			}
		}
		// code d'erreur
		return -1;
	}

	public String importerExcelCandidat(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/plain");   
		try {
			String tempDirName = dirName;
			File tempDir = new File(tempDirName);
			if (!tempDir.exists()) {
				tempDir.mkdir();
			}
			MultipartRequest m=new MultipartRequest(request, dirName, 100000000);  
			String fileName = dirName + "/" + m.getOriginalFileName("document");
			List<Candidat> listeC = ImportExcel.excelRecupererCandidat(fileName);
			String listeErreurs = "";
			for(int i = 0; i < listeC.size(); i++){
				Candidat can = listeC.get(i);
				String mail = can.getLogin();
				String nom = can.getNom();
				String prenom = can.getPrenom();
				int idC = retrouverCandidat(can.getNom().trim(), can.getPrenom().trim());
				if (idC == -1) {
					if(!validateAdress(mail)){
						listeErreurs += "Le mail " + mail + " est invalide pour le candidat " + prenom + " " + nom + " ! \n";
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mail + " est invalide pour le candidat "  + prenom + " " + nom + " !"));
					}
					else {
						augmenterPrioriteChoixEntreprise();
						candidatDao.createCandidat(can);
						envoiMail(can.getLogin(), can.getPassword());
					}
				}
				else {
					File file = new File(fileName);
					file.delete();
					logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Une erreur s'est produite, le candidat " + can.getPrenom() + " " + can.getNom() + " existe déjà !"));
					throw new Exception(
							"Une erreur s'est produite, le candidat " + can.getPrenom() + " " + can.getNom() + " existe déjà !");
				}
			}
			File file = new File(fileName);
			file.delete();
			if(listeErreurs.length() > 0){
				throw new Exception(listeErreurs);
			}
		}
	    catch (IOException lEx) {
	        System.err.println("Erreur durant l'import du fichier excel");
	    }
		return "/admin.jsp";
	}
	
	public String importerExcelEntreprise(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/plain");   
		try {
			String tempDirName = dirName;
			File tempDir = new File(tempDirName);
			if (!tempDir.exists()) {
				tempDir.mkdir();
			}
			MultipartRequest m=new MultipartRequest(request, dirName, 100000000);
			String fileName = dirName + "/" + m.getOriginalFileName("document");
			List<Entreprise> listeE = ImportExcel.excelRecupererEntreprise(fileName);
			String listeErreurs = "";
			for(int i = 0; i < listeE.size(); i++){
				Entreprise en = listeE.get(i);
				String mail = en.getLogin();
				String nom = en.getNom();
				int idE = retrouverEntreprise(en.getNom().trim(), en.getNomRepresentant().trim());
				if (idE == -1) {
					if(!validateAdress(mail)){
						listeErreurs += "Le mail " + mail + " est invalide pour l'entreprise " + nom + " ! \n";
						logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Le mail " + mail + " est invalide pour l'entreprise " + nom + " !"));
					}
					else {
						augmenterPrioriteChoixCandidat();
						entrepriseDao.createEntreprise(en);
						envoiMail(en.getLogin(), en.getPassword());
					}
				}
				else {
					File file = new File(fileName);
					file.delete();
					logger.error(Utilitaire.creerMsgPourLogs("admin", "admin", true, "Une erreur s'est produite, l'entreprise " + en.getNom() + " " + en.getNomRepresentant() + " existe déjà !"));
					throw new Exception(
							"Une erreur s'est produite, l'entreprise " + en.getNom() + " " + en.getNomRepresentant() + " existe déjà !");
				}
			}
			File file = new File(fileName);
			file.delete();
			if(listeErreurs.length() > 0){
				throw new Exception(listeErreurs);
			}
		}
	    catch (IOException lEx) {
	        System.err.println("Erreur durant l'import du fichier excel");
	    }
		return "/admin.jsp";
	}
	
	public String telechargerTemplateExcel(HttpServletRequest request, HttpServletResponse response, String type) throws Exception{
		String filename = "";
		if(type.equalsIgnoreCase("candidat")){
			filename = "ImportCandidats.xlsx";
		}
		else {
			filename = "ImportEntreprises.xlsx";
		}
		response.setContentType("application/download"); 
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\""); 
		ServletOutputStream out = response.getOutputStream(); 
		File file = null; 
		BufferedInputStream from = null; 
		try {  
			file = new File(templateDirName + separator + filename); 
			response.setContentLength((int) file.length());  
			int bufferSize = 64 * 1024; 
			from = new BufferedInputStream(new FileInputStream(file), bufferSize * 2); 
			byte[] bufferFile = new byte[bufferSize]; 
			for (int i = 0; ; i++) { 
		  
				int len = from.read(bufferFile);  
		  
				if (len < 0) { 
					break; 
				}  
		 
				out.write(bufferFile, 0, len); 
			} 
			out.flush(); 
		 
		} catch (FileNotFoundException e) { 
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally { 
			if (from != null) { 
				try { 
					from.close(); 
				} catch (Exception e) { 
					e.printStackTrace(); 
				} 
			} 
			if (out != null) { 
				try { 
					out.close(); 
				} catch (Exception e) { 
					e.printStackTrace(); 
				} 
			} 
		}
	return "OK";
}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("type") != null && session.getAttribute("type") != "") {
			processRequest(request, response, null);
		} else {
			processRequest(request, response, setDemande(request));
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response, null);
	}
}
