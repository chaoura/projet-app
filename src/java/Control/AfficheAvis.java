/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Bean.Offre;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Asus
 */
@MultipartConfig(maxFileSize = 16777215)
public class AfficheAvis extends HttpServlet {

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
            out.println("<title>Servlet AfficheAvis</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AfficheAvis at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
      // int id=Integer.parseInt(request.getParameter("offr"));
           //  Blob file = null;
             byte[ ] fileData = null ;
            
             Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new     StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf =configuration.buildSessionFactory(builder.build());
        Session s=sf.openSession();
        Transaction tr=s.beginTransaction();
        
         /*      Configuration configuration = new Configuration().configure();
             StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
        SessionFactory sf=new Configuration().configure().buildSessionFactory(builder.build());
                      
        Session s=sf.openSession();
         Transaction tx = null;
        
       
           
            response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
      */        
         /* InputStream inputStream = null;
           Part filePart = request.getPart("file_uploaded");
                
                if (filePart != null) 
                {
                    
                }
     // ImageWrapper imgNew = (ImageWrapper)session.get(ImageWrapper.class, 1);
     */  Offre of= (Offre)s.createQuery("from Offre where Offr_Num=3").uniqueResult();
     fileData=of.getFile();
    //  out.print(of.getFilePath());
        
               response.setContentType("application/pdf");
                response.setHeader("Content-Disposition","inline");
                response.setContentLength(fileData.length);
                
        try ( //    FileOutputStream fos = new FileOutputStream(of.getFilePath());
                OutputStream output = response.getOutputStream()) {
               output.write(fileData);
            
            output.flush();
            output.close();
            tr.commit();
        s.close();
        }

         
               // OutputStream output = response.getOutputStream();
                //output.write(fileData);
                
               // output.flush();
//        tr.commit();
//        s.close();

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
      //  processRequest(request, response);
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
