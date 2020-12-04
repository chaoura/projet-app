/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Bean.Auteur;
import Bean.SecteurActivite;
import Dao.Traitement;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Asus
 */
@MultipartConfig(maxFileSize = 1677721500)
public class UpdateAvis extends HttpServlet {

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
            out.println("<title>Servlet UpdateAvis</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAvis at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
       Auteur aut = new Auteur();
        try {
           // processRequest(request, response);
        
       HttpSession ses=request.getSession();
                                       
                                              String Nom=request.getParameter("Nom");
                                            String Desc=request.getParameter("Description");
                                            String dateclot=request.getParameter("DateClotureOffre");
                                            String dateOffre=request.getParameter("DateOffre");
                                            int sect=Integer.parseInt(request.getParameter("Secteur"));
                                             String fil = request.getParameter("file");
                                             
                                           int idoff =Integer.parseInt(request.getParameter("off"));
                                           
                                            
                                             SecteurActivite sec=Traitement.FindSecteur(sect);
         
                                            
                                       //    HttpSession session=request.getSession(false);  
                                        SimpleDateFormat form = new SimpleDateFormat("yyyy-mm-dd");
                                            Date d;
                                                d = form.parse(dateclot);       
                                            
                                            Date d1=form.parse(dateOffre);
                                           
                                           if(ses!=null){  
                                              aut= (Auteur) ses.getAttribute("user");
                                          // String str= (String)session.getAttribute("user");
                                           }
                                           
                                           
                                            Part file = request.getPart("file");
                                          if (file != null) 
                                {
                    InputStream inputStream = null;
                    inputStream = file.getInputStream();
                    if (inputStream != null) 
                        {
                           
                        
                    byte[] buffer=new byte[8192];
                    int bytesread;
                        ByteArrayOutputStream output=new ByteArrayOutputStream();
                        while((bytesread=inputStream.read(buffer))!=-1){
                            System.out.println(bytesread);
                            output.write(buffer,0, bytesread);
                        }
                        byte[] fichier=output.toByteArray();
                                       // int id,String desc,Date DateClotOffre,Date DateOffre,SecteurActivite Sect,byte[] file,String filePath)
                           // int res=Traitement.addoffre(Desc, d1, d , aut, sec, fichier, "hsdsh");
                            int res=Traitement.UpdateOffre(idoff,Desc,d,d1,sec,fichier,"hsdsh");
                                         
                            response.sendRedirect("pages/UpdateOffre.jsp?modified=true&off="+idoff) ; 
                      
                          
                             }
                               
                            }
                             //        
            
        } catch (ParseException ex) {
            Logger.getLogger(AddAvis.class.getName()).log(Level.SEVERE, null, ex);
        }}                  
    

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
       // processRequest(request, response);
        doGet(request, response);
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
