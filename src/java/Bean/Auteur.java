/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Asus
 */
public class Auteur {
     public int Numero;
   public String Email;
    public String Password;

    public int getNumero() {
        return Numero;
    }

    public void setNumero(int Numero) {
        this.Numero = Numero;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

     

    public Auteur() {
    }
    
    public Boolean isEmpty(){
        Boolean b;
        
        if (this.Email.equals(""))b=true;
        
        else b=false;
        return b;
        
    }
}
