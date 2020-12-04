<%-- 
    Document   : affichercc
    Created on : 30 avr. 2018, 12:57:47
    Author     : Asus
--%>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<%@page import="java.io.OutputStream"%>
<%@page import="Bean.Offre"%>
<%@page import="Dao.Traitement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cahierde charge</title>
    </head>
    <body>
       
        <%
         int id= Integer.parseInt(request.getParameter("idOffre"));
            
          Traitement dao=new Traitement();
            byte[ ] fileData = null ;
            
              
         Offre of=  dao.FindOffre(id);
         fileData=of.getFile();
            response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
        %>
    </body>
</html>
