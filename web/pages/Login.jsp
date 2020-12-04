<%-- 
    Document   : Login
    Created on : 24 avr. 2018, 14:52:52
    Author     : Asus
--%>

<%@page import="Bean.Auteur"%>
<%@page import="Dao.Traitement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="Login.jsp">
                            <fieldset>
                                 <%
                            if(request.getParameter("erreur")!=null){
                         %>
                    <p>erreur</p>
                                <%}
                            %>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input name="Login" type="submit" value="Login" class="btn btn-lg btn-success btn-block">
                                
                            </fieldset>
                        </form>
                       
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%
        if(request.getParameter("Login")!=null){
          //  System.out.println(session.getAttribute("user"));
            
     String email= request.getParameter("email");
      String password = request.getParameter("password");
        System.out.print(email);
      int i = Traitement.FindAuteur(email,password);
         System.out.println("iii:"+i);
   //   String str=i+" ";
      if(i>0){
          Auteur A= Traitement.FetchAuteur(i);
          HttpSession ses=request.getSession();
           
          ses.setAttribute("user",A);
           
            response.sendRedirect("Index.jsp");
     
      }
      else{
      response.sendRedirect("Login.jsp?erreur=oui");
      }
        }
     %>
    
   

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>


