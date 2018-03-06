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
@Table(name = "entreprise")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Entreprise.findAll", query = "SELECT e FROM Entreprise e")
    , @NamedQuery(name = "Entreprise.findByIdEntreprise", query = "SELECT e FROM Entreprise e WHERE e.idEntreprise = :idEntreprise")
    , @NamedQuery(name = "Entreprise.findByNom", query = "SELECT e FROM Entreprise e WHERE e.nom = :nom")
    , @NamedQuery(name = "Entreprise.findByNomRepresentant", query = "SELECT e FROM Entreprise e WHERE e.nomRepresentant = :nomRepresentant")
    , @NamedQuery(name = "Entreprise.findByPresent", query = "SELECT e FROM Entreprise e WHERE e.present = :present")
    , @NamedQuery(name = "Entreprise.findByLogin", query = "SELECT e FROM Entreprise e WHERE e.login = :login")
    , @NamedQuery(name = "Entreprise.findByPassword", query = "SELECT e FROM Entreprise e WHERE e.password = :password")})
public class Entreprise implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_entreprise")
    private Integer idEntreprise;
    @Basic(optional = false)
    @Column(name = "nom")
    private String nom;
    @Column(name = "nom_representant")
    private String nomRepresentant;
    @Column(name = "present")
    private Boolean present;
    @Column(name = "login")
    private String login;
    @Column(name = "password")
    private String password;

    public Entreprise() {
    }

    public Entreprise(Integer idEntreprise) {
        this.idEntreprise = idEntreprise;
    }

    public Entreprise(Integer idEntreprise, String nom) {
        this.idEntreprise = idEntreprise;
        this.nom = nom;
    }

    public Integer getIdEntreprise() {
        return idEntreprise;
    }

    public void setIdEntreprise(Integer idEntreprise) {
        this.idEntreprise = idEntreprise;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNomRepresentant() {
        return nomRepresentant;
    }

    public void setNomRepresentant(String nomRepresentant) {
        this.nomRepresentant = nomRepresentant;
    }

    public Boolean getPresent() {
        return present;
    }

    public void setPresent(Boolean present) {
        this.present = present;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEntreprise != null ? idEntreprise.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Entreprise)) {
            return false;
        }
        Entreprise other = (Entreprise) object;
        if ((this.idEntreprise == null && other.idEntreprise != null) || (this.idEntreprise != null && !this.idEntreprise.equals(other.idEntreprise))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.Entreprise[ idEntreprise=" + idEntreprise + " ]";
    }
    
}
