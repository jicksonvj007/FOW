<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

	session = request.getSession(false);
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("customer_id") == null || session.getAttribute("customer_id") == "") {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
%>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FoodOnWheels</title>
<meta name="description" content="">
<script>
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS
        ================================================ -->
<!-- Owl Carousel -->
<link rel="stylesheet" href="../css/owl.carousel.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- Font-awesome.min css -->
<link rel="stylesheet" href="../css/font-awesome.min.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="../css/animate.min.css">

<link rel="stylesheet" href="../css/main.css">
<!-- Responsive Stylesheet -->
<link rel="stylesheet" href="../css/responsive.css">
<!-- Js -->
<script src="../js/vendor/modernizr-2.6.2.min.js"></script>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script>
	window.jQuery
			|| document
					.write('<script src="../js/vendor/jquery-1.10.2.min.js"><\/script>')
</script>
<script src="../js/jquery.nav.js"></script>
<script src="../js/jquery.sticky.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/plugins.js"></script>
<script src="../js/wow.min.js"></script>
<script src="../js/main.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<!--
	header-img start 
	============================== -->
	<section id="hero-area">
		<img class="img-responsive" src="../images/header.jpg" alt="">
	</section>
	<!--
    Header start 
	============================== -->
	<nav id="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<nav class="navbar navbar-default">
							<div class="container-fluid">
								<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a class="navbar-brand" href="#"> <img
										src="../images/Food-on-Wheels-logo.png" class="" alt="Logo">
									</a>

								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="top-nav-bar-">
									<ul class="nav navbar-nav navbar-right" id="top-nav-bar-right">
										<li><a href="../CustomerMain/customerHome.jsp">Home</a></li>
										<li><a href="../CustomerMain/customerViewHotels.jsp">Hotels</a></li>
										<li><a href="../CustomerMain/customerViewCart.jsp"
											style="text-transform: capitalize;"><i
												class="fa fa-shopping-cart"></i>&nbsp;&nbsp;MyCart</a></li>
										<li><a href="../CustomerAction/customerLogout.jsp">logout</a></li>
									</ul>
								</div>
								<!-- /.navbar-collapse -->
							</div>
							<!-- /.container-fluid -->
						</nav>
					</div>
				</div>
				<!-- .col-md-12 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .container close -->
	</nav>
	<!-- header close -->