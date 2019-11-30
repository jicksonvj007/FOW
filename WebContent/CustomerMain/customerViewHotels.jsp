<%@page
	import="com.mvc.foodonwheels.beans.customerbean.CustomerViewHotelsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.mvc.foodonwheels.dao.customerdao.CustomerViewHotelsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../Common/header.jsp"%>
<section id="subscribe">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<h1 class=" heading wow fadeInUp" data-wow-duration="300ms"
						data-wow-delay="300ms">OUR HOTELS</h1>
					<div class="hotel-container">
						<%
							CustomerViewHotelsDao dao = new CustomerViewHotelsDao();
							ArrayList<CustomerViewHotelsBean> al = (ArrayList<CustomerViewHotelsBean>) dao.selectHotelsFromDb();
							int size = al.size();
							if (size == 0) {
						%>
						<h3>No hotels yet.............</h3>
						<%
							} else {
						%>
						<table>
							<tr>
								<th>Sl no</th>
								<th>Hotel</th>
							</tr>
							<%
								int count = 0;
									for (CustomerViewHotelsBean it : al) {
										count++;
							%>
							<tr>
								<td><%=count%></td>
								<td><p>
										<b><i><%=it.getHotelname()%></i></b><%=" , " + it.getStreetname() + " , " + it.getLocality() + " , " + it.getDistrict()%></p>
									<a href="customerViewItems.jsp?id=<%=it.getHotelid()%>">View
										Items</a></td>
							</tr>
							<%
								}
							%>
						</table>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close -->
</section>
<!-- #subscribe close -->
<%@ include file="../Common/footer.jsp"%>
