package forum.app.dao.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.mysql.jdbc.StringUtils;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.Entreprise;

public class ImportExcel {
	 
	public static List<Candidat> excelRecupererCandidat(String nomFichier){
		List<Candidat> listeCandidats = new ArrayList<Candidat>();
		final File file = new File(nomFichier);

	    try {
	        final Workbook workbook = WorkbookFactory.create(file);
	        final Sheet sheet = workbook.getSheet("Feuil1");
	        
	        // On saute les deux premières lignes qui corre
	        int index = 2;
	        Row row = sheet.getRow(index++);
	        while(row != null){
	        	final Candidat c = rowToCandidat(row);
	        	if(c != null){
	        		listeCandidats.add(c);
	        	}
	        	
	        	row = sheet.getRow(index++);
	        }
	    }
	    catch (InvalidFormatException | IOException e) {
	        e.printStackTrace();
	    }
	    return listeCandidats;
	}
	
	public static Candidat rowToCandidat(final Row row){
		final Candidat c = new Candidat();
		
		// Récupération du nom du Candidat
		final String nom = row.getCell(0).getStringCellValue();
		c.setNom(nom);
		
		// Récupération du prénom du Candidat
		final String prenom = row.getCell(1).getStringCellValue();
		c.setPrenom(prenom);
		
		// Récupération du mail du Candidat
		final String mail = row.getCell(2).getStringCellValue();
		c.setLogin(mail);
		
		// Initialisation des autres attributs du Candidat
		//c.setPassword(Utilitaire.generatePassword(mail));
		c.setPresent(true);
		c.setTrouve(false);
		
		if(!StringUtils.isNullOrEmpty(c.getNom()) && !StringUtils.isNullOrEmpty(c.getPrenom()) && !StringUtils.isNullOrEmpty(c.getLogin())){
			return c;
		}
		else {
			return null;
		}
	}
	
	public static List<Entreprise> excelRecupererEntreprise(String nomFichier){
		List<Entreprise> listeEntreprises = new ArrayList<Entreprise>();
		final File file = new File(nomFichier);

	    try {
	        final Workbook workbook = WorkbookFactory.create(file);
	        final Sheet sheet = workbook.getSheet("Feuil1");
	        
	        // On saute les deux premières lignes qui corre
	        int index = 2;
	        Row row = sheet.getRow(index++);
	        while(row != null){
	        	final Entreprise e = rowToEntreprise(row);
	        	if(e != null){
	        		listeEntreprises.add(e);
	        	}
	        	
	        	row = sheet.getRow(index++);
	        }
	    }
	    catch (InvalidFormatException | IOException e) {
	        e.printStackTrace();
	    }
	    return listeEntreprises;
	}
	
	public static Entreprise rowToEntreprise(final Row row){
		final Entreprise e = new Entreprise();
		
		// Récupération du nom du Entreprise
		final String nom = row.getCell(0).getStringCellValue();
		e.setNom(nom);
		
		// Récupération du représentant du Entreprise
		final String nomPresentant = row.getCell(1).getStringCellValue();
		e.setNomRepresentant(nomPresentant);
		
		// Récupération du mail du Entreprise
		final String mail = row.getCell(2).getStringCellValue();
		e.setLogin(mail);
		
		// Initialisation des autres attributs du Entreprise
		//e.setPassword(Utilitaire.generatePassword(mail));
		e.setPresent(true);

		if(!StringUtils.isNullOrEmpty(e.getNom()) && !StringUtils.isNullOrEmpty(e.getLogin())){
			return e;
		}
		else {
			return null;
		}
	}
}
