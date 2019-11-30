<%@page import="com.mvc.foodonwheels.adminDAO.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   : add hotel Action
    Created on : 13-11-2019
    Author     : Jickson
--%>
<%@page import="com.mvc.foodonwheels.adminBeans.HotelBean" %>
<%@page import="com.mvc.foodonwheels.adminDAO.HotelDAO" %>
<%
    String hName=request.getParameter("hName");
    String hAdd=request.getParameter("hAdd");
    String hLoc=request.getParameter("hLoc");
    String hDis=request.getParameter("hDis");
    String hPass=request.getParameter("hPass");
    HotelBean hotelBean=new HotelBean();
    hotelBean.setHName(hName);
    hotelBean.setHAddress(hAdd);
    hotelBean.sethLocality(hLoc);
    hotelBean.sethDistrict(hDis);
    hotelBean.sethPassword(hPass);
    boolean flag=HotelDAO.insertHotel(hotelBean);
    if(flag==true){
    	
    	//EmailDAO.send("smartkartpvtltd@gmail.com", "smartkart123", "jicksonvj@gmail.com", "test", "hai");
    	out.print("success");
    	//response.sendRedirect("viewHotels.jsp");
    }
    else{
      out.println("error in insert");
       //response.sendRedirect("");
    }
%>
    