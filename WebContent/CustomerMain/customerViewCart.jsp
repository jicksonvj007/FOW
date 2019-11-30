<%@page
	import="com.mvc.foodonwheels.dao.customerdao.CustomerViewItemsDao"%>
<%@page
	import="com.mvc.foodonwheels.beans.customerbean.CustomerViewItemsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.mvc.foodonwheels.dao.customerdao.CustomerAddToCartDao"%>
<%@page
	import="com.mvc.foodonwheels.beans.customerbean.CustomerAddToCartBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script type="text/javascript">
	onload=function(){
		var e=document.getElementById("refreshed");
		if(e.value=="no"){
			e.value="yes";
		}else{
			e.value="no";
			location.reload();
		}
	}
</script>
<%@ include file="../Common/header.jsp"%>
<input type="hidden" id="refreshed" value="no">
<section id="subscribe">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<h1 class=" heading wow fadeInUp" data-wow-duration="300ms"
						data-wow-delay="300ms">Your Orders</h1>
					<div class="hotel-container">
						<%
							int id = (Integer) session.getAttribute("customer_id");
							CustomerAddToCartBean customerAddToCartBean = new CustomerAddToCartBean();
							customerAddToCartBean.setCustomerId(id);
							CustomerAddToCartDao customerAddToCartDao = new CustomerAddToCartDao();
							ArrayList<CustomerAddToCartBean> al = (ArrayList<CustomerAddToCartBean>) customerAddToCartDao
									.selectFromCartData(customerAddToCartBean);

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
								int count = 0, total = 0;
									for (CustomerAddToCartBean cart : al) {
										count++;
							%>
							<tr>
								<td><%=count%></td>
								<td><p>
										<b><i><%=cart.getItemName()%></i></b>
									</p></td>
							  	<td><%=cart.getItemPrice()%>
							 <!-- 	<a
									href="../CustomerAction/customerRemoveItemFromCartAction.jsp?item_id=<%=cart.getItemId()%>">Remove
										from cart&nbsp;&nbsp;&nbsp;<i class="fa fa-shopping-cart"></i>
								</a></td>   
							-->	
								
								
								<td>		
								<a href="../CustomerAction/customerRemoveItemFromCartAction.jsp?cId=<%=cart.getCartId()%>">Remove from cart</a>
								</td>
								
								
								
							</tr>
							<%
								total += Integer.parseInt(cart.getItemPrice());
									}
							%>
							<tr>
								<td>Total</td>
								<td><%=total%></td>
								<td><a
									href="../CustomerAction/customerBuyNowAction.jsp?customer_id=<%=id%>&total=<%=total%>&count=<%=count%>">Buy
										Now</a></td>
							</tr>
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
<%@ include file="../Common/footer.jsp"%>