<%-- 
    Document   : newjsp
    Created on : 22 avr. 2018, 16:59:40
    Author     : Asus
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.Traitement"%>
<%@include file="header.jsp" %>


 
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Forms</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Inscription d'un Client
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                 <%   
                                     if(request.getParameter("Ajouter")!=null){
   
                                    %>

                                   <script >
                                       alert('Client Ajouter !!');
                                      </script>

                                   <%
                                    }
                                  %>
                                    <form   method="post"  action="AjoutClient.jsp">
                                      
                                      
                                        <div class="form-group">
                                            <label>Nom</label>
                                            <input class="form-control"  name="Nom" placeholder="Nom">
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>Adress</label>
                                            <input class="form-control"  name="Address"  placeholder="Adress">
                                        </div>
                              
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control" name="Email" placeholder="Email" type="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control"  name="Password" placeholder="Password" type="password">
                                        </div>
                                        <button type="submit" name="envoyer" class="btn btn-default">Envoyer</button>
                                    </form>
                                </div>
                                <%
                                    if(request.getParameter("envoyer")!=null){
                                       String Nom=request.getParameter("Nom");
                                      String Address=request.getParameter("Address");
                                       String Email=request.getParameter("Email");
                                         String Password=request.getParameter("Password");
                                       int i = Traitement.AjoutClient(Nom,Address,Email,Password); 
                                         response.sendRedirect("AjoutClient.jsp?Ajouter=oui");
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
