<%-- 
    Document   : UpdateInfo
    Created on : 29 mai 2018, 11:35:08
    Author     : Asus
--%>

<%@page import="Bean.Client"%>
<%@page import="Bean.Auteur"%>
<%@page import="Dao.Traitement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="headerClient.jsp" %>

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
                          Modifier Mes Info
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <%
                                       Client c = new Client();
                                    if(request.getParameter("modified")!=null){
                                     %>
       
                                  <script >
                                     alert('Info Modifier');
                                    </script>
          
                                    <%
                                     }
                                            else if(session!=null){  
                                            c = (Client) session.getAttribute("client");
                                               }
                                      %>
                                    <form   method="post"  action="UpdateInfoClient.jsp">
                                       
                                      <div class="form-group">
                                            <label>Nom</label>
                                            <input class="form-control"  name="Nom" placeholder="Nom" value="<%= c.getNom()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Adresse</label>
                                            <input class="form-control"  name="Adresse" placeholder="adresse" value="<%= c.getAdresse()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control"  name="Email" placeholder="Email" value="<%= c.getEmail() %>">
                                        </div>
                                          
                                           <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control"  name="Password" placeholder="Pass" value="<%= c.getPassword() %>">
                                        </div>
                                        
                                      
                                        <button type="submit" name="envoyer" class="btn btn-default">Envoyer</button>
                                    </form>
                                </div>
                                <%  
                                            if(request.getParameter("envoyer")!=null){
                                            String Nom=request.getParameter("Nom");
                                            String Adress=request.getParameter("Adresse");
                                             String Email=request.getParameter("Email");
                                            String Password=request.getParameter("Password");
                                          
                                            request.setAttribute("modified", true);
                                            
                                             if(session!=null){  
                                           c = (Client) session.getAttribute("client"); 
                                            }
                                         
                                          int res=Traitement.UpdateClient(c.getClie_Num(),Nom,Adress,Email,Password);
                                               Client C = Traitement.FetchClient(c.getClie_Num());
                                                HttpSession ses=request.getSession();
           
                                                 ses.setAttribute("client",C);
                                                 
                                                  response.sendRedirect("UpdateInfoClient.jsp") ; 
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
