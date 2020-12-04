/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Asus
 */
public class Offre {
    public int Offr_Num;
    public String Description ;
    public Date DateOffre;
    public Date DateClotOffre;
    public Auteur Aut;
    public  Set<Client> Clients = new HashSet<>();
    public SecteurActivite Sect ;
    public byte[] file ;
    public String filePath ;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Offre(String Description, Date DateOffre, Date DateClotOffre, Auteur Aut, SecteurActivite Sect, byte[] file, String filePath) {
        this.Description = Description;
        this.DateOffre = DateOffre;
        this.DateClotOffre = DateClotOffre;
        this.Aut = Aut;
        this.Sect = Sect;
        this.file = file;
        this.filePath = filePath;
    }

    public Offre(String Description, Date DateOffre, Date DateClotOffre, byte[] file, String filePath) {
        this.Description = Description;
        this.DateOffre = DateOffre;
        this.DateClotOffre = DateClotOffre;
        this.file = file;
        this.filePath = filePath;
    }
    
    
    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
    public String getSecteurName(){
        return Sect.getLibelle();
    }
    
    public Offre() {
    }

    public Offre(int Offr_Num, String Desc, Date DateOffre, Date DateClotOffre) {
        this.Offr_Num = Offr_Num;
        this.Description = Desc;
        this.DateOffre = DateOffre;
        this.DateClotOffre = DateClotOffre;
    }
    
    
    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    
    public SecteurActivite getSect() {
        return Sect;
    }

    public void setSect(SecteurActivite sect) {
        this.Sect = sect;
    }
    
    
    public int getOffr_Num() {
        return Offr_Num;
    }

    public void setOffr_Num(int Offr_Num) {
        this.Offr_Num = Offr_Num;
    }

    public Date getDateOffre() {
        return DateOffre;
    }

    public void setDateOffre(Date DateOffre) {
        this.DateOffre = DateOffre;
    }

    public Date getDateClotOffre() {
        return DateClotOffre;
    }

    public void setDateClotOffre(Date DateClotOffre) {
        this.DateClotOffre = DateClotOffre;
    }


    public Auteur getAut() {
        return Aut;
    }

    public void setAut(Auteur Aut) {
        this.Aut = Aut;
    }

    public Set<Client> getClients() {
        return Clients;
    }

    public void setClients(Set<Client> Clients) {
        this.Clients = Clients;
    }
    public void addClient(Client c){
        this.Clients.add(c);
    }
    public void removeClient(Client c){
        this.Clients.remove(c);
    }
    
   
    
        
}
