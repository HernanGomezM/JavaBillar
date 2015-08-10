<%-- 
    Document   : Usuarios
    Created on : 09-ago-2015, 15:31:38
    Author     : GOMEZ MARQUEZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Usuarios</title>
<link rel="shortcut icon" href="Diseño/images/favicon.ico.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="Diseño/css/style.css" rel="stylesheet" type="text/css"/>
<link href="Diseño/css/slider.css" rel="stylesheet" type="text/css"/>
<script src="Diseño/js/jquery.min.js" type="text/javascript"></script>
<script src="Diseño/js/slidermodernizr.custom.js" type="text/javascript"></script>
</head>
 <body>
   <!-- Background slider -->
 	<div class="slider">
 	      <ul id="cbp-bislideshow" class="cbp-bislideshow">
					<li><img src="Diseño/images/1.jpg" alt="image01"/></li>
					<li><img src="Diseño/images/2.jpg" alt="image02"/></li>
					<li><img src="Diseño/images/3.jpg" alt="image03"/></li>
					<li><img src="Diseño/images/4.jpg" alt="image04"/></li>
					<li><img src="Diseño/images/5.jpg" alt="image05"/></li>
					<li><img src="Diseño/images/6.jpg" alt="image06"/></li>
				</ul>    
	   <script src="Diseño/js/jquery.imagesloaded.min.js"></script>
		<script src="Diseño/js/cbpBGSlideshow.min.js"></script>
		<script>
			$(function() {
				cbpBGSlideshow.init();
			});
		</script>
	 </div>
	 <!-- End Background slider -->
	    <div class="header_top">
		 	  <div class="wrap">	 			
				<div class="logo">
					<a href="index.html"><img src="Diseño/images/logo.png" alt=""></a>
				</div>	
				<div class="nav">			
				  <ul>
					<li><a href="index.html">Home</a></li>
			    	<li><a href="about.html">About</a></li>
			    	<li><a href="events.html">Gallery</a></li>
			    	<li><a href="events.html">Events</a></li>
			    	<li><a href="blog.html">Blog</a></li>
			    	<li><a href="contact.html">Contact</a></li>
			    	<div class="clear"></div>
			       </ul>	
			    </div>	 
 				<div class="clear"></div>		   
 	   		</div>
 	     </div>
	       <div class="wrap">
	        <div class="main">	        	
	        		<div class="section group">
				<div class="col_1_of_3 span_1_of_3">
					<h2><span>Registro de Usuarios</span></h2>
                                        <form action="ServeUsua?u=RegiUsua">
                                        <h2>Documento</h2><br>
					<input id="txtes" type="text" name="Documento"/><br>
					<h2>Nombres</h2><br>
					<input id="txtes" type="text" name="Nombres"/><br>
					<h2>Apellidos</h2><br>
					<input id="txtes" type="text" name="Apellidos"/><br>
					<h2>Direccion</h2><br>
					<input id="txtes" type="text" name="Direccion"/><br>
					<h2>Email</h2><br>
					<input id="txtes"type="text" name="Email"/><br><br>
					<h2>Perfil</h2><br>
					<select id="txtes" name="Perfil">
						<option value="Admin">Admin</option>
						<option value="Mesero">Mesero</option>
					</select>
					<br><br>
					<input type="submit" value="Registrar"/>
                                        </form>
				</div>
				<div class="col_1_of_3 span_1_of_3">
					 <div class="menu_timmings">
					 	 <ul>
					 	 	<li>
								<div class="txt1">Main Menu</div>
								<div class="txt2 color1">12am - 12pm</div>
							 </li>
							 <li>
								<div class="txt1">Beer Festival</div>
								<div class="txt2 color2">9am - 8pm</div>
							 </li>
							 <li>
								<div class="txt1">Live Music</div>
								<div class="txt2 color3">7pm - 12pm</div>
							 </li>
							 <li>
								<div class="txt1">Disco Dance</div>
								<div class="txt2 color4">8pm - 2am</div>
							 </li>
					 	 </ul>
					 </div>
				</div>
				<div class="col_1_of_3 span_1_of_3">
					<h2><span>Usuarios Registrados</span></h2>
					<table>
					        <c:forEach items="${Usuarios}" var="Usua">
					            <tr><td>${Usua.Documento}</td>
					                <td>${Usua.Nombres}</td>
					                <td>${Usua.Apellidos}</td>
					                <td>${Usua.Direccion}</td>
					                <td>${Usua.Email}</td>
                                                        <td>${Usua.Perfil}</td>
					                <td><a href="ServeUsua?u=update&i=${Usua.IdUsuarios}">Editar</a></td>
					            </tr>
					        </c:forEach>
			        </table>
				  </div>
			   </div>
	          </div>        
	        </div>
	          <div class="copy_right">
	        	<div class="wrap">
				  <p>Company Name © All rights Reseverd | Design by  <a href="http://w3layouts.com"> W3Layouts </a></p>
		       </div>
		   </div>
      </body>
 </html>

