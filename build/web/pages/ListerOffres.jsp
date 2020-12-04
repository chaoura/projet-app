<%@page import="Dao.Traitement"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Offre"%>
<%@include file="header.jsp" %>


<% if(request.getParameter("delete")!=null){
    int  id_off=Integer.parseInt(request.getParameter("idOffre"));
   int d= Traitement.DeleteOffre(id_off);
        if(d!=0){
        %>
       
       <script >
           alert('Offre Deleted');
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
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    
                                   <tr>
                                        <th>Description d'offre</th>
                                        <th>Date debut</th>
                                        <th>Date debut</th>
                                        <th>secteur</th>
                                        <th>Avis</th>
                                        <th>update</th>
                                        <th>delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Offre> offr=Traitement.FetchOffre();
//                                          HttpSession ses=request.getSession();
//                                          ses.setAttribute("offre",offr);
                                        
                                        for(int i=0;i<offr.size();i++){                                         
                                        %>
                                 <tr class="odd gradeX">
                                        <td class="center"><%= offr.get(i).getDescription() %></td>
                                        <td class="center"><%= offr.get(i).getDateOffre() %></td>
                                        <td class="center"><%= offr.get(i).getDateClotOffre() %></td>
                                        <td class="center"><%=offr.get(i).getSect().getId_sect()%></td>
                                        <td  class="center"> <a href="affichercc.jsp?idOffre=<%=offr.get(i).getOffr_Num()%>">avis</a></td>
                                        <td  class="center"> <a href="UpdateOffre.jsp?off=<%=offr.get(i).getOffr_Num()%>">update</a></td>
                                        <td  class="center"> <a href="ListerOffres.jsp?idOffre=<%= offr.get(i).getOffr_Num()%>&delete=oui">delete</a></td>
                                    </tr>
                                    <%}
                                    
                                    %>
                                     
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
