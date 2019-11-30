<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.foodonwheels.dao.customerdao.CustomerSigninDao" %>
<%@page import="com.mvc.foodonwheels.beans.customerbean.CustomerSigninBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String username=request.getParameter("username");
String passwordd=request.getParameter("userpasswordd");

CustomerSigninBean customerSigninBean=new CustomerSigninBean();
CustomerSigninDao customerSigninDao=new CustomerSigninDao();
customerSigninBean.setUsername(username);
customerSigninBean.setPasswordd(passwordd);
out.println("name.........:"+customerSigninBean.getUsername());
out.println("pass.........:"+customerSigninBean.getPasswordd());
int id=0;
ArrayList<CustomerSigninBean> al=(ArrayList<CustomerSigninBean>)customerSigninDao.selectUserFromDb(customerSigninBean);
int size=al.size();
out.print("size:"+size);
if(size==0){
	out.print("no data");
	response.sendRedirect("../CustomerMain/customerLoginFailed.html");
}else{
	for(CustomerSigninBean it:al){
		id=it.getUserid();
		session.setAttribute("customer_id",id);
	}
	out.print("success");
	response.sendRedirect("../CustomerMain/customerHome.jsp");
}

%>