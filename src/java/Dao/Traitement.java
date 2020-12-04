/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Bean.*;
import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Asus
 */
public class Traitement {
    
            public static List<Soumission> FindSoumissionByClient(Client c ){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
       List<Soumission> Soumissions =new ArrayList<Soumission>();
        
         Soumissions= s.createQuery("from Soumission where Client = "+c.getClie_Num()).list();
   
      
        tr.commit();
        s.close();
        
        return Soumissions;
    }
    public static List<Soumission> FetchSoumission(){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
       List<Soumission> Soumissions =new ArrayList<Soumission>();
        
        Soumissions = s.createQuery("from Soumission").list();
        tr.commit();
        s.close();
        
        return Soumissions;
    }
   
      public static int DeleteSoumissonByClient(int id_client){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
          Client c =new Client();
          c=FetchClient(id_client);
     
          Query query =s.createQuery("delete from Soumission where Client = :id ");
        
                query.setParameter("id", c);
                
                int result = query.executeUpdate();
                tr.commit();
                s.close();
                
                return result ;
    }
       public static int DeleteSoumissonByOffre(int id_offre){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
         Offre o = new Offre();
         o=FindOffre(id_offre);
     
          Query query =s.createQuery("delete from Soumission where Offr = :id ");
        
                query.setParameter("id", o);
                
                int result = query.executeUpdate();
                tr.commit();
                s.close();
                
                return result ;
    }
    public static int DeleteClient(int id){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
            DeleteSoumissonByClient(id);
            
        Query query =s.createQuery("delete from Client where Clie_Num = :id ");
        
                query.setParameter("id", id);
                int result = query.executeUpdate();
                tr.commit();
                s.close();
                
                return result ;
    }
   public static int UpdateAuteur(int id,String Email,String Pass){
     Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
       
       Query query =s.createQuery("update Auteur set Email = :Email , Password = :Pass  where Numero = :id ");
          
               query.setParameter("Email", Email);
               query.setParameter("Pass", Pass); 
                query.setParameter("id", id); 
                int result = query.executeUpdate();
                tr.commit();
                
                s.close();
                
                return result;
   }
   public static int UpdateClient(int id,String Nom,String Adresse,String Email,String Password){
     Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
       
       Query query =s.createQuery("update Client set Nom = :Nom ,Adresse = :Adresse ,Email = :Email , Password = :Password  where Clie_Num = :id ");
                
              query.setParameter("Nom", Nom);    
                query.setParameter("Adresse", Adresse); 
               query.setParameter("Email", Email);
               query.setParameter("Password", Password); 
                query.setParameter("id", id); 
                int result = query.executeUpdate();
                tr.commit();
                
                s.close();
                
                return result;
    }
    public static List<Client> FetchClient(){
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        List<Client> client =new ArrayList<Client>();
        
        client = s.createQuery("from Client").list();
        tr.commit();
        s.close();
        
        return client;
        
        
    }
    public static int AjoutClient(String nom,String adresse,String email,String password ){
          Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Client c=new Client();
        c.setNom(nom);
        c.setAdresse(adresse);
        c.setEmail(email);
        c.setPassword(password);
        s.save(c);
        tr.commit();
        s.close();
        
        
        return 1;
    }
    public static int DeleteOffre(int id){
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        DeleteSoumissonByOffre(id);
        
        Query query =s.createQuery("delete from Offre where Offr_Num = :id ");
                query.setParameter("id", id);
                int result = query.executeUpdate();
                tr.commit();
                s.close();
                
                return result ;
        
        
                
    }
    public static List<SecteurActivite> ListerSecteur(){
          Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        List<SecteurActivite> list= new ArrayList<SecteurActivite>();
        
        list= s.createQuery("from SecteurActivite").list();
        tr.commit();
        s.close();
        
        return list;
    }
    public static int addSoumission(String Description,Date DateSoum,Client C ,Offre Offr ,byte[] file){
  
      Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Soumission soumiss = new Soumission();
        
        soumiss.setClient(C);
        soumiss.setOffr(Offr);
        soumiss.setDescription(Description);
        soumiss.setFile(file);
        soumiss.setDateSoumission(DateSoum);
        
     

        s.save(soumiss);
          
         tr.commit();
      
      return 1;
  }
  public static int addoffre(String Description,Date DateOffre,Date DateClotOffre,Auteur Aut,SecteurActivite Sect,byte[] file,String filePath){
  
      Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
      Offre of=new Offre(Description, DateOffre, DateClotOffre, Aut, Sect, file, filePath);
      s.save(of);
      tr.commit();
      
      return 1;
  }
   public static int UpdateOffre(int id,String desc,Date DateClotOffre,Date DateOffre,SecteurActivite Sect,byte[] file,String filePath){
     Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
       
       Query query =s.createQuery("update Offre set Description = :desc ,DateOffre = :DateOffre ,DateClotOffre = :DateClotOffre , Sect = :Sect ,file= :file,filePath= :filePath  where Offr_Num = :id ");
                
              query.setParameter("desc", desc);    
                query.setParameter("DateOffre", DateOffre); 
               query.setParameter("DateClotOffre", DateClotOffre);
               query.setParameter("Sect", Sect); 
               query.setParameter("file", file); 
               query.setParameter("filePath", filePath); 
                query.setParameter("id", id); 
                int result = query.executeUpdate();
                tr.commit();
                
                s.close();
                
                return result;
    }
   public static int AjoutOffre(String Nom,String Desc,String dateclot,String datedep,int sect,String file,int id_auteur){
        
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
     
       byte[] imageData = new byte[(int) file.length()];  
      
       try {
               FileInputStream fileInputStream = new FileInputStream(file);
         
               fileInputStream.read(imageData);
         fileInputStream.close();
     
        Offre f= new Offre();
        f.setDescription(Desc);
       
        SecteurActivite sect1=FindSecteur(sect) ;
        Auteur au=FindAuteur(id_auteur);
        
        f.setSect(sect1);
        
        SimpleDateFormat form = new SimpleDateFormat("yyyy-mm-dd");
        Date d=form.parse(dateclot);
        Date d1=form.parse(datedep);
        f.setDateClotOffre(d);
        f.setDateOffre(d1);
        f.setAut(au);
       f.setFilePath(file);
        
       f.setFile(imageData);
       s.save(f);
       tr.commit();
       s.close();

} catch (Exception e) {
    e.printStackTrace();
}
        return 0;
    }
    public static Soumission FindSouumission(int id){
           Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
       Soumission soumiss =new Soumission();
       soumiss = (Soumission) s.createQuery("from Soumission s where s.Numero= "+id).uniqueResult();
        tr.commit();
        s.close();
        
        return soumiss;
        
    }
     public static Offre FindOffre(int id){
           Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
       Offre offre =new Offre();
       offre = (Offre) s.createQuery("from Offre a where a.Offr_Num="+id).uniqueResult();
        tr.commit();
        s.close();
        
        return offre;
        
    }
    public static List<Offre> FetchOffre(){
           Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        List<Offre> offre =new ArrayList<Offre>();
        offre = s.createQuery("from Offre").list();
        tr.commit();
        s.close();
        
        return offre;
        
    }
    public static Auteur FindAuteur(int aut){
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
       Auteur au=new Auteur();
        
       au = (Auteur) s.createQuery("from Auteur a where a.Numero="+aut).uniqueResult();
        tr.commit();
        s.close();
        
        return au;
        
    }
    public static SecteurActivite FindSecteur(int sect){
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        SecteurActivite secteur= new SecteurActivite();
        
        secteur = (SecteurActivite) s.createQuery("from SecteurActivite s where s.id_sect="+sect).uniqueResult();
        tr.commit();
        s.close();
        
        return secteur;
        
    }
    public static int AddSoumission(String date,String str){
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
          String photoFilePath="photo";
        //  System.out.println(photoFilePath);
      File file = new File(photoFilePath);
     
          
         
    byte[] imageData = new byte[(int) file.length()];
 
try {
    FileInputStream fileInputStream = new FileInputStream(file);
    fileInputStream.read(imageData);
    fileInputStream.close();

 
    Soumission s1= new Soumission();


         
   //Save the data
 s.save(s1);
tr.commit();
s.close();
//HibernateUtil.shutdown();
} catch (Exception e) {
    e.printStackTrace();
}
    return 1;
}
    
