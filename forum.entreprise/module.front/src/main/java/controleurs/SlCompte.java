package controleurs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.Entreprise;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.util.Constantes;
import forum.app.dao.util.Utilitaire;

@SuppressWarnings("serial")
public class SlCompte extends HttpServlet {

    private static Logger logger = Logger.getLogger(SlCompte.class);

    private String erreur = "";
    private boolean showError = false;
    private EntrepriseDao entrepriseDao;
    private CandidatDao candidatDao;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String demande;
        String vueReponse = "/index.jsp";
        if(!this.showError)
        erreur = "";
        this.showError = false;
        request.getSession().removeAttribute("notifR");
        try {
            demande = getDemande(request);
            if (demande.equalsIgnoreCase("login.cpt")) {
                vueReponse = login(request);
            } else if (demande.equalsIgnoreCase("connecter.cpt")) {
                vueReponse = connecter(request);
            } else if (demande.equalsIgnoreCase("deconnecter.cpt")) {
                vueReponse = deconnecter(request);
            } else if (demande.equalsIgnoreCase("modifier_etu.cpt")) {
                vueReponse = modifier_etu(request);
            } else if (demande.equalsIgnoreCase("modifier_ent.cpt")) {
                vueReponse = modifier_ent(request);
            } else if (demande.equalsIgnoreCase("modifierCompte_etu.cpt")) {
                vueReponse = modifierCompte_etu(request);
            } else if (demande.equalsIgnoreCase("modifierCompte_ent.cpt")) {
                vueReponse = modifierCompte_ent(request);
            } else if (demande.equalsIgnoreCase("accueil.cpt")) {
                vueReponse = accueil(request);
            }
        } catch (Exception e) {
            this.showError = true;
            erreur = e.getMessage();

            if (!erreur.equals("")) {
                if (getDemande(request).equals("modifierCompte_etu.cpt")) {
                    vueReponse = "/modification_etu.jsp";
                }
                if (getDemande(request).equals("modifierCompte_ent.cpt")) {
                    vueReponse = "/modification_ent.jsp";
                }
                if (getDemande(request).equals("connecter.cpt")) {
                    vueReponse = "/login.cpt";
                }
            }

        } finally {
            logger.debug("Chargement de la page " + vueReponse);
            request.setAttribute("erreurR", erreur);
            request.setAttribute("pageR", vueReponse);
            RequestDispatcher dsp = request.getRequestDispatcher(vueReponse);
            dsp.forward(request, response);
        }
    }

    /**
     * Extrait le texte de la demande de l'URL
     *
     * @param request
     * @return String texte de la demande
     */
    private String getDemande(HttpServletRequest request) {
        String demande = "";
        demande = request.getRequestURI();
        demande = demande.substring(demande.lastIndexOf("/") + 1);
        return demande;
    }

    private String setDemande(HttpServletRequest request) {
        String demande = "";
        demande = request.getRequestURI();
        demande = demande.replace(getDemande(request), "login.jsp");
        demande = demande.substring(demande.lastIndexOf("/") + 1);
        return demande;
    }

    /**
     * Afficher la page de login
     *
     * @param request
     * @return
     * @throws Exception
     */
    private String login(HttpServletRequest request) throws Exception {
        try {
            return ("/login.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Vérifie que l'utilisateur a saisi le bon login et mot de passe
     *
     * @param request
     * @return String page de redirection
     * @throws Exception
     */
    private String connecter(HttpServletRequest request) throws Exception {
        String login, password, vueReponse;
        try {
            vueReponse = "/index.jsp";
            login = request.getParameter("login");
            password = request.getParameter("password");
            if ("admin".equals(login) && "polyforum2015".equals(password)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("idCompte", "admin");
                session.setAttribute("type", "admin");
                session.setAttribute("login", login);
                return "/admin.jsp";
            }
            candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
            entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
            int idCompte = candidatDao.connecter(login, password);
            HttpSession session = request.getSession(true);
            String type = "candidat";
            if (idCompte == -1) {
                idCompte = entrepriseDao.connecter(login, password);
                if (idCompte == -1) {
                    erreur = "Pseudo ou Mot de passe inconnu !";
                    type = "";
                    vueReponse = "/login.jsp";
                } else {
                    type = "entreprise";
                    Entreprise e = entrepriseDao.getById(idCompte);
                    session.setAttribute("idCompte", idCompte);
                    session.setAttribute("type", type);
                    session.setAttribute("login", login);
                    session.setAttribute("nom", e.getNom());
                    session.setAttribute("nom_representant", e.getNomRepresentant());
                }
            } else if (idCompte != -1) {
                session.setAttribute("idCompte", idCompte);
                session.setAttribute("type", type);
                session.setAttribute("login", login);
                Candidat c = candidatDao.getById(idCompte);
                session.setAttribute("nom", c.getNom());
                session.setAttribute("prenom", c.getPrenom());
            } else {
                type = "";
                vueReponse = "/login.jsp";
                erreur = "Pseudo ou Mot de passe inconnu !";
            }
            if ("entreprise".equals(type)) {
                vueReponse = "/index.jsp";
            }
            return (vueReponse);
        } catch (Exception e) {
            erreur = "Echec authentification";
            e.printStackTrace();
            logger.error(erreur);
            throw new Exception(erreur);
        }
    }

    private String deconnecter(HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession(true);
            session.setAttribute("idCompte", null);
            session.setAttribute("type", null);
            return ("/login.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

    private String modifier_etu(HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession(true);
            int idCandidat = (int) session.getAttribute("idCompte");
            String type = (String) session.getAttribute("type");
            if (type.equals("candidat")) {
                Candidat c = candidatDao.getById(idCandidat);
                session.setAttribute("nom", c.getNom());
                session.setAttribute("prenom", c.getPrenom());
            }
            return ("/modification_etu.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

    private String accueil(HttpServletRequest request) throws Exception {
        return ("/index.jsp");
    }

    private String modifier_ent(HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession(true);
            int idEntreprise = (int) session.getAttribute("idCompte");
            String type = (String) session.getAttribute("type");
            if (type.equals("entreprise")) {
                Entreprise e = entrepriseDao.getById(idEntreprise);
                session.setAttribute("nom", e.getNom());
                session.setAttribute("representant", e.getNomRepresentant());
            }
            return ("/modification_ent.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

    public String modifierCompte_etu(HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession(true);
            int idCandidat = (int) session.getAttribute("idCompte");
            String type = (String) session.getAttribute("type");
            String mdp_old = (String) request.getParameter("mdp_old");
            String mdp_new = request.getParameter("mdp_new");
            String mdp_new2 = request.getParameter("mdp_new2");
            Candidat candidat = candidatDao.getById(idCandidat);
            if (mdp_old.equals(candidat.getPassword())) {
                if (mdp_new.equals(mdp_new2)) {
                    candidat.setPassword(mdp_new);
                    candidatDao.updateCandidat(candidat);
                } else {
                    throw new Exception("La confirmation du mot de passe n'est pas bonne");
                }
            } else {
                throw new Exception("Votre ancien mot de passe n'est pas correct");
            }
            session.setAttribute("notifR", "Votre mot de passe a été modifié correctement");
            return ("/index.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

    public String modifierCompte_ent(HttpServletRequest request) throws Exception {
        try {
            HttpSession session = request.getSession(true);
            int idEntreprise = (int) session.getAttribute("idCompte");
            String type = (String) session.getAttribute("type");
            String mdp_old = (String) request.getParameter("mdp_old");
            String mdp_new = request.getParameter("mdp_new");
            String mdp_new2 = request.getParameter("mdp_new2");
            Entreprise e = entrepriseDao.getById(idEntreprise);
            if (mdp_old.equals(e.getPassword())) {
                if (mdp_new.equals(mdp_new2)) {
                    e.setPassword(mdp_new);
                    entrepriseDao.updateEntreprise(e);
                } else {
                    throw new Exception("La confirmation du mot de passe n'est pas bonne");
                }
            } else {
                throw new Exception("Votre ancien mot de passe n'est pas correct");
            }
            session.setAttribute("notifR", "Votre mot de passe a été modifié correctement");
            return ("/index.jsp");
        } catch (Exception e) {
            throw e;
        }
    }

//    private String validerCompte(HttpServletRequest request) throws Exception {
//        String vueReponse;
//        try {
//            
//            HttpSession session = request.getSession(true);
//            
//            String ident = request.getParameter("txtIdentite");
//            String login = request.getParameter("txtLogin");
//            String pwd = request.getParameter("txtPwd");
//            String credit = request.getParameter("txtCredits");
//            String adr = request.getParameter("txtAdresse");
//            String idCateg = request.getParameter("cbCategories");
//            if (session.getAttribute("userId") == null){
//                clientF.ajouterClient(Integer.valueOf(idCateg), ident, adr, Integer.valueOf(credit), login, pwd);
//                compteF.ajouterCompte(clientF.getLastCle(), Integer.valueOf(credit));
//                vueReponse = "/login.jsp";
//            } else {
//                clientF.majClient(Integer.valueOf(idCateg), ident, adr, Integer.valueOf(credit), login, pwd, session.getAttribute("userId").toString());
//                compteF.majSolde(Integer.valueOf(session.getAttribute("userId").toString()), Integer.valueOf(credit));
//                vueReponse = "/rechercher.jsp";
//            }
//            return (vueReponse);
//        } catch (Exception e) {
//            erreur = Utilitaire.getExceptionCause(e);
//            vueReponse = creerCompte(request);
//            return vueReponse;
//        }
//    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
