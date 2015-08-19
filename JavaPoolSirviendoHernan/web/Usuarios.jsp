
<%@page import="models.Usuarios"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if (session.getAttribute("usuario")==null) {
        response.sendRedirect("Login/index.html");
    }else{
        Usuarios objUsuarios = (Usuarios) session.getAttribute("usuario");
        String Per = objUsuarios.getPerfil();
        if (Per != "Admin") {
            response.sendRedirect("index.html");    
            }
    }
}
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Usuarios</title>
<link rel="shortcut icon" href="Diseno/images/favicon.ico.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="Diseno/css/style.css" rel="stylesheet" type="text/css"/>
<link href="Diseno/css/slider.css" rel="stylesheet" type="text/css"/>
<script src="Diseno/js/jquery.min.js" type="text/javascript"></script>
<script src="Diseno/js/slidermodernizr.custom.js" type="text/javascript"></script>
</head>
 <body>
   <!-- Background slider -->
 	<div class="slider">
 	      <ul id="cbp-bislideshow" class="cbp-bislideshow">
                    <li><img src="Diseno/images/1.jpg" alt="image01"/></li>
      			<li><img src="Diseno/images/2.jpg" alt="image02"/></li>
			<li><img src="Diseno/images/3.jpg" alt="image03"/></li>
			<li><img src="Diseno/images/4.jpg" alt="image04"/></li>
			<li><img src="Diseno/images/5.jpg" alt="image05"/></li>
			<li><img src="Diseno/images/6.jpg" alt="image06"/></li>
		</ul>    
	   <script src="Diseno/js/jquery.imagesloaded.min.js"></script>
		<script src="Diseno/js/cbpBGSlideshow.min.js"></script>
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
					<a href="index.html"><img src="Diseno/images/logo.png" alt=""></a>
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
                                    <form action="ServeUsua?u=RegiUsua"method="POST" id="AgrePer" name="AgrePer" var="UpUsua">
                                        <% if (session.getAttribute("ActualizarUsuario")!=null){ %>
                                        <h2><span>Actualizar Usuarios</span></h2>
                                        <% }else{%>
                                        <h2><span>Registro de Usuarios</span></h2>
                                        <% } %>
                                        
                                        <h2>Documento</h2><br>
                                        <input id="txtes" type="text" name="Documento" value="${UpUsua.documento}"/><br>
					<h2>Nombres</h2><br>
					<input id="txtes" type="text" name="Nombres" value="${UpUsua.nombres}"/><br>
					<h2>Apellidos</h2><br>
					<input id="txtes" type="text" name="Apellidos" value="${UpUsua.apellidos}"/><br>
					<h2>Direccion</h2><br>
					<input id="txtes" type="text" name="Direccion" value="${UpUsua.direccion}"/><br>
					<h2>Email</h2><br>
					<input id="txtes"type="text" name="Email" value="${UpUsua.email}"/><br><br>
					<h2>Perfil</h2><br>
					<select id="txtes" name="Perfil" style="width: 170px;">
						<option value="Admin">Admin</option>
						<option value="Mesero">Mesero</option>
					</select>
					<br><br><br>
                                    <input type="submit" value="Registrar" style="width: 170px;"/>
                                    </form>
				</div>
				<div class="col_1_of_3 span_1_of_3">
                                    <div class="menu_timmings">
					 <ul>
                                              
                                              
                                             <h2><span>Usuarios Registrados </span></h2>
                                             <div class="CSSTableGenerator">
                                             
                                             <table>
                                             <tr>
                                                <td><strong>Documento</strong></td> 
                                                <td><strong>Nombres</strong></td>
                                                <td><strong>Apellidos</strong></td>
                                                <td><strong>Direccion</strong></td>
                                                <td><strong>Email</strong></td>
                                                <td><strong>Perfil</strong></td>
                                                <td colspan="2"><strong>Acciones</strong></td>
                                             </tr>
                                            <c:forEach items="${Usuarios}" var="Usua">
                                                    <tr style="background: #888">
                                                    <td width="90">${Usua.documento}</td>
                                                    <td width="90">${Usua.nombres}</td>
                                                    <td width="90">${Usua.apellidos}</td>
                                                    <td width="90">${Usua.direccion}</td>
                                                    <td width="90">${Usua.email}</td>
                                                    <td width="90">${Usua.perfil}</td>
                                                    <td><a href="ServeUsua?u=delete&i=${Usua.documento}">Eliminar</a></td>
                                                    <td><a href="ServeUsua?u=update&i=${Usua.documento}">Editar</a></td>
                                                    </tr>
                                            </c:forEach>
                                        </table>
                                        </div>
                                             
                                        <h2><span>Registro de Usuarios</span></h2>
                                        
                                    </ul>
                                </div>
                            </div>
			</div>
	          </div>        
	        </div>
	         
      </body>
 </html>

