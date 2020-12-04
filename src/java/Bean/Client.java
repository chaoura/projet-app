/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Asus
 */
public class Client {
    public int Clie_Num;
    public String Email;
    public String Password;
    public String Nom;
    public String Adresse;
     public  Set<Offre> Offres = new HashSet<>();
     
             
    public int getClie_Num() {
        return Clie_Num;
    }

    public void setClie_Num(int Clie_Num) {
        this.Clie_Num = Clie_Num;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        this.Password = password;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        this.Nom = nom;
    }

    public String getAdresse() {
        return Adresse;
    }

    public void setAdresse(String adresse) {
        this.Adresse = adresse;
    }

    public Set<Offre> getOffres() {
        return Offres;
    }

    public void setOffres(Set<Offre> Offres) {
        this.Offres = Offres;
    }
    
    public void addOffre(Offre o){
        this.Offres.add(o);
    }
    
    public void removeOffre(Offre o ){
        this.Offres.remove(o);
    }
    
    public Client() {
    }
    
    
    
}
