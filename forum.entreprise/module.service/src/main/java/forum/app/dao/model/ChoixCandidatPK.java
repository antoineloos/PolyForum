/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Epulapp
 */
@Embeddable
public class ChoixCandidatPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id_candidat")
    private int idCandidat;
    @Basic(optional = false)
    @Column(name = "id_entreprise")
    private int idEntreprise;

    public ChoixCandidatPK() {
    }

    public ChoixCandidatPK(int idCandidat, int idEntreprise) {
        this.idCandidat = idCandidat;
        this.idEntreprise = idEntreprise;
    }

    public int getIdCandidat() {
        return idCandidat;
    }

    public void setIdCandidat(int idCandidat) {
        this.idCandidat = idCandidat;
    }

    public int getIdEntreprise() {
        return idEntreprise;
    }

    public void setIdEntreprise(int idEntreprise) {
        this.idEntreprise = idEntreprise;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idCandidat;
        hash += (int) idEntreprise;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChoixCandidatPK)) {
            return false;
        }
        ChoixCandidatPK other = (ChoixCandidatPK) object;
        if (this.idCandidat != other.idCandidat) {
            return false;
        }
        if (this.idEntreprise != other.idEntreprise) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.ChoixCandidatPK[ idCandidat=" + idCandidat + ", idEntreprise=" + idEntreprise + " ]";
    }
    
}
