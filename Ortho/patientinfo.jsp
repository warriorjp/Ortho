 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

 
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ortho1";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
/* Connection connection = null;

ResultSet resultSet = null; */
try{
 

HttpSession session6=request.getSession();
String did=(String)session6.getAttribute("did");
System.out.println(did+"in patient info");



HttpSession session2=request.getSession();
session2.setAttribute("did", did);



%>





<!DOCTYPE html>
	<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Ortho - Patient Registration</title>

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
								<a class="logout-btn danger circle arrow" href="patientmenu.jsp"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
				  				<a class="logout-btn danger-border circle arrow" href="login.jsp">Logout<span class="lnr lnr-arrow-right"></span></a>	
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
				          <!-- <li class="menu-active"><a href="index.html">Home</a></li> -->
				         <!--  <li><a href="about.html">About</a></li> -->
				          <!-- <li><a href="patientinfo.html">Patient Registration</a></li> -->
				          <li><a href="dashboard.jsp">Dashboard</a></li>
				          <li><a href="patientlist.jsp">Patient List</a></li>
				                    	          
				          <!-- <li><a href="elements.html">Elements</a></li>			          	          
				          <li><a href="contact.html">Contact</a></li> -->
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
								 <center>Patient Registration</center>
							</h1>
		                    <form class="appoinment-form" id="myForm" action="patient_registration" method="get">
		                        <div class="row">
									
		                        
	                            <div class="col-lg-12 d-flex flex-column">
							        <input name="Patient Name" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'" class="form-control mt-20"  type="text" required pattern="^[A-Za-z -]+$">
		                        </div>
								
								<div class="col-lg-12 d-flex flex-column">
		                            <input name="Age" placeholder="Age" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Age'" class="form-control mt-20 " maxlength="02" type="text" required >	
		                        </div>
									
								<div class="col-lg-12 d-flex flex-column mt-20">
									<div >
									Gender:
									<input class="r1" type="radio" name="gender" value="male" required> Male
									<input class="r2" type="radio" name="gender" value="female"> Female
									<p>
									</div>
								</div>
																	
								<div class="col-lg-12 d-flex flex-column ">
		                            <input name="Bloodgroup" placeholder="Bloodgroup" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Bloodgroup'" class="form-control mt-10" required  type="text" pattern="^(A|B|AB|O)[-+]$">
		                        </div>
	
	
									<div class="col-lg-12 d-flex flex-column ">
		                            <input type="date" name="dob" placeholder="Date Of Birth" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Date Of Birth'" class="form-control mt-10" required/>
		                        </div>
	
	
								
		                            <div class="col-lg-12 d-flex flex-column">
		                                <input name="Patient Mobile" placeholder="Patient Mobile No" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Mobile No'" class="form-control mt-20" type="tel"  maxlength="10" required >
		                            </div>
											                            <div class="col-lg-12 d-flex flex-column">
		                                <input name="E-mail" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'" class="form-control mt-20"  type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
		                            </div>   
																		
									
									
									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">
										<textarea class="single-textarea form-control" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required></textarea>
									</div>
									</div>
		                            <div class="col-lg-12 d-flex flex-column">
										<button class="genric-btn primary mt-20 text-uppercase" onclick="myFunction()">Save</button>
		                            </div>
		                            

									</div>
									
								</form>
								
		                        </div>
		                    					
						</div>
						
						</div>
					
	<!-- popup apointment form -->
	<button class="openbut" onclick="document.getElementById('modal-wrapper').style.display='block'">Schedule Appointment</button>
	<div id="modal-wrapper" class="modal1"> 
	<form class="modal-content1 animate" action="/action_page.php">      
        <div class="imgcontainer1">
        <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close">&times;</span> 
        <h1 style="text-align:center">New appoinment</h1>
        </div>
        <div class="container1">
        <input name="Patient Name" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'" class="form-control mt-20" required="" type="text" required>
	<input name="Patient Mobile" placeholder="Mobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Mobile No'" class="form-control mt-20" type="text" required >
	<h4 style="text-align:center">Appoinment date</h4>
	<input type="date" class="form-control mt-10" name="date" style="border:solid 2px #D2D1D5" required>  
	<div class="col-lg-12 d-flex flex-column">
	<button class="genric-btn primary mt-20 text-uppercase ">Schedule Date</button>
	</div>
        <!-- <button class="genric-btn primary mt-20 text-uppercase ">Insert Data</button> -->
        </div>
        </form>
        </div>
	<!-- popup apointment form -->					
					
				
			</section>
<script>
	// If user clicks anywhere outside of the modal, Modal will close

	var modal1 = document.getElementById('modal-wrapper');
	window.onclick = function(event) {
        if (event.target == modal1) {
        modal1.style.display = "none";
       }
     }
        </script>				
			
			<footer class="footer-area section-gap">
				<div class="container">
				

					<div class="row footer-bottom d-flex justify-content-between">
						<p class="col-lg-8 col-sm-12 footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
					</div>
			</footer>
			<!-- End footer Area -->
<script>
function myFunction(){
	alert("Registered Successfully!");
}
</script>


	
		</body>
	</html>				
 
<% 

//connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
			 