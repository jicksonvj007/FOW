<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../Common/header.jsp"%>
<script>
	function onclickFunction(itemId, hotelId) {
		$
				.ajax({
					type : "post",
					url : "../CustomerAction/customerAddToCartAction.jsp",
					data : {
						itemId : itemId,
						hotelId : hotelId
					},
					success : function(response) { 
						if (response.type == "error") {
							$('#msgs')
									.html(
											"<div class='alert alert-danger _alert_'>Failed to add</div>");
							$('#msgs').delay(3000).fadeOut(400);
						} else {
							$('#successful').modal('show');
						}
					}
				});
		return false;
	}
</script>

<!--
    about-us start
    ============================== -->
<div class="modal fade"  style="z-index: 99999" id="successful" tabindex="-1" role="dialog"
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
			<div class="modal-body">
				Your item is added to Cart
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<section id="about-us">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
				<div id="msgs"></div>
					<img class="wow fadeInUp" data-wow-duration="300ms"
						data-wow-delay="400ms" src="../images/Food-on-Wheels-logo.png"
						alt="cooker-img">
					<h1 class="heading wow fadeInUp" data-wow-duration="400ms"
						data-wow-delay="500ms">
						We present the best in<br> <span>FoodOnWheels</span>
					</h1>
					<p class="wow fadeInUp" data-wow-duration="300ms"
						data-wow-delay="600ms">
						We make a platform for you to book your favorite dishes form your
						favorite restaurants With great quality and best price.<br>
						We have food for every occasions..<br> You Order.. We
						Delivers.. Its always hot....
					</p>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .containe close -->
</section>
<!-- #call-to-action close -->
<!--
    blog start
    ============================ -->
<section id="blog">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<h1 class="heading">
						Food <span>From</span> the <span>Masters</span>
					</h1>
					<ul>
						<li class="wow fadeInLeft" data-wow-duration="300ms"
							data-wow-delay="300ms"> 
							<div class="blog-img">
								<img src="../images/blog/blog-img-1.jpg" alt="blog-img">
							</div>
							<div class="content-right">
								<h3>
									Chicken Pot Pie<a href="#"
										onclick="return onclickFunction('9','1')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>Prepared in true England fashion. Tender all-white meat
									chicken simmered...(Ustad Hotel)</p>
							</div>
						</li>
						<li class="wow fadeInLeft" data-wow-duration="300ms"
							data-wow-delay="400ms">
							<div class="blog-img">
								<img src="../images/blog/blog-img-2.jpg" alt="blog-img">
							</div>
							<div class="content-right">
								<h3>
									Waffle Cracker<a href="#"
										onclick="return onclickFunction('5','3')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>Crazy Waffle combo with a fruit blast, Creates explosion
									in your mouth...(Uduppi)</p>
							</div>
						</li>
						<li class="wow fadeInLeft" data-wow-duration="300ms"
							data-wow-delay="500ms">
							<div class="content-left">
								<h3>
									Beef Roast<a href="#" onclick="return onclickFunction('8','2')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>Kerala style beef roasted with pepper garlic,ginger etc
									which goes well with anything...(Thallicherry)</p>
							</div>
							<div class="blog-img-2">
								<img src="../images/blog/blog-img-3.jpg" alt="blog-img">
							</div>
						</li>
						<li class="wow fadeInLeft" data-wow-duration="300ms"
							data-wow-delay="600ms">
							<div class="content-left">
								<h3>
									Chicken barbecue<a href="#"
										onclick="return onclickFunction('10','1')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>A tasteful combination chicken and sausage with Italian
									spices...(Ustad Hotel)</p>
							</div>
							<div class="blog-img-2">
								<img src="../images/blog/blog-img-4.jpg" alt="blog-img">
							</div>
						</li>
						<li class="wow fadeInLeft" data-wow-duration="300ms"
							data-wow-delay="700ms">
							<div class="blog-img">
								<img src="../images/blog/blog-img-5.jpg" alt="blog-img">
							</div>
							<div class="content-right">
								<h3>
									Pancakes<a href="#" onclick="return onclickFunction('7','5')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>We have different Pancakes with touch of Indian,Italian
									spices...(Western Fusion)</p>
							</div>
						</li>
						<li class="wow fadeInUp" data-wow-duration="300ms"
							data-wow-delay="800ms">
							<div class="blog-img">
								<img src="../images/blog/blog-img-6.jpg" alt="blog-img">
							</div>
							<div class="content-right">
								<h3>
									Chicken Biriyani<a href="#"
										onclick="return onclickFunction('6','2')"><i
										class="fa fa-shopping-cart"></i></a>
								</h3>
								<p>Prepared in true New England fash-ion. Tender all-white
									meat chicken simmered...(Thallicherry)</p>
							</div>
						</li>
					</ul>
					<a class="btn btn-default btn-more-info wow bounceIn"
						data-wow-duration="500ms" data-wow-delay="1200ms"
						href="customerViewHotels.jsp" role="button">MORE HOTELS</a>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .containe close -->
</section>
<!-- #blog close -->
<!--
    price start
    ============================ -->
<section id="price">
	<div class="container wow fadeInUp" data-wow-duration="500ms"
		data-wow-delay="300ms">
		<div class="row">
			<div class="col-md-12">
				<h1 class="heading">
					Our <span>Featured</span> Dishes
				</h1>
				<br>
				<div class="col-md-3">
					<div class="image_container">
						<img src="../images/food2.jpg" alt="Headphones"
							class="img-responsive image_image">
						<div class="image_Overlay">
							<div class="image_Overlay_text">
								Italian Pawn toast
								<h4>
									You can have pawn <br>Italian style<br>(Cafe Italian)
								</h4>
							</div>
						</div>
						<h3>
							Rs.65<a href="#" onclick="return onclickFunction('1','4')"><i
								class="fa fa-shopping-cart"></i></a>
						</h3>
					</div>
				</div>
				<div class="col-md-3">
					<div class="image_container">
						<img src="../images/food4.jpg" alt="Headphones"
							class="img-responsive image_image">
						<div class="image_Overlay">
							<div class="image_Overlay_text">
								Punchabi Pawn masala
								<h4>
									You can have pawn <br>Punchabi style<br>(Western Fusion)
								</h4>
							</div>
						</div>
						<h3>
							Rs.95<a href="#" onclick="return onclickFunction('3','5')"><i
								class="fa fa-shopping-cart"></i></a>
						</h3>
					</div>
				</div>
				<div class="col-md-3">
					<div class="image_container">
						<img src="../images/food5.jpg" alt="Headphones"
							class="img-responsive image_image">

						<div class="image_Overlay">
							<div class="image_Overlay_text">
								Chuttaracha chammanthi
								<h4>
									You can have Nadan <br>Chuttaracha chammanthi<br>(Uduppi)
								</h4>
							</div>
						</div>
						<h3>
							Rs.35<a href="#" onclick="return onclickFunction('4','3')"><i
								class="fa fa-shopping-cart"></i></a>
						</h3>
					</div>
				</div>
				<div class="col-md-3">
					<div class="image_container">
						<img src="../images/food7.jpg" alt="Headphones"
							class="img-responsive image_image">

						<div class="image_Overlay">
							<div class="image_Overlay_text">
								Spanish pasta
								<h4>
									You can have pasta <br>Spanish style<br>(Cafe Italian)
								</h4>
							</div>
						</div>
						<h3>
							Rs.135<a href="#" onclick="return onclickFunction('2','4')"><i
								class="fa fa-shopping-cart"></i></a>
						</h3>
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .containe close -->
</section>
<!-- #price close -->


<%@ include file="../Common/footer.jsp"%>