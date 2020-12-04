<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Traitement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.SecteurActivite"%>
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
                           Ajouter un offre 
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                      <%
                                                                               
                                          if(request.getParameter("ajouter")!=null){
                                     %>
       
                                  <script >
                                     alert('Offre Ajouter');
                                    </script>
          
                                    <%
                                     }
                                    %>
                                    <form   method="post"  action="../AddAvis" enctype="multipart/form-data">
                                      
                                      
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input class="form-control"  name="Description" placeholder="Description" >
                                        </div>
                                           <div class="form-group">
                                            <label>DateOffre</label>
                                            <input class="form-control" type="date"  name="DateOffre" >
                                        </div>
                                           <div class="form-group">
                                            <label>DateClotureOffre</label>
                                            <input class="form-control" type="date"  name="DateClotureOffre" placeholder="Nom">
                                        </div>
                                        
                                      
                                         <div class="form-group">
                                            <label>Secteur D'activité</label>
                                            <%
                                                List<SecteurActivite> l=new ArrayList<SecteurActivite>();
                                                l=Traitement.ListerSecteur();
                                                 Iterator it = l.iterator();
                                                 
                                                
                                                %>
                                            <select class="form-control" name="Secteur">
                                                  <%
                                while(it.hasNext()){
                                 SecteurActivite sect=(SecteurActivite)it.next();
                                
                                String nom= sect.getLibelle();
                                 int id=    sect.getId_sect();
                                   %>
                                              <option value='<%=id%>'><%=nom%></option>
                                
                                <%
                                }
                                %> 
                                            </select>
                                         </div>
                                         <div class="form-group">
                                            <label>Avis</label>
                                            <input type="file" name="file" size="100">
                                        </div>
                                        <button type="submit" name="envoyer" class="btn btn-default">Envoyer</button>
                                    </form>
                                </div>
                              
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