 public static Client FetchClient(int id){
     
           Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Client Cl=new Client();
        
         Cl =(Client) s.createQuery("from Client where Clie_Num="+id).uniqueResult();
         
          tr.commit();
        s.close();
        return Cl ;
        
 }
 public static Auteur FetchAuteur(int id){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Auteur Au=new Auteur();
        
         Au =(Auteur) s.createQuery("from Auteur where Numero="+id).uniqueResult();
         
          tr.commit();
        s.close();
    return Au ;
 }
    public static int FindAuteur(String email,String password){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Auteur Au=new Auteur();
        
        
       int i=0;
      List  A = s.createQuery("select a.Numero from Auteur a where a.Email='"+email+"' and a.Password='"+password+"'"  ).list();
      
        tr.commit();
        s.close();
     
//        System.out.println("fgfgfhfhgf"+A.size());
        if(A.size()>0){            
            i=(int) A.get(0);         
       
        }
        
        else i=0; 
        
        return i;
    }
     public static int FindClient(String email,String password){
        
         Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
        Client C=new Client();
        
        
       int i=0;
      List Cl = s.createQuery("select c.Clie_Num from Client c where c.Email='"+email+"' and c.Password='"+password+"'"  ).list();
      
        tr.commit();
        s.close();
     
//        System.out.println("fgfgfhfhgf"+A.size());
        if(Cl.size()>0){            
            i=(int) Cl.get(0);         
       
        }
        
        else i=0; 
        
        return i;
    }
            
}
