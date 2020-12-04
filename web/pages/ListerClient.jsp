<%@page import="Bean.Client"%>
<%@page import="Dao.Traitement"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Offre"%>
<%@include file="header.jsp" %>

<%
    if(request.getParameter("idClie")!=null){
    int  id_cli=Integer.parseInt(request.getParameter("idClie"));
   int d= Traitement.DeleteClient(id_cli);
        if(d!=0){
        %>
     
       <script >
           alert('Client Deleted');
          </script>
        
       <%
       }
 }
            %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                Clients :
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    
                                   <tr>
                                        <th>ID</th>
                                        <th>Nom</th>
                                        <th>Email</th>
                                        <th>Adresse</th>
                                         <th>delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Client> client=Traitement.FetchClient();
                                        for(int i=0;i<client.size();i++){                                         
                                        %>
                                 <tr class="odd gradeX">
                                        <td class="center"><%= client.get(i).getClie_Num() %></td>
                                        <td class="center"><%= client.get(i).getNom() %></td>
                                        <td class="center"><%= client.get(i).getEmail() %></td>
                                        <td class="center"><%=client.get(i).getAdresse() %></td>
                                        <td  class="center"> <a href="ListerClient.jsp?idClie=<%=client.get(i).getClie_Num()%>">delete</a></td>
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
