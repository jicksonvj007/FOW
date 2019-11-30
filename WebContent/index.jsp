
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap.min css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Font-awesome.min css -->
<link rel="stylesheet" href="css/font-awesome.min.css">


<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
<script>
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 0);
	window.onunload = function() {
		null
	};
</script>
<script type="text/javascript">
	var title = [ 'Craving Something?', 'Late night work?', 'Hungry?',
			'Unexpected guest?', 'Cooking gone wrong?', 'Forgot to cook?' ];
	var i = 1;
	setInterval(function() {
		document.getElementById('questions').innerHTML = title[i++];
		if (i == title.length)
			i = 0;
	}, 2000);
	function passwordMatcher() {
		var passwordd = document.getElementById("passwordd").value;
		var passworddrepeat = document.getElementById("passwordd-repeat").value;
		if (passwordd != passworddrepeat
				|| document.getElementById('passwordd-repeat').value == null
				|| document.getElementById('passwordd-repeat').value == "") {
			document.getElementById('error').innerHTML = "Enter matching password";
			setTimeout(function() {
				document.getElementById('error').innerHTML = "";
			}, 2000);
			return false;
		} else {
			return true;
		}
	}
	function showAlert() {
		alert("Login or signup to continue...");
	}
</script>
</head>

<body>
	<section id="MainContent">
		<div class="container">
			<div class="col-md-12">
				<div class="col-md-7">
					<div class="text_container">
						<div class="col-md-12">
							<div class="col-md-8">
								<div class="col-md-12">
									<div class="col-md-3">
										<img src="images/Food-on-Wheels.png" width="100px"
											height="75px">
									</div>
									<div class="col-md-9">
										<h4 id="logo-caption">FOOD ON WHEELS</h4>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-right">
								<button
									onclick="document.getElementById('id01').style.display='block'">Sign Up</button>
								<button
									onclick="document.getElementById('id02').style.display='block'">Login</button>
							</div>
						</div>
						<br>
						<br>
						<br>
						<br>
						<div class="animate-style">
							<h1 id="questions">Craving Something?</h1>
							<h3>Order online on FoodOnWheels</h3>
						</div>
						<div class="input-style" id="contain">
							<div class="col-md-10">
								<input type="text" name="" placeholder="Enter Your Location"
									class="input-controls">
							</div>
							<div class="col-md-2">
								<button style="width: auto;" id="findfood" onclick="showAlert()">Find food</button>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-md-5">
					<img src="images/Display.jpg" height="100%" width="100%">
				</div>
			</div>
		</div>
	</section>
	<section id="SignUp">
		<div id="id01" class="modal">
			<form class="modal-content" method="post" action="CustomerAction/customersSignupAction.jsp">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span>
				<div class="modal-container">
					<h1>Sign Up</h1>
					<p>Please fill in this form to create an account.</p>
					<hr>
					<div class="field">
						<input type="text" name="name" class="input-controls"
							autocomplete="off" required> 
							<span class="floating-label">Your Name</span>
					</div>
					<div class="field">
						<input type="number" class="input-controls" name="phone"
							autocomplete="off" required> <span>Your phone
							number</span>
					</div>
					<div class="field">
						<input type="text" name="uemail" class="input-controls"
							autocomplete="off" required> <span>Enter Email</span>
					</div>
					<div class="field">
						<input type="text" class="input-controls" name="housename"
							autocomplete="off" required> <span>Your House Name</span>
					</div>
					<div class="field">
						<input type="number" class="input-controls" name="pincode"
							autocomplete="off" required> <span>Your pincode</span>
					</div>
					<div class="field">
						<input type="text" name="username" class="input-controls"
							autocomplete="off" required> <span class="floating-label">Your
							Username</span>
					</div>
					<div class="field">
						<input type="password" id="passwordd" name="passwordd" class="input-controls"
							autocomplete="off" required> <span class="floating-label">Your
							Password</span>
					</div>
					<div class="field">
						<input type="password" id="passwordd-repeat" name="passwordd-repeat"
							class="input-controls" autocomplete="off" required
							onkeyup="return passwordMatcher()"> <span
							class="floating-label">Repeat Password</span>
						<p id="error"></p>
					</div>
					<div class="clearfix">
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn" onclick="">Sign
							Up</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<section id="Login">
		<div id="id02" class="modall">
			<form class="modal-content" method="post" action="CustomerAction/customersLoginAction.jsp">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="close" title="Close Modal">&times;</span>
				<div class="modal-container">
					<h1>Log In</h1>
					<p>Please fill in this form to Login.</p>
					<hr>
					<div class="field">
						<input type="text" name="username" class="input-controls"
							autocomplete="off" required> <span class="floating-label">Your
							Username</span>
					</div>
					<div class="field">
						<input type="password" name="userpasswordd" class="input-controls"
							autocomplete="off" required> <span class="floating-label">Your
							Password</span>
					</div>
					<br>
					<div class="clearfix">
						<button type="button"
							onclick="document.getElementById('id02').style.display='none'"
							class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn">Log In</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<section id="footer">
		<div class="footer">copyright:2019@FoodOnWheels</div>
	</section>
	<script type="text/javascript">
		// Get the modal
		var modal = document.getElementById('id01');
		var modall = document.getElementById('id02');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			} else if (event.target == modall) {
				modall.style.display = "none";
			}
		}
	</script>
</body>
</html>


