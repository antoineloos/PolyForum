package forum.app.dao.util;

import java.text.SimpleDateFormat;

public class Utilitaire {
	/**
     * Transforme une chaîne en date selon le format passé en paramètre
     * @param strDate Chaîne contenant la date
     * @param formatDate Chaîne contenant le format
     * @return Date
     * @throws Exception
     */
    public static java.util.Date StrToDate(String strDate, String formatDate) throws Exception {
        java.util.Date date_retour = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat(formatDate);
            date_retour = format.parse(strDate);
        } catch (Exception e) {
        }
        return date_retour;
    }

    /**
     * Transforme une Date en chaîne
     * @param uneDate Date à transformer
     * @param formatDate Format de la date
     * @return Chaine correpondant à la date
     * @throws Exception
     */
    public static String DateToStr(java.util.Date uneDate, String formatDate) throws Exception {
        String date_retour = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat(formatDate);
            date_retour = format.format(uneDate);
        } catch (Exception e) {
        }
        return date_retour;
    }
    
   /**
     * Remonte à la cause initiale d'une Exception
     * @param e : Exception reçue
     * @return Message de l'exception d'origine
     */
    public static String getExceptionCause(Exception e){
        Throwable origine = (Throwable)e;
        Throwable src = origine.getCause();
        while (src != null){
            origine = src;
            src = origine.getCause();
        }
        return origine.getMessage();
    }
    
    /**
     * Creer le message à écrire dans les logs selon les pararmètres
     * @param id Id du compte en cours d'utilisation
     * @param type Type du compte
     * @param erreur A true si le message est une erreur
     * @return Message à écrire dans les logs
     */
    public static String creerMsgPourLogs(String id, String type, boolean erreur, String msg){
    	String msgFinal = "";
    	if(erreur){
    		msgFinal = "Compte ("+ id +") - Type (" + type + ") - Erreur: "+ msg;
    	}
    	else {
    		msgFinal = "Compte ("+ id +") - Type (" + type + ") - Chargement de la page: "+ msg;
    	}
    	return msgFinal;
    }
    
	public static String generatePassword(String nom) {
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
}
