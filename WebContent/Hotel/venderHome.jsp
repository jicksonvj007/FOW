<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
session=request.getSession(false);
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
String user = (String) session.getAttribute("user");
if (user==null || user=="") {
    response.sendRedirect("../hotelIndex.jsp?val=You are successfully logged out");
}
%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/vendorStyle.css">

</head>
<div class="btn">
<ul>
	<li><a href="viewOrder.jsp"><button>View Orders</button> </a></li> 
	<li><a href="manageItem.jsp"><button>Manage Item</button></a></li> 
	<li><a href="logoutAction.jsp"><button>Logout</button></a></li>
	</ul>
</div>
<body>
	<div class="option">
		<h1>
			Welcome
			<%
			out.print(user);
		%>
		</h1>
		<br>


	</div>

</body>
</html>