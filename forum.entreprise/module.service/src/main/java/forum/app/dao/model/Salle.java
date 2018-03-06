/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Epulapp
 */
@Entity
@Table(name = "salle")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Salle.findAll", query = "SELECT s FROM Salle s")
    , @NamedQuery(name = "Salle.findByIdSalle", query = "SELECT s FROM Salle s WHERE s.idSalle = :idSalle")
    , @NamedQuery(name = "Salle.findByDisponible", query = "SELECT s FROM Salle s WHERE s.disponible = :disponible")
    , @NamedQuery(name = "Salle.findByCapacite", query = "SELECT s FROM Salle s WHERE s.capacite = :capacite")
    , @NamedQuery(name = "Salle.findByCapaciteTotale", query = "SELECT s FROM Salle s WHERE s.capaciteTotale = :capaciteTotale")})
public class Salle implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_salle")
    private Integer idSalle;
    @Column(name = "disponible")
    private Boolean disponible;
    @Basic(optional = false)
    @Column(name = "capacite")
    private int capacite;
    @Basic(optional = false)
    @Column(name = "capacite_totale")
    private int capaciteTotale;

    public Salle() {
    }

    public Salle(Integer idSalle) {
        this.idSalle = idSalle;
    }

    public Salle(Integer idSalle, int capacite, int capaciteTotale) {
        this.idSalle = idSalle;
        this.capacite = capacite;
        this.capaciteTotale = capaciteTotale;
    }

    public Integer getIdSalle() {
        return idSalle;
    }

    public void setIdSalle(Integer idSalle) {
        this.idSalle = idSalle;
    }

    public Boolean getDisponible() {
        return disponible;
    }

    public void setDisponible(Boolean disponible) {
        this.disponible = disponible;
    }

    public int getCapacite() {
        return capacite;
    }

    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }

    public int getCapaciteTotale() {
        return capaciteTotale;
    }

    public void setCapaciteTotale(int capaciteTotale) {
        this.capaciteTotale = capaciteTotale;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSalle != null ? idSalle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Salle)) {
            return false;
        }
        Salle other = (Salle) object;
        if ((this.idSalle == null && other.idSalle != null) || (this.idSalle != null && !this.idSalle.equals(other.idSalle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.Salle[ idSalle=" + idSalle + " ]";
    }
    
}
