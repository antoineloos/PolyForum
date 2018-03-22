/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import forum.app.dao.impl.CandidatDao;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Epulapp
 */
@Entity
@Table(name = "choix_entreprise")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChoixEntreprise.findAll", query = "SELECT c FROM ChoixEntreprise c")
    , @NamedQuery(name = "ChoixEntreprise.findByIdEntreprise", query = "SELECT c FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idEntreprise = :idEntreprise")
    , @NamedQuery(name = "ChoixEntreprise.findByIdCandidat", query = "SELECT c FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idCandidat = :idCandidat")
    , @NamedQuery(name = "ChoixEntreprise.findByTempsVoulu", query = "SELECT c FROM ChoixEntreprise c WHERE c.tempsVoulu = :tempsVoulu")
    , @NamedQuery(name = "ChoixEntreprise.findByPriorite", query = "SELECT c FROM ChoixEntreprise c WHERE c.priorite = :priorite")})
public class ChoixEntreprise implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ChoixEntreprisePK choixEntreprisePK;
    @Basic(optional = false)
    @Column(name = "temps_voulu")
    private int tempsVoulu;
    @Basic(optional = false)
    @Column(name = "priorite")
    private int priorite;
    @JoinColumn(name = "id_candidat", referencedColumnName = "id_candidat", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Candidat candidat;
    @JoinColumn(name = "id_entreprise", referencedColumnName = "id_entreprise", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Entreprise entreprise;

    @Transient
    private CandidatDao canDAO;

    public ChoixEntreprise() {
        canDAO = new CandidatDao();
    }

    public ChoixEntreprise(ChoixEntreprisePK choixEntreprisePK) {
        this.choixEntreprisePK = choixEntreprisePK;
    }

    public ChoixEntreprise(ChoixEntreprisePK choixEntreprisePK, int tempsVoulu, int priorite) {
        this.choixEntreprisePK = choixEntreprisePK;
        this.tempsVoulu = tempsVoulu;
        this.priorite = priorite;
    }
    
    public Candidat getCandidat()
    {
        return canDAO.getById(this.choixEntreprisePK.getIdCandidat());
    }

    public ChoixEntreprise(int idEntreprise, int idCandidat) {
        this.choixEntreprisePK = new ChoixEntreprisePK(idEntreprise, idCandidat);
    }

    public ChoixEntreprisePK getChoixEntreprisePK() {
        return choixEntreprisePK;
    }

    public void setChoixEntreprisePK(ChoixEntreprisePK choixEntreprisePK) {
        this.choixEntreprisePK = choixEntreprisePK;
    }

    public int getTempsVoulu() {
        return tempsVoulu;
    }

    public void setTempsVoulu(int tempsVoulu) {
        this.tempsVoulu = tempsVoulu;
    }

    public int getPriorite() {
        return priorite;
    }

    public void setPriorite(int priorite) {
        this.priorite = priorite;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (choixEntreprisePK != null ? choixEntreprisePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChoixEntreprise)) {
            return false;
        }
        ChoixEntreprise other = (ChoixEntreprise) object;
        if ((this.choixEntreprisePK == null && other.choixEntreprisePK != null) || (this.choixEntreprisePK != null && !this.choixEntreprisePK.equals(other.choixEntreprisePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.ChoixEntreprise[ choixEntreprisePK=" + choixEntreprisePK + " ]";
    }

}
