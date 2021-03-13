<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>


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
		<title>Todays Schedule</title>

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
								
				  				<a class="logout-btn danger-border circle arrow" href="login.jsp">Logout<span class="lnr lnr-arrow-right"></span></a>		
				  				
				  				<a class="icons" href="#">
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
				          <!-- <li><a href="about.html">About</a></li> -->
				          <li><a href="dashboard.jsp">Home</a></li>
				          <li><a href="Appointments.jsp">Appointment Filter</a></li>	          	          
				          <!-- <li><a href="patientTreatment.jsp">New Treatment</a></li>			          	          
				          <li><a href="login.jsp">Log out</a></li> -->
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    			  </header><!-- #header -->


		
			<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-12 no-padding appoinment-right">
						<div class="row pr-100">
						
						<div class="col-lg-12 d-flex flex-column mt-20">
					      <h3 class="text-white mb-50" >
							<center>Today's Appointments</center>
							</h3>
						</div>
						
						<div class="col-lg-12 d-flex flex-column">
						<div class="progress-table-wrap mt-10">
							<div class="progress-table" style="margin-left:50px;width:90%">
								<div class="table-head">
								
									 <div class="visit">Patient ID</div> 
									<div class="visit">Patient Name</div>
									<div class="visit">Date</div>
									
									
								</div>
<%
Connection conn=null;


String url="jdbc:mysql://localhost:3306/ortho1?useSSL=false";
HttpSession sb=request.getSession();

String did = (String)sb.getAttribute("did"); 
 
//String startdate=request.getParameter("date");


try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection(url, "root", "root");
Date date1=new Date();
 SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
 String date2=date.format(date1);
 System.out.println(date2+"......");


PreparedStatement ps=conn.prepareStatement("select * from treatment_details where Pid IN (select Pid from treatment where Did=?)");
//ps.setString(1, startdate);
ps.setString(1, did);
System.out.println("query....");
ResultSet rs1=ps.executeQuery();

   

System.out.println("after query...");

while(rs1.next()){
	if((date2.equals(rs1.getString(8)))){
	System.out.println(rs1.getString(8)+"in loop");



 %>
								
							
						
										 
										
			<div class="table-row">
<div class="visit"><%=rs1.getString("Pid")%></div>
<div class="visit"><%=rs1.getString("Pname")%></div>
<div class="visit"><%=rs1.getString("nextdate")%></div>



  
 </div>
 
<%} }%>
								
								
							</div>
						
						</div>
							 
						
						</div>
						</div>	
					</div>   
							
						
						
						
						
						
							
						</div>
						</div>
						
					  
						
					<!-- popup apointment form -->
	<button class="openbut" onclick="document.getElementById('modal-wrapper1').style.display='block'">Schedule Appointment</button>
	<div id="modal-wrapper1" class="modal1"> 
	<form class="modal-content1 animate" action="remainingfees.jsp">      
    <div class="imgcontainer1">
    <span onclick="document.getElementById('modal-wrapper1').style.display='none'" class="close" title="Close">&times;</span> 
    <h1 style="text-align:center">New Appointment</h1>
    </div>
    <div class="container1">
    <input name="Patient Name" placeholder="Patient Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Name'" class="form-control mt-20"  	type="text" required>
	<input name="Patient Mobile" placeholder="Mobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Patient Mobile No'" class="form-control mt-20" 	type="text" required >
	<h4 style="text-align:center">Appointment date</h4>
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
var modal1 = document.getElementById('modal-wrapper1');
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>



		</body>
	</html>
	<%

	}
catch(Exception e)
{
e.printStackTrace();
}

%>