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
		<title>Total Business</title>

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
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
ResultSet rs1=null;
String url="jdbc:mysql://localhost:3306/ortho1";
FileInputStream fis=null;

HttpSession s10=request.getSession();
String did = (String)s10.getAttribute("did");
System.out.println(did);
String startdate=request.getParameter("date1");
String enddate=request.getParameter("date2");

try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection(url, "root", "root");

pstmt = conn.prepareStatement("select SUM(paid_fees) from treatment_details where Pid IN(select Pid from treatment where did= ? and Start_date between ? and ?)");
pstmt.setString(1, did);
pstmt.setString(2, startdate);
pstmt.setString(3, enddate);

PreparedStatement ps=conn.prepareStatement("select * from treatment_details where Pid IN(select Pid from treatment where did= ? and Start_date between ? and ?)");
ps.setString(1, did);
ps.setString(2, startdate);
ps.setString(3, enddate);


rs = pstmt.executeQuery();

rs1=ps.executeQuery();
	/* while(rs1.next()){
		System.out.println(rs1.getString(1));
	} */

while(rs.next()){
	 /*  out.println(rs.getString(1));
	  out.println(rs.getString(2)); */
	  System.out.println(rs.getString(1));
	 
	  
	  
	  
	  
	  %>
	 
<header id="header" id="home">
		  		<div class="header-top">
		  			<div class="container">
				  		<div class="row align-items-center">
				  			<div class="col-lg-6 col-sm-6 col-4 header-top-left no-padding">
				        		<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>			
				  			</div>
				  			<div class="col-lg-6 col-sm-6 col-8 header-top-right no-padding">
								<a class="logout-btn danger circle arrow" href="business.jsp"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
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
				         <!--  <h2 style="color:#fff;"> Welcome Doctor </h2> -->
				          <li><a href="dashboard.jsp">Dashboard</a></li>
				          <li><a href="totalbuisness.jsp">Total Business</a></li>
				          <li><a href="remainingfees.jsp">Remaining Business</a></li>
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    </div>
			  </header><!-- #header -->


		
		<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-12 no-padding appoinment-right">
							
							
			<form action="#" method="get">
			<h2> Paid Amount</h2>
			<div class="col-lg-12 d-flex flex-column mt-20">  
			  <input type="date" name="date1" class="form-control" style="width:50%;">
			  
			  </div>
			  <div class="col-lg-12 d-flex flex-column">
			  <input type="date" name="date2" class="form-control mt-20" style="width:50%;">
			  </div>
			  <div class="col-lg-12 d-flex flex-column mt-20">
			  <button class="genric-btn primary mt-20 text-uppercase ">Get Collection</button>
			  </div>
			  </form>
			  <div class="col-lg-12 d-flex flex-column mt-20">
			  <h1>
			  Rs.
			  <% 
			  out.println(rs.getString(1));
			 }
			  
			  %></h1>
			  </div>
			  <div class="progress-table-wrap mt-70">
							<div class="progress-table" style="margin-left:50px;width:90%">
								<div class="table-head">
								
									<div class="visit">Patient ID</div> 
									<div class="visit">Patient Name</div>
									<div class="visit">Paid Fees</div>
									
									
								</div>
			  <% 
			  while(rs1.next()){
	
	
	

				  %>
				  
<div class="table-row">
<div class="visit"><%=rs1.getString("Pid")%></div>
<div class="visit"><%=rs1.getString("Pname")%></div>
<div class="visit"><%=rs1.getString("paid_fees")%></div>
</div>
 
<%} %>
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


			    </div>
				</div>
				</div>	  	
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