<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : admin login
    Created on : 14-11-2019
    Author     : Jickson
--%>
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
  <title></title>
  <link rel="stylesheet" type="text/css" href="Admin/style/home.css">
  <div align="center">
  <h1>ADMIN LOGIN PAGE</h1>
  </div>
</head>
<body>
  <div class="login-page">
  <div class="form">
    <form name="loginAdmin" action="Admin/adminLoginAction.jsp" method="post">
      <input type="text" name="name" placeholder="username"/>
      <input type="password" name="pass" placeholder="password"/>
      <button>login</button>
    </form>
  </div>
  	<div align="center">
   		<label name="lbl" value="<%=val%>"> <h2>  <%=val %> </h2>  </label>
  	</div>
</div>
</body>
</html>