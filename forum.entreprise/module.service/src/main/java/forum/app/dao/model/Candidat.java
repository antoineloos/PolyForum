/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forum.app.dao.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Epulapp
 */
@Entity
@Table(name = "candidat")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Candidat.findAll", query = "SELECT c FROM Candidat c")
    , @NamedQuery(name = "Candidat.findByIdCandidat", query = "SELECT c FROM Candidat c WHERE c.idCandidat = :idCandidat")
    , @NamedQuery(name = "Candidat.findByNom", query = "SELECT c FROM Candidat c WHERE c.nom = :nom")
    , @NamedQuery(name = "Candidat.findByPrenom", query = "SELECT c FROM Candidat c WHERE c.prenom = :prenom")
    , @NamedQuery(name = "Candidat.findByTrouve", query = "SELECT c FROM Candidat c WHERE c.trouve = :trouve")
    , @NamedQuery(name = "Candidat.findByPresent", query = "SELECT c FROM Candidat c WHERE c.present = :present")
    , @NamedQuery(name = "Candidat.findByLogin", query = "SELECT c FROM Candidat c WHERE c.login = :login")
    , @NamedQuery(name = "Candidat.findByPassword", query = "SELECT c FROM Candidat c WHERE c.password = :password")})
public class Candidat implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_candidat")
    private Integer idCandidat;
    @Basic(optional = false)
    @Column(name = "nom")
    private String nom;
    @Column(name = "prenom")
    private String prenom;
    @Column(name = "trouve")
    private Boolean trouve;
    @Column(name = "present")
    private Boolean present;
    @Column(name = "login")
    private String login;
    @Column(name = "password")
    private String password;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidat")
    private Collection<ChoixEntreprise> choixEntrepriseCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidat")
    private Collection<ChoixCandidat> choixCandidatCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "candidat")
    private Collection<Entretien> entretienCollection;

    public Candidat() {
    }

    public Candidat(Integer idCandidat) {
        this.idCandidat = idCandidat;
    }

    public Candidat(Integer idCandidat, String nom) {
        this.idCandidat = idCandidat;
        this.nom = nom;
    }

    public Integer getIdCandidat() {
        return idCandidat;
    }

    public void setIdCandidat(Integer idCandidat) {
        this.idCandidat = idCandidat;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Boolean getTrouve() {
        return trouve;
    }

    public void setTrouve(Boolean trouve) {
        this.trouve = trouve;
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

    @XmlTransient
    public Collection<ChoixEntreprise> getChoixEntrepriseCollection() {
        return choixEntrepriseCollection;
    }

    public void setChoixEntrepriseCollection(Collection<ChoixEntreprise> choixEntrepriseCollection) {
        this.choixEntrepriseCollection = choixEntrepriseCollection;
    }

    @XmlTransient
    public Collection<ChoixCandidat> getChoixCandidatCollection() {
        return choixCandidatCollection;
    }

    public void setChoixCandidatCollection(Collection<ChoixCandidat> choixCandidatCollection) {
        this.choixCandidatCollection = choixCandidatCollection;
    }

    @XmlTransient
    public Collection<Entretien> getEntretienCollection() {
        return entretienCollection;
    }

    public void setEntretienCollection(Collection<Entretien> entretienCollection) {
        this.entretienCollection = entretienCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCandidat != null ? idCandidat.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Candidat)) {
            return false;
        }
        Candidat other = (Candidat) object;
        if ((this.idCandidat == null && other.idCandidat != null) || (this.idCandidat != null && !this.idCandidat.equals(other.idCandidat))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "forum.app.dao.model.Candidat[ idCandidat=" + idCandidat + " ]";
    }
    
}
