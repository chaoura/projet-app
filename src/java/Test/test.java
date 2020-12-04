/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import Bean.*;
import Dao.Traitement;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Asus
 */
@WebServlet(name = "test", urlPatterns = {"/test"})
public class test extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet test</title>");            
            out.println("</head>");
            out.println("<body>");
            out.print(tets());
            out.println("<h1>Servlet test at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (ParseException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int tets() throws ParseException{
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
       
        Client c=new Client();
        c.setAdresse("agadir");
        c.setEmail("fghjklm");
        c.setNom("mustafa");
        c.setPassword("12345");
        
        Auteur A= new Auteur();
        A.setEmail("email@email.com");
        A.setPassword("123");
        
        SecteurActivite se= new SecteurActivite();
        se.setId_sect(1);
        se.setLibelle("informatique");
        
        s.save(se);
        s.save(A);
        s.save(c);
        
        tr.commit();
        s.close();
      /*   
        Produit p=new Produit();
        p.setNom("product");
        p.setQuantite(20);
        
        String date = "2016-09-09";
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fd = formatter.parse(date);
        
        Contrat co= new Contrat();
        co.setQuantite(10);
        co.setDateContrat(fd);
        co.setClien(c);
        co.setProd(p);
        
        s.save(c);
        s.save(p);
        s.save(co);
        
        tr.commit();
        s.close();
        int i=0;
        i= Traitement.FindAuteur("email@email.com");
        return i;*/
      return 1;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
