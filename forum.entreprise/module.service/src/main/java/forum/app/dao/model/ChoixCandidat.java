/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import forum.app.dao.impl.EntrepriseDao;
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
@Table(name = "choix_candidat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChoixCandidat.findAll", query = "SELECT c FROM ChoixCandidat c")
    , @NamedQuery(name = "ChoixCandidat.findByIdCandidat", query = "SELECT c FROM ChoixCandidat c WHERE c.choixCandidatPK.idCandidat = :idCandidat")
    , @NamedQuery(name = "ChoixCandidat.findByIdEntreprise", query = "SELECT c FROM ChoixCandidat c WHERE c.choixCandidatPK.idEntreprise = :idEntreprise")
    , @NamedQuery(name = "ChoixCandidat.findByPriorite", query = "SELECT c FROM ChoixCandidat c WHERE c.priorite = :priorite")})
public class ChoixCandidat implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ChoixCandidatPK choixCandidatPK;
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
    private EntrepriseDao entDAO;

    public ChoixCandidat() {
        entDAO = new EntrepriseDao();
    }

    public Entreprise getEntreprise() {
        return entDAO.getById(this.choixCandidatPK.getIdEntreprise());
    }

    public ChoixCandidat(ChoixCandidatPK choixCandidatPK) {
        this.choixCandidatPK = choixCandidatPK;
    }

    public ChoixCandidat(ChoixCandidatPK choixCandidatPK, int priorite) {
        this.choixCandidatPK = choixCandidatPK;
        this.priorite = priorite;
    }

    public ChoixCandidat(int idCandidat, int idEntreprise) {
        this.choixCandidatPK = new ChoixCandidatPK(idCandidat, idEntreprise);
    }

    public ChoixCandidatPK getChoixCandidatPK() {
        return choixCandidatPK;
    }

    public void setChoixCandidatPK(ChoixCandidatPK choixCandidatPK) {
        this.choixCandidatPK = choixCandidatPK;
    }

    public int getPriorite() {
        return priorite;
    }

    public void setPriorite(int priorite) {
        this.priorite = priorite;
    }

    public Candidat getCandidat() {
        return candidat;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

   

    public void setEntreprise(Entreprise entreprise) {
        this.entreprise = entreprise;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (choixCandidatPK != null ? choixCandidatPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChoixCandidat)) {
            return false;
        }
        ChoixCandidat other = (ChoixCandidat) object;
        if ((this.choixCandidatPK == null && other.choixCandidatPK != null) || (this.choixCandidatPK != null && !this.choixCandidatPK.equals(other.choixCandidatPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.ChoixCandidat[ choixCandidatPK=" + choixCandidatPK + " ]";
    }

}
