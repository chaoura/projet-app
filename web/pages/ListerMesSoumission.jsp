<%-- 
    Document   : ListerSoumission
    Created on : 28 mai 2018, 22:01:17
    Author     : Asus
--%>

<%@page import="Bean.Offre"%>
<%@page import="Bean.Soumission"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Traitement"%>
<%@page import="Bean.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="headerClient.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Mes Soumissions</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                Les Soumissions :
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    
                                   <tr>
                                        <th>ID</th>
                                        <th>Date Soumission</th>
                                        <th>Offre</th>
                                        <th>Client</th>
                                         <th>Demande </th>
                                         
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                        Client c= new Client();
                                        
                                        if(session!=null){  
                                            c = (Client) session.getAttribute("client");
                                               }
                                     
                                        List<Soumission> soumiss=Traitement.FindSoumissionByClient(c);
                                        
                                        for(int i=0;i<soumiss.size();i++){  
                                        Offre off =Traitement.FindOffre(soumiss.get(i).getOffr().getOffr_Num());
                                        //CLient cl =Traitement.find
                                    
                                        %>
                                 <tr class="odd gradeX">
                                        <td class="center"><%= soumiss.get(i).getNumero()%></td>
                                        <td class="center"><%= soumiss.get(i).getDateSoumission()%></td>
                                        <td class="center"><%= off.getDescription() %></td>
                                        <td class="center"><%=soumiss.get(i).getClient().getClie_Num() %></td>
                                        <td  class="center"> <a href="AfficheSoumission.jsp?idSoumiss=<%=soumiss.get(i).getNumero() %>">Afficher</a></td>
                                    </tr>
                                    <%}%>
                                     
                                </tbody>
                            </table>
                            
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <!-- /.row -->
            
            <!-- /.row -->
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

    </body>
</html>
