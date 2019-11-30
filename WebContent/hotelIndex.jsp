<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">

<title>Login</title>

<link rel="stylesheet" href="Hotel/css/loginStyle.css">
</head>
<body>
	<div class="loginbox">
	<img src="Hotel/images/Food-on-Wheels-logo.png" style="margin-left: 80px;">
		<h1>Login Here</h1>
		<form name="insert" action="Hotel/loginAction.jsp" method="post">

			<p>Username</p>
			<input type="text" name="user" placeholder="Enter Username"
				required="" />

			<p>Password</p>
			<input type="password" name="pswrd" placeholder="Enter Password"
				required="" /> <input type="submit" name="submit" value="Login" />
				<!--  <a href="changePassword.jsp">Forgot Password</a> -->
		</form>
		<div align="center">
    <label name="lbl" value="<%=val%>"> <h2>  <%=val %> </h2>  </label>
  </div>
	</div>
</body>
</html>