package forum.app.dao.util;

import java.io.File;

import org.apache.commons.io.FilenameUtils;

public class Fichier {
	
	String nomSansExtension;
	
	String extension;
	
	String idCompte;
	
	String type;
	
	File file;
	
	String nomProprietaire;

	public Fichier(File file) {
		this.file = file;
		String nomCompletSansExtension = FilenameUtils.getBaseName(file.getName());
		String[] typeIdNom = nomCompletSansExtension.split("_");
		if(typeIdNom.length >= 3){
			if(typeIdNom[0].equalsIgnoreCase("e_")){
				type = "entreprise";
			}
			else if(typeIdNom[0].equalsIgnoreCase("c_")){
				type = "candidat";
			}
			else {
				type = "admin";
			}
			idCompte = typeIdNom[1];
			nomSansExtension = "";
			for(int i = 2; i < typeIdNom.length; i++){
				if(i != 2){
					nomSansExtension = nomSansExtension + "_" + typeIdNom[i];
				}
				else {
					nomSansExtension = typeIdNom[i];
				}
			}
		}
		else {
			type = "";
			idCompte = "";
			nomSansExtension = nomCompletSansExtension;
		}
		extension = FilenameUtils.getExtension(file.getName()).toUpperCase();
	}

	public String getNomSansExtension() {
		return nomSansExtension;
	}

	public void setNomSansExtension(String nomSansExtension) {
		this.nomSansExtension = nomSansExtension;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getIdCompte() {
		return idCompte;
	}

	public void setIdCompte(String idCompte) {
		this.idCompte = idCompte;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNomProprietaire() {
		return nomProprietaire;
	}

	public void setNomProprietaire(String nomProprietaire) {
		this.nomProprietaire = nomProprietaire;
	}
	
}
