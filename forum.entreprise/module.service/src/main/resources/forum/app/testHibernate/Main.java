package forum.app.testHibernate;

import java.util.List;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.planning.Plannification;

public class Main {

	public static void main(String[] args) {
		Plannification p = new Plannification();
		try {
			p.genererPlanning();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				

				
		return;
	}

	public static void printChoixCandidat(List<ChoixCandidat> choix){
		for (ChoixCandidat c: choix){
			printChoix(c);
		}
	}

	public static void printChoix(ChoixCandidat choix){
		System.out.println("--- CHOICE INFO ---");
		System.out.println("candidat : " + choix.getChoixCandidatPK().getIdCandidat());
		System.out.println("entreprise : " + choix.getChoixCandidatPK().getIdEntreprise());
		System.out.println("priorite : " + choix.getPriorite());
	}
	
	public static void printChoix(ChoixEntreprise choix){
		System.out.println("--- CHOICE INFO ---");
		System.out.println("candidat : " + choix.getChoixEntreprisePK().getIdCandidat());
		System.out.println("entreprise : " + choix.getChoixEntreprisePK().getIdEntreprise());
		System.out.println("priorite : " + choix.getPriorite());
	}
	
	public static void printCandidat(Candidat candidat){
		System.out.println("--- USER INFO ---");
		System.out.println("nom : " + candidat.getNom());
		System.out.println("prenom : " + candidat.getPrenom());
	}
	
	public static void printCandidat(List<Candidat> candidats){
		for (Candidat c: candidats){
			printCandidat(c);
		}
	}

}
