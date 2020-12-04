<%-- 
    Document   : afficheSoumission
    Created on : 28 mai 2018, 22:21:22
    Author     : Asus
--%>

<%@page import="Bean.Soumission"%>
<%@page import="java.io.OutputStream"%>
<%@page import="Bean.Offre"%>
<%@page import="Dao.Traitement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demande de Soumission</title>
    </head>
    <body>
       
        <%
         int id= Integer.parseInt(request.getParameter("idSoumiss"));
            
          Traitement dao=new Traitement();
            byte[ ] fileData = null ;
            
              
         Soumission soumiss =  dao.FindSouumission(id);
          fileData=soumiss.getFile();
          
            response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
        %>
    </body>
</html>