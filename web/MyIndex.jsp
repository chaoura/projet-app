<%-- 
    Document   : index
    Created on : 18 juin 2018, 19:30:27
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Big Business 2.0
Description: A two-column, fixed-width design with a bright color scheme.
Version    : 1.0
Released   : 20120624
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Big Business 2.0 by TEMPLATED</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#menu > ul').dropotron({
			mode: 'fade',
			globalOffsetY: 11,
			offsetY: -15
		});
		$('#slider').slidertron({
			viewerSelector: '.viewer',
			indicatorSelector: '.indicator span',
			reelSelector: '.reel',
			slidesSelector: '.slide',
			speed: 'slow',
			advanceDelay: 4000
		});
	});
</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="#">Appel D'offre</a></h1>
		</div>
		<div id="slogan">
			<h2>MID</h2>
		</div>
	</div>
	<div id="menu">
		<ul>
		
			<li><a href="pages/Login.jsp">Admin</a></li>
			
			<li>
				<span class="opener">Client<b></b></span>
				<ul>
					<li><a href="pages/LoginClient.jsp">Login</a></li>
					<li><a href="pages/Register.jsp">Registre</a></li>
					
				</ul>
			</li>
			<li><a href="#">About</a></li>
			<li class="last"><a href="#">Contact</a></li>
		</ul>
		<br class="clearfix" />
	</div>
	<div id="slider">
		<div class="viewer">
			<div class="reel">
				<div class="slide">
					<img src="images/slide01.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide02.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide03.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide04.jpg" alt="" />
				</div>
				<div class="slide">
					<img src="images/slide05.jpg" alt="" />
				</div>
			</div>
		</div>
		<div class="indicator">
			<span>1</span>
			<span>2</span>
			<span>3</span>
			<span>4</span>
			<span>5</span>
		</div>
	</div>
	<div id="page">
		<div id="content">
			<div class="box">
				<h2>Bienvenue Sur Notre Application </h2>
				<p>
				
                                </p>
			</div>
		
			<br class="clearfix" />
		</div>
		
		<br class="clearfix" />
	</div>
	<div id="page-bottom">
		<div id="page-bottom-content">
			<h3>A PROPOS</h3>
			<p>
				Ce projet a pour objectif la conception d’un système d’information permettant de faire la gestion des appels d’offres selon leurs secteurs d’activités de la cote auteur de l’application et permet de trouver et de répondre aux appels d’offre sur l’application.
			</p>
		</div>
		
		<br class="clearfix" />
	</div>
</div>
<div id="footer">
	 by ML & CH </a>.
</div>
</body>
</html>