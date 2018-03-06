package forum.app.planning;

public class Priorite implements Comparable<Priorite> {

	private int idEntreprise;
	private int idCandidat;
	private int priorite;
	private boolean isEntreprise;
	private int duree;
	
	
	public Priorite(int idEntreprise, int idCandidat, int priorite, boolean bool, int duree) {
		this.idEntreprise=idEntreprise;
		this.idCandidat=idCandidat;
		this.priorite=priorite;
		this.isEntreprise=bool;
		this.duree=duree;
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
	public int getPriorite() {
		return priorite;
	}
	public void setPriorite(int priorite) {
		this.priorite = priorite;
	}
	public boolean isEntreprise() {
		return isEntreprise;
	}
	public void setIsEntreprise(boolean ent) {
		this.isEntreprise = ent;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}

	@Override
	public int compareTo(Priorite o) {
		if (this.getPriorite() < o.getPriorite()){
			return 1;
		} else {
			return -1;
		}
	}

	
	
}
