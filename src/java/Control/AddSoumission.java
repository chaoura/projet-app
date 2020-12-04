/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Bean.Auteur;
import Bean.Client;
import Bean.Offre;
import Bean.SecteurActivite;
import Dao.Traitement;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@MultipartConfig(maxFileSize = 1977721500)
public class AddSoumission extends HttpServlet {

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
            out.println("<title>Servlet AddSoumission</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSoumission at " + request.getContextPath() + "</h1>");
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
      
           // processRequest(request, response);
        Client c= new Client();
         Offre offre = new Offre();
       HttpSession ses=request.getSession();
                                      String Desc=request.getParameter("Description");
                                           
                                          String fil = request.getParameter("file");
                                           Date date = new Date(); 
                              if(ses!=null){                 
                                           
                                           // int offr=Integer.parseInt(request.getParameter("idOff"));
                                           String off = (String) ses.getAttribute("offr");
                                            int idoffre=Integer.parseInt(off);
                                            
                                            offre = Traitement.FindOffre(idoffre);
                                  //    HttpSession session=request.getSession(false);  
                                            c= (Client) ses.getAttribute("client");
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
                                    
                            int res=Traitement.addSoumission(Desc, date, c , offre, fichier);
                           
                            request.setAttribute("ok", true);
                           // request.getRequestDispatcher("pages/AjoutOffre.jsp").forward(request, response);
                            response.sendRedirect("pages/AjoutSoumission.jsp");
                             }
                               
                            }
                             //        
            
                      
    
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
