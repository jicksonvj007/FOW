<%@page
	import="com.mvc.foodonwheels.dao.customerdao.CustomerViewItemsDao"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.mvc.foodonwheels.beans.customerbean.CustomerViewItemsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../Common/header.jsp"%>
<script>
	function onclickFunction(itemId,hotelId) {
		$.ajax({
			type : "post",
			url : "../CustomerAction/customerAddToCartAction.jsp",
			data : {
				itemId : itemId,
				hotelId: hotelId				
			},
			success : function(response) {
				if (response.type == "error") {
				    $('#msgs').html("<div class='alert alert-danger _alert_'>Failed to add</div>");
				    $('#msgs').delay(3000).fadeOut(400);
				} else {
					$('#modal-body').text("Successfully added to cart..");
					$('#successful').modal('show');
				}
			}
		});
		return false;
	}
</script>
<div class="modal fade" style="z-index: 99999"id="successful" tabindex="-1" role="dialog"
	aria-labelledby="Label" aria-hidden="true" data-close="1000"
	data-open="2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="memberModalLabel">Alert</h4>
			</div>
			<div class="modal-body" id="modal-message">
				Your item is added to Cart
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<section id="subscribe">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<div id="msgs"></div>
					<h1 class=" heading wow fadeInUp" data-wow-duration="300ms"
						data-wow-delay="300ms">OUR Dishes</h1>
					<div class="hotel-container">
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							CustomerViewItemsBean customerViewItemsBean = new CustomerViewItemsBean();
							customerViewItemsBean.setHotelId(id);
							CustomerViewItemsDao customerViewItemsDao = new CustomerViewItemsDao();
							ArrayList<CustomerViewItemsBean> al = (ArrayList<CustomerViewItemsBean>) customerViewItemsDao
									.selectItemsFromDb(customerViewItemsBean);
							int size = al.size();
							if (size == 0) {
						%>
						<h3>No items yet.............</h3>
						<%
							} else {
						%>
						<table>
							<tr>
								<th>Sl no</th>
								<th>Item</th>
								<th>Price</th>
							</tr>
							<%
								int count = 0;
									for (CustomerViewItemsBean it : al) {
										count++;
							%>
							<tr>
								<td><%=count%></td>
								<td><p>
										<b><i><%=it.getItemName()%></i></b>
									</p></td>
								<td><%=it.getItemPrice()%><a
									href="#" onclick="return onclickFunction('<%=it.getItemId()%>','<%=it.getHotelId()%>')">Add to
										cart&nbsp;&nbsp;&nbsp;<i class="fa fa-shopping-cart"></i>
								</a></td>
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
