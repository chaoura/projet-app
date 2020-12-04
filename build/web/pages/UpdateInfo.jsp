<%-- 
    Document   : UpdateInfo
    Created on : 29 mai 2018, 11:35:08
    Author     : Asus
--%>

<%@page import="Bean.Auteur"%>
<%@page import="Dao.Traitement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>

            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Modifier Mes Informations</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Ajouter un offre 
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <%
                                        Auteur A=new Auteur(); 
                                        
                                          if(request.getParameter("modified")!=null){
                                     %>
       
                                  <script >
                                     alert('Info Modifier');
                                    </script>
          
                                    <%
                                     }
                                            if(session!=null){   
                                            A = (Auteur) session.getAttribute("user");
                                               }
                                      %>
                                    <form   method="post"  action="UpdateInfo.jsp">
                                       
                                      
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control"  name="Email" placeholder="Email" value="<%= A.getEmail() %>">
                                        </div>
                                          
                                           <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control"  name="Password" placeholder="Pass" value="<%= A.getPassword() %>">
                                        </div>
                                        
                                      
                                        <button type="submit" name="envoyer" class="btn btn-default">Envoyer</button>
                                    </form>
                                </div>
                                <%  
                                    if(request.getParameter("envoyer")!=null){
                                        
                                             String Email=request.getParameter("Email");
                                            String Password=request.getParameter("Password");
                                       
                                          //  request.setAttribute("modified", true);
                                            
                                             if(session!=null){  
                                            A = (Auteur) session.getAttribute("user"); 
                                            }
                                         
                                          int res=Traitement.UpdateAuteur(A.getNumero(),Email,Password);
                                                Auteur Au= Traitement.FetchAuteur(A.getNumero());
                                                HttpSession ses=request.getSession();
           
                                                 ses.setAttribute("user",Au);
                                                 
                                                response.sendRedirect("UpdateInfo.jsp?modified=true") ; 
                                     }
                                       
                                    %>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
            <!-- /.row -->
          
            <!-- /.row -->
         
            </div>
            <!-- /.row -->
      

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
