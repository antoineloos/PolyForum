package forum.app.dao.impl;

import forum.app.dao.util.Constantes;

public class DaoFactory {
	
	public static Object getDaoInstance(String typeOfDao){
		if (Constantes.CANDIDAT.equalsIgnoreCase(typeOfDao)){
			return new CandidatDao();
		}
		if (Constantes.ENTREPRISE.equalsIgnoreCase(typeOfDao)){
			return new EntrepriseDao();
		}
		if (Constantes.ENTRETIEN.equalsIgnoreCase(typeOfDao)){
			return new EntretienDao();
		}		
		if (Constantes.CHOIX_CANDIDAT.equalsIgnoreCase(typeOfDao)){
			return new ChoixCandidatDao();
		}
		if (Constantes.CHOIX_ENTREPRISE.equalsIgnoreCase(typeOfDao)){
			return new ChoixEntrepriseDao();
		}
		
		return null;
	}
}
