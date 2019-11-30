<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
    Document   : View Order
    Created on : November 15, 2019
    Author     : MANU
--%>


<%@ page import="java.util.ArrayList"%>
<%@page import="com.mvc.foodonwheels.beans.hotelbean.HotelBean"%>
<%@page import="com.mvc.foodonwheels.dao.hoteldao.HotelDAO"%>
<a href=venderHome.jsp>Go back</a>
<link rel="stylesheet" href="css/orderStyle.css">
<%
	ArrayList<HotelBean> lb = new ArrayList<HotelBean>();
	String user = (String) session.getAttribute("user");
	int hId = (Integer) session.getAttribute("hId");
	HotelBean hotelBean = new HotelBean();
	hotelBean.setUser(user);
	hotelBean.setHid(hId);

	lb = HotelDAO.orderView(hotelBean);

	int size = 0;
	size = lb.size();

	if (size == 0) {
%>
<body class="tbl">
	<h3 align="center">NO DATA TO SHOWN</h3>
	<%
		} else {
	%>
	<table width="500" border="1" align="center">

		<tr>
			<td align="center">Sl.No</td>

			<td align="center">ORDER_ID</td>

			<td align="center">ORDER_STATUS</td>

			<td align="center">ORDER_DATE</td>

			<td align="center">HOTEL_ID</td>

			<td align="center">CUSTOMER_ID</td>

			<td align="center">ITEM_ID</td>


			<td align="center">Action</td>






		</tr>
		<%
			int i = 1;

				for (HotelBean it : lb) {
		%>


		<tr>
			<td width="12" height="20" align="center"><span
				style="font-size: 14"><%=i++%></span></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getOid()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getStatus()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getDate()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getHid()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getCid()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><%=it.getIid()%></span>
				</div></td>
			<td width="43" align="center"><div align="center">
					<span style="font-size: 14"><a
						href="statusChange.jsp?oId=<%=it.getOid()%>&status=<%=it.getStatus()%>"><button>Update</button></a></span>
				</div></td>

		</tr>



		<%
			}
			}
		%>

	</table>
</body>