package controleurs;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.Entreprise;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.util.Constantes;
import forum.app.dao.util.Fichier;
import forum.app.dao.util.Utilitaire;

/**
 * Servlet implementation class SlDocument
 */
public class SlDocument extends HttpServlet {

    private static Logger logger = Logger.getLogger(SlDocument.class);

    private static final long serialVersionUID = 1L;

    private String erreur = "";
    private String dirName;
    private String separator;
    private ResourceBundle rb = ResourceBundle.getBundle("config");

    private EntrepriseDao entrepriseDao;
    private CandidatDao candidatDao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SlDocument() {
    }

    public void initAttr() {
        entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
        candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
    }

    public void init(ServletConfig config) throws ServletException {
        /*super.init(config);
        // read the uploadDir from the servlet parameters
        dirName = config.getInitParameter("uploadDir");
        if (dirName == null) {
          throw new ServletException("Please supply uploadDir parameter");
        }
        /documents
         */
        dirName = rb.getString("path");
        separator = "\\";
        
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String type = (String) session.getAttribute("type");
        int idCompte = -1;
        if (!"admin".equals(type)) {
            idCompte = (int) session.getAttribute("idCompte");
        }
        request.getSession().removeAttribute("notifR");
        String demande;
        String vueReponse = "/index.jsp";
        erreur = "";
        initAttr();
        try {
            demande = getDemande(request);
            if (demande.equalsIgnoreCase("upload.file")) {
                vueReponse = uploadDocument(request, response);
            } else if (demande.equalsIgnoreCase("download.file")) {
                vueReponse = recupererListeDocuments(request, response);
            } else if (demande.equalsIgnoreCase("recupererFichier.file")) {
                vueReponse = downloadDocument(request, response);
            } else if (demande.equalsIgnoreCase("supprimerFichier.file")) {
                vueReponse = supprimerDocument(request, response);
            } else if (demande.equalsIgnoreCase("consulterCV.file")) {
                vueReponse = consulterDocuments(request, response, "CV");
            } else if (demande.equalsIgnoreCase("consulterOffres.file")) {
                vueReponse = consulterDocuments(request, response, "Offre");
            } else if (demande.equalsIgnoreCase("consulter.file")) {
                vueReponse = consulterDocuments(request, response, "");
            }
        } catch (Exception e) {
            erreur = e.getMessage();
            logger.error(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), type, true, erreur));
        } finally {
            request.setAttribute("erreurR", erreur);
            request.setAttribute("pageR", vueReponse);
            // Permet d'eviter les exceptions "java.lang.IllegalStateException: Committed" de jetty dans le cas d'un download de fichier
            if (!vueReponse.equals("OK")) {
                logger.debug(Utilitaire.creerMsgPourLogs(String.valueOf(idCompte), type, false, vueReponse));
                RequestDispatcher dsp = request.getRequestDispatcher(vueReponse);
                dsp.forward(request, response);
            }
        }
    }

    private String getDemande(HttpServletRequest request) {
        String demande = "";
        demande = request.getRequestURI();
        demande = demande.substring(demande.lastIndexOf("/") + 1);
        return demande;
    }

    public String uploadDocument(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final HttpSession session = request.getSession();
        response.setContentType("text/plain");
        try {
            String tempDirName = dirName;
            File tempDir = new File(tempDirName);
            if (!tempDir.exists()) {
                tempDir.mkdir();
            }
            MultipartRequest m = new MultipartRequest(request, dirName, 100000000);
            String fileName = m.getOriginalFileName("document");
            if (null != fileName) {
                File fileUpload = new File(dirName + separator + fileName);
                String type = (String) session.getAttribute("type");               
                if (type.equalsIgnoreCase("candidat")) {
                    int idCompte = (int) session.getAttribute("idCompte");
                    if (fileUpload.renameTo(new File(dirName + separator + "c_" + idCompte + "_" + fileName)) == false) {                       
                        System.err.println("Error Rename ! : "+dirName + separator + "c_" + idCompte + "_" + fileName);
                    }
                } else if (type.equalsIgnoreCase("entreprise")) {
                    int idCompte = (int) session.getAttribute("idCompte");
                    if (fileUpload.renameTo(new File(dirName + separator + "e_" + idCompte + "_" + fileName)) == false) {
                        System.out.println("Error Rename !");
                    }
                } else if (type.equalsIgnoreCase("admin")){
                    int idCompte = 0;
                    fileUpload.renameTo(new File(dirName + separator + "a_" + idCompte + "_" + fileName));
                    System.out.println("Error Rename !");
                }
            }
        } catch (IOException lEx) {
            System.err.println("Erreur durant l'upload du fichier");
        }
        return recupererListeDocuments(request, response);
    }

    public String recupererListeDocuments(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String type = (String) session.getAttribute("type");
        int idCompte = -1;
        if (type.equalsIgnoreCase("candidat") || type.equalsIgnoreCase("entreprise")){
            idCompte = (int) session.getAttribute("idCompte");
        } else if (type.equalsIgnoreCase("admin")){
            idCompte = 0;
        }
        File repertoire = new File(dirName);
        String[] listeFile = repertoire.list();
        List<Fichier> listeFichiers = new ArrayList<Fichier>();
        if (null != listeFile) {
            for (int i = 0; i < listeFile.length; i++) {
                File file = new File(listeFile[i]);
                Fichier fichier = new Fichier(file);
                if (type.equalsIgnoreCase(fichier.getType()) && Integer.toString(idCompte).equalsIgnoreCase(fichier.getIdCompte())) {
                    listeFichiers.add(fichier);
                }
            }
        }
        session.setAttribute("listeFichiers", listeFichiers);
        return "/uploadDocument.jsp";
    }

    public String consulterDocuments(HttpServletRequest request, HttpServletResponse response, String typeDocs) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String type = (String) session.getAttribute("type");
        File repertoire = new File(dirName);
        String[] listeFile = repertoire.list();
        List<Fichier> listeFichiers = new ArrayList<Fichier>();
        logger.info("On tente de lire les fichiers");
        if (null != listeFile) {
            logger.info("Il y a : " + listeFile.length + " fichiers.");
            for (int i = 0; i < listeFile.length; i++) {
                File file = new File(listeFile[i]);
                Fichier fichier = new Fichier(file);
                if (type.equalsIgnoreCase("entreprise")) {
                    if (fichier.getType().equalsIgnoreCase("candidat")) {
                        Candidat c = candidatDao.getById(Integer.parseInt(fichier.getIdCompte()));
                        if (c != null) {
                            fichier.setNomProprietaire(c.getPrenom() + " " + c.getNom());
                            listeFichiers.add(fichier);
                        }
                    } else if (fichier.getType().equalsIgnoreCase("admin")) {
                        fichier.setNomProprietaire("Administrateur");
                        listeFichiers.add(fichier);
                    }
                } else if (type.equalsIgnoreCase("candidat")) {
                    if (fichier.getType().equalsIgnoreCase("entreprise")) {
                        Entreprise e = entrepriseDao.getById(Integer.parseInt(fichier.getIdCompte()));
                        if (e != null) {
                            fichier.setNomProprietaire(e.getNom());
                            listeFichiers.add(fichier);
                        }
                    } else if (fichier.getType().equalsIgnoreCase("admin")) {
                        fichier.setNomProprietaire("Administrateur");
                        listeFichiers.add(fichier);
                    }
                } else if (type.equalsIgnoreCase("admin")) {
                    if (fichier.getType().equalsIgnoreCase("candidat") && typeDocs.equalsIgnoreCase("CV")) {
                        Candidat c = candidatDao.getById(Integer.parseInt(fichier.getIdCompte()));
                        if (c != null) {
                            fichier.setNomProprietaire(c.getPrenom() + " " + c.getNom());
                            listeFichiers.add(fichier);
                        }
                    } else if (fichier.getType().equalsIgnoreCase("entreprise") && typeDocs.equalsIgnoreCase("Offre")) {
                        Entreprise e = entrepriseDao.getById(Integer.parseInt(fichier.getIdCompte()));
                        if (e != null) {
                            fichier.setNomProprietaire(e.getNom());
                            listeFichiers.add(fichier);
                        }
                    } else if (fichier.getType().equalsIgnoreCase("admin")) {
                        fichier.setNomProprietaire("Administrateur");
                        listeFichiers.add(fichier);
                    }
                }
            }
        }
        logger.info("On montre les " + listeFichiers.size() + " fichiers");
        session.setAttribute("listeFichiers", listeFichiers);
        return "/consulterDocuments.jsp";
    }

    public String supprimerDocument(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("remove");
        File file = new File(dirName + separator + filename);
        file.delete();
        return recupererListeDocuments(request, response);
    }

    public String downloadDocument(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("bouton");
        response.setContentType("application/download");
        response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");

        ServletOutputStream out = response.getOutputStream();
        File file = null;
        BufferedInputStream from = null;
        try {
            file = new File(dirName + separator + filename);
            response.setContentLength((int) file.length());
            int bufferSize = 64 * 1024;

            from = new BufferedInputStream(new FileInputStream(file), bufferSize * 2);
            byte[] bufferFile = new byte[bufferSize];

            for (int i = 0;; i++) {

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

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
