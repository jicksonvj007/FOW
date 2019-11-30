<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.foodonwheels.beans.carrierBean.CarrierBean"%>
<%@page import="com.mvc.foodonwheels.dao.carrierDAO.CarrierDAO"%>
<%@page import="java.util.ArrayList"%>

 <%
    String val="";
    try{
    val=request.getParameter("val");
    if(val.equals(null)){
    val="";
    }
    }catch(Exception e){
    val="";
    }
    %>

<html>
<head>
<title>FoodOnWheels</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="carrier/css/index.css">
</head>
<body>
	<div class="head">
		<button
			onclick="document.getElementById('id01').style.display='block'"
			style="width: auto;">Login</button>
	</div>
	<div id="id01" class="modal">
		<form class="modal-content animate" action="carrier/check.jsp" method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="carrier/img/avatar.png" alt="Avatar" class="avatar">
			</div>
			<div class="container">
				<label for="uname"><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="name" required> <label
					for="psw"><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="pswd" required>
				<button type="submit">Login</button>
			</div>
			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn"></button>
			
			</div>
		</form>
	</div>
	<script>
		// Get the modal
		var modal = document.getElementById('id01');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<div align="center">
    <label name="lbl" value="<%=val%>"><h2><%=val %> </h2>  </label>
  </div>
</body>
</html>
