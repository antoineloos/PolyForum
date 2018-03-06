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
public class ChoixEntreprisePK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id_entreprise")
    private int idEntreprise;
    @Basic(optional = false)
    @Column(name = "id_candidat")
    private int idCandidat;

    public ChoixEntreprisePK() {
    }

    public ChoixEntreprisePK(int idEntreprise, int idCandidat) {
        this.idEntreprise = idEntreprise;
        this.idCandidat = idCandidat;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idEntreprise;
        hash += (int) idCandidat;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChoixEntreprisePK)) {
            return false;
        }
        ChoixEntreprisePK other = (ChoixEntreprisePK) object;
        if (this.idEntreprise != other.idEntreprise) {
            return false;
        }
        if (this.idCandidat != other.idCandidat) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.ChoixEntreprisePK[ idEntreprise=" + idEntreprise + ", idCandidat=" + idCandidat + " ]";
    }
    
}
