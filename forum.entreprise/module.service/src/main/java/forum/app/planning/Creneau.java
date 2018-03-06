package forum.app.planning;

import java.sql.Timestamp;
import java.util.Date;

public class Creneau {


	private int idEntreprise;
	private int idCandidat;
	private long debut;
	private long fin;
	
	public Creneau(){}

	public Creneau(int idEnt, int idEtu, long debut, long fin){
		this.idEntreprise = idEnt;
		this.idCandidat = idEtu;
		this.debut = debut;
		this.fin = fin;
		
	}
	
	public int getIdEntreprise() {
		return idEntreprise;
	}
	public void setIdEntreprise(int idEntreprise) {
		this.idEntreprise = idEntreprise;
	}
	public int getIdCandidat() {
		return idCandidat;
	}
	public void setIdCandidat(int idCandidat) {
		this.idCandidat = idCandidat;
	}
	public long getDebut() {
		return debut;
	}
	public void setDebut(long debut) {
		this.debut = debut;
	}
	public long getFin() {
		return fin;
	}
	public void setFin(long fin) {
		this.fin = fin;
	}
	
	public void print(){
		System.out.println("entreprise : " + idEntreprise + " : candidat : " + idCandidat + " : " + " debut : " + new Timestamp(debut) + " : " + " fin : " + new Timestamp(fin));
	}
	
	
	
}
