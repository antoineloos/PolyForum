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
public class EntretienPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id_entreprise")
    private int idEntreprise;
    @Basic(optional = false)
    @Column(name = "id_candidat")
    private int idCandidat;
    @Basic(optional = false)
    @Column(name = "id_salle")
    private int idSalle;

    public EntretienPK() {
    }

    public EntretienPK(int idEntreprise, int idCandidat, int idSalle) {
        this.idEntreprise = idEntreprise;
        this.idCandidat = idCandidat;
        this.idSalle = idSalle;
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

    public int getIdSalle() {
        return idSalle;
    }

    public void setIdSalle(int idSalle) {
        this.idSalle = idSalle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idEntreprise;
        hash += (int) idCandidat;
        hash += (int) idSalle;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EntretienPK)) {
            return false;
        }
        EntretienPK other = (EntretienPK) object;
        if (this.idEntreprise != other.idEntreprise) {
            return false;
        }
        if (this.idCandidat != other.idCandidat) {
            return false;
        }
        if (this.idSalle != other.idSalle) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.EntretienPK[ idEntreprise=" + idEntreprise + ", idCandidat=" + idCandidat + ", idSalle=" + idSalle + " ]";
    }
    
}
