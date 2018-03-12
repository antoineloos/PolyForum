/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Epulapp
 */
@Entity
@Table(name = "entretien")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Entretien.findAll", query = "SELECT e FROM Entretien e")
    , @NamedQuery(name = "Entretien.findByIdEntreprise", query = "SELECT e FROM Entretien e WHERE e.entretienPK.idEntreprise = :idEntreprise")
    , @NamedQuery(name = "Entretien.findByIdCandidat", query = "SELECT e FROM Entretien e WHERE e.entretienPK.idCandidat = :idCandidat")
    , @NamedQuery(name = "Entretien.findByHeure", query = "SELECT e FROM Entretien e WHERE e.heure = :heure")
    , @NamedQuery(name = "Entretien.findByHeureFin", query = "SELECT e FROM Entretien e WHERE e.heureFin = :heureFin")
    , @NamedQuery(name = "Entretien.findByIdSalle", query = "SELECT e FROM Entretien e WHERE e.idSalle = :idSalle")
    , @NamedQuery(name = "Entretien.findByPresent", query = "SELECT e FROM Entretien e WHERE e.present = :present")
    , @NamedQuery(name = "Entretien.findByRetard", query = "SELECT e FROM Entretien e WHERE e.retard = :retard")})
public class Entretien implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected EntretienPK entretienPK;
    @Basic(optional = false)
    @Column(name = "heure")
    @Temporal(TemporalType.TIME)
    private Date heure;
    @Basic(optional = false)
    @Column(name = "heure_fin")
    @Temporal(TemporalType.TIME)
    private Date heureFin;
    @Column(name = "id_salle")
    private String idSalle;
    @Column(name = "present")
    private Boolean present;
    @Column(name = "retard")
    private Boolean retard;
    
    @Transient
    private Candidat candidat;
    
     @Transient
    private Entreprise entreprise;

    public Candidat getCandidat() {
        return candidat;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

    public Entreprise getEntreprise() {
        return entreprise;
    }

    public void setEntreprise(Entreprise entreprise) {
        this.entreprise = entreprise;
    }

    public Entretien() {
    }

    public Entretien(EntretienPK entretienPK) {
        this.entretienPK = entretienPK;
    }

    public Entretien(EntretienPK entretienPK, Date heure, Date heureFin) {
        this.entretienPK = entretienPK;
        this.heure = heure;
        this.heureFin = heureFin;
    }

    public Entretien(int idEntreprise, int idCandidat) {
        this.entretienPK = new EntretienPK(idEntreprise, idCandidat);
    }

    public EntretienPK getEntretienPK() {
        return entretienPK;
    }

    public void setEntretienPK(EntretienPK entretienPK) {
        this.entretienPK = entretienPK;
    }

    public Date getHeure() {
        return heure;
    }

    public void setHeure(Date heure) {
        this.heure = heure;
    }

    public Date getHeureFin() {
        return heureFin;
    }

    public void setHeureFin(Date heureFin) {
        this.heureFin = heureFin;
    }

    public String getIdSalle() {
        return idSalle;
    }

    public void setIdSalle(String idSalle) {
        this.idSalle = idSalle;
    }

    public Boolean getPresent() {
        return present;
    }

    public void setPresent(Boolean present) {
        this.present = present;
    }

    public Boolean getRetard() {
        return retard;
    }

    public void setRetard(Boolean retard) {
        this.retard = retard;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (entretienPK != null ? entretienPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Entretien)) {
            return false;
        }
        Entretien other = (Entretien) object;
        if ((this.entretienPK == null && other.entretienPK != null) || (this.entretienPK != null && !this.entretienPK.equals(other.entretienPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.Entretien[ entretienPK=" + entretienPK + " ]";
    }
    
}
