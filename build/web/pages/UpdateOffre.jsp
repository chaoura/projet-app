<%-- 
    Document   : UpdateOffre
    Created on : 29 avr. 2018, 18:54:27
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : AjoutProduit
    Created on : 22 avr. 2018, 18:23:17
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Traitement"%>
<%@page import="Bean.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                          Modifier un offre 
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                      <% 
                                           if(request.getParameter("modified")!=null){
                                     %>
       
                                  <script >
                                     alert('Info Modifier');
                                    </script>
          
                                    <%
                                        }
                                          Offre o= new Offre();  
                                         List<SecteurActivite> l=new ArrayList<SecteurActivite>();
                                         SecteurActivite SelectedSect =new SecteurActivite() ;
                                       
                                      //  if(request.getParameter("off")!=null){ 
//                                        if(session!=null){  
//                                            Offre offr= (Offre) session.getAttribute("offre");
                                           String idoff=request.getParameter("off");
                                             System.out.println("//////////////////////// ++"+idoff);
                                             int idoffre  = Integer.parseInt(idoff);
                                             o =Traitement.FindOffre(idoffre);
                                            int sectid=o.getSect().getId_sect();
                                             SelectedSect =Traitement.FindSecteur(sectid);
                                                HttpSession ses=request.getSession();
                                              ses.setAttribute("offre",o);
                              
                                            %>
                                      
                                    <form   method="post"  action="../UpdateAvis" enctype="multipart/form-data">
                                      
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input class="form-control"  name="Description" placeholder="Description" value="<%= o.getDescription() %>">
                                        </div>
                                           <div class="form-group">
                                            <label>DateOffre</label>
                                            <input class="form-control" type="date"  name="DateOffre" value="<%= o.getDateOffre()%>">
                                        </div>
                                           <div class="form-group">
                                            <label>DateClotureOffre</label>
                                            <input class="form-control" type="date"  name="DateClotureOffre" placeholder="Nom" value="<%= o.getDateClotOffre() %>">
                                        </div>
                                        
                                      
                                         <div class="form-group">
                                            <label>Secteur D'activité</label>
                                            <%
                                               
                                                l=Traitement.ListerSecteur();
                                                 Iterator it = l.iterator();
                                                 
                                                 
                                                
                                                %>
                                           
                                                <select class="form-control" name="Secteur" >
                                     <option value='<%=SelectedSect.getId_sect() %>' selected="true"><%= SelectedSect.getLibelle() %></option>            
                                                  <%
                                                   
                                while(it.hasNext()){
                                 SecteurActivite sect=(SecteurActivite)it.next();
                                
                                String nom= sect.getLibelle();
                                 int id=    sect.getId_sect();
                                   %>
                                   <option value='<%=id%>' ><%=nom%></option>
                                
                                <%
                                }
                                %> 
                                            </select>
                                         </div>
                                         <div class="form-group">
                                            <label>Avis</label>
                                            <input type="file" name="file" size="100" >
                                        </div>
                                            <div class="form-group">
                                            
                                                <input type="hidden" name="off" value="<%=idoffre%>" >
                                        </div> 
                                        <button type="submit" name="envoyer" class="btn btn-default">Envoyer</button>
                                    </form>
                                </div>
                                <% 
                                    
                                    /*
                                    if(request.getParameter("envoyer")!=null){
                                      
                                        
                                           String Nom=request.getParameter("Nom");
                                            String Desc=request.getParameter("Description");
                                            String dateclot=request.getParameter("DateClotureOffre");
                                            String dateOffre=request.getParameter("DateOffre");
                                            int sect=Integer.parseInt(request.getParameter("Secteur"));
                                             String file = request.getParameter("file");
                                      
                                          
                                       
                                           if(session!=null){  
                                            Auteur A= (Auteur) session.getAttribute("user");
                                       
                                     // int id,String desc,Date DateOffre,Date DateClotOffre,SecteurActivite Sect,byte[] file,String filePath)
                                     int res=Traitement.UpdateOffre(idoffre,Desc,dateOffre,dateclot,sect,file,filePath);
                                             response.sendRedirect("UpdateOffre.jsp?modified=true&off="+idoff) ; 
                                              }
                                    }
                                     
                                    */  
                                   
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



