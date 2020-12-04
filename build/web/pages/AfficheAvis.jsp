<%-- 
    Document   : AfficheAvis
    Created on : 28 avr. 2018, 17:49:56
    Author     : Asus
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="Bean.Offre"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  int id=Integer.parseInt(request.getParameter("offr"));
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
     // ImageWrapper imgNew = (ImageWrapper)session.get(ImageWrapper.class, 1);
      Offre of= (Offre)s.createQuery("from Offre where Offr_Num="+id).uniqueResult();
      fileData=of.getFile();
    //  out.print(of.getFilePath());
     
               response.setContentType("application/pdf");
                response.setHeader("Content-Disposition","inline");
                response.setContentLength(fileData.length);
                
        //    FileOutputStream fos = new FileOutputStream(of.getFilePath()); 
            OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                output.close();

         
               // OutputStream output = response.getOutputStream();
                //output.write(fileData);
                
               // output.flush();
        tr.commit();


            %>
    </body>
</html>
