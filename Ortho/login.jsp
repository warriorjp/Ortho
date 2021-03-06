<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>

 	 
 

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>

	
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="Quiesta Technologies Pvt. Ltd.">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Dentist</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/magnific-popup.css">
			<link rel="stylesheet" href="css/nice-select.css">							
			<link rel="stylesheet" href="css/animate.min.css">
			<link rel="stylesheet" href="css/jquery-ui.css">			
			<link rel="stylesheet" href="css/owl.carousel.css">
			<link rel="stylesheet" href="css/main.css">
			 <script src="bower_components/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="bower_components/sweetalert/dist/sweetalert.css">
		</head>
		<body>	
			  <header id="header" id="home">
		  		<div class="header-top">
		  			<div class="container">
				  		<div class="row align-items-center">
				  			<div class="col-lg-6 col-sm-6 col-4 header-top-left no-padding">
				        		<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>			
				  			</div>
				  			<div class="col-lg-6 col-sm-6 col-8 header-top-right no-padding">
								<a class="btns" href="tel:+953 012 3654 896">+953 012 3654 896</a>
				  				<a class="btns" href="mailto:support@colorlib.com">support@colorlib.com</a>		
				  				<a class="icons" href="tel:+953 012 3654 896">
				  					<span class="lnr lnr-phone-handset"></span>
				  				</a>
				  				<a class="icons" href="mailto:support@colorlib.com">
				  					<span class="lnr lnr-envelope"></span>
				  				</a>		
				  			</div>
				  		</div>			  					
		  			</div>
				</div>
			    <div class="container main-menu">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li class="menu-active"><a href="index.html">Home</a></li>
				          <li><a href="about.html">About</a></li>
				         <!--  <li><a href="patientlist.jsp">Patient List</a></li> -->	          	          
				         			          	          
				          <li><a href="contact.html">Contact</a></li>
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    </div>
			  </header><!-- #header -->


			 <section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-6 no-padding appoinment-right">
							<h1 class="text-white">
								 <center>Login</center>
							</h1>
		                    <form class="appoinment-form" id="myForm" action="doc_login" method="post">
		                        <div class="row">
		                            <div class="col-lg-12 d-flex flex-column">
		                                <input name="Email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" class="form-control mt-20" required="" type="email">
		                            </div>
		                                                       
									<div class="col-lg-12 d-flex flex-column">
		                                <input type="password" name="Password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" class="form-control mt-20" required="" type="text">
		                            </div>
		                            

		                            <div class="col-lg-12 d-flex flex-column">
									 <button class="genric-btn primary mt-20 text-uppercase ">Login</button>
										
		                            </div>
									<br>
								
									<div class="col-lg-12 d-flex flex-column mt-20">
										<a href="forgetpass.html"><h5> Forget Password? </h5></a>
										</div>
									
		                            <div class="alert-msg"></div>
		                        </div>
		                    </form>							
						</div>

					</div>
				</div>	
			
				
			</section>					
			  
			<footer class="footer-area section-gap">
				<div class="container">
				

					<div class="row footer-bottom d-flex justify-content-between">
						<p class="col-lg-8 col-sm-12 footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Quiesta Technologies Pvt. Ltd.
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					</div>
			</footer>
			<!-- End footer Area -->

			
		</body>
</html>

