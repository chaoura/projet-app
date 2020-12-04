/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.sql.Blob;
import java.util.Date;

/**
 *
 * @author Asus
 */
public class Soumission {
    public int Numero;
    public String Description;
    public Date DateSoumission;
    public Client Client=new Client();
    public Offre Offr= new Offre();   
     public byte[] file ; 

      public Soumission() {
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
      
    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
        
     
    public Offre getOffr() {
        return Offr;
    }

    public void setOffr(Offre Offr) {
        this.Offr = Offr;
    }
    
    
    public int getNumero() {
        return Numero;
    }

    public void setNumero(int Numero) {
        this.Numero = Numero;
    }

    public Date getDateSoumission() {
        return DateSoumission;
    }

    public void setDateSoumission(Date DateSoumission) {
        this.DateSoumission = DateSoumission;
    }

  

    public Client getClient() {
        return Client;
    }

    public void setClient(Client c) {
        this.Client = c;
    }

   
    
    
}
