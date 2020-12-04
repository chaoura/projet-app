<%-- 
    Document   : pag
    Created on : 24 avr. 2018, 17:56:43
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <% session.invalidate();
        
         response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
