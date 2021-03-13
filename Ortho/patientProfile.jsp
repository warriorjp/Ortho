<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "ortho1";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet rs = null;

%>    
 
<%
String pid = request.getParameter("Pid");

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement ps=connection.createStatement();

rs = ps.executeQuery("select * from patient where Pid = "+pid);

if(rs.next()){				
	
	
	HttpSession ht = request.getSession();
	ht.setAttribute("Pid", rs.getString(1));
	ht.setAttribute("Pname", rs.getString(2));
	System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8));
		
} 

} catch (Exception e) {
e.printStackTrace();
}

%>    
    
<!DOCTYPE>
<html>

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
								<a class="logout-btn danger circle arrow" href="patientlist.jsp"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
								<a class="logout-btn danger-border circle arrow" href="login.jsp">Logout<span class="lnr lnr-arrow-right"></span></a>		
				  				
				  				<a class="icons" href="#">
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
				          <!-- <li><a href="about.html">About</a></li> -->
				          <li><a href="dashboard.jsp">Dashboard</a></li>
				          <li><a href="patientinfo.jsp">Patient Registration</a></li>	          	          
				          <!-- <li><a href="patientTreatment.jsp">New Treatment</a></li>			          	          
				          <li><a href="login.jsp">Log out</a></li> -->
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    </div>
				</header>
				<center>

				
				<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-12 no-padding appoinment-right">
							<h3 class="text-white mb-50" >
							<center>Patient Details</center>
							</h3><hr>
		                    <form class="appoinment-form" id="myForm" action="treatmentreg"></form>
							<div class="row pr-80">
						
							<div class="col-lg-6 d-flex flex-column mt-10">
							<h2><%= rs.getString(3)%></h2>
								
							</div>
							<div class="col-lg-6 d-flex flex-column">
							<a class="genric-btn primary text-uppercase" href="patientTreatment.jsp?Pid=<%=rs.getString("Pid") %>">Treatment</a>
							
							</div>
							
							<div class="col-lg-6 d-flex flex-column mt-10">
							<h4> Patient id :<%= rs.getString(1)%></h4>
								
							</div>
							<div class="col-lg-6 d-flex flex-column mt-10">
							<a class="genric-btn primary text-uppercase" href="viewimages.jsp?Pid=<%=rs.getString("Pid") %>">Images</a>
							</div>
							
				<%-- 			<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text ml-70 mt-10">Address:<%= rs.getString(9)%>
							</div>
							</div>
							
							<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text mt-10">Mobile No. <%= rs.getString(7)%>
							</div>
							</div>
							
							<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text mr-120 mt-10">Email ID: <%= rs.getString(8)%>
							</div>
							</div>
							
							
							<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text ml-70">Gender: <%= rs.getString(5)%>
							</div>
							</div>
							
							<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text">Age: <%= rs.getString(4)%>
							</div>
							</div>
							
							<div class="col-lg-4 d-flex flex-column mt-30">
							<div class="info-text mr-120">Blood Group: <%= rs.getString(6)%>
							</div>
							</div> --%>
							
							
							<div class="col-lg-12 d-flex flex-column mt-30">
							<div class="progress-table-wrap ml-50">
							<div class="progress-table" style="margin-left:30px;width:95%;border:1px solid black;">
								<div class="table-head">
									<div class="country">Address</div>
									<div class="country">Mobile</div>
									<div class="country">Gender</div>
								</div>
								<div class="table-row">
									<div class="country"><%= rs.getString(9)%></div>
									<div class="country"><%= rs.getString(7)%></div>
									<div class="country"><%= rs.getString(5)%></div>
								</div>
								<div class="table-head">
									<div class="country">Email</div>
									<div class="country">Blood Group</div>
									<div class="country">Age</div>
								</div>
								<div class="table-row" >
									<div class="country" ><%= rs.getString(8)%></div>
									<div class="country"><%= rs.getString(6)%></div>
									<div class="country"><%= rs.getString(4)%></div>
								</div>
							</div>
							</div>	
							</div>		
							
		                   							
									

						
						<div class="col-lg-12 d-flex flex-column mt-10">
						<hr>
						<h3 class="text-white mb-30 mt-20" >Treatments</h3>
						
						<div class="progress-table-wrap ml-50">
							<div class="progress-table" style="margin-left:30px;width:95%">
								<div class="table-head">
									<div class="country">Treatment Date</div>
									<!-- <div class="country">Diagnosis</div> -->
									<div class="visit">Treatment</div>
									<!-- <div class="visit">Medicine</div>
									<div class="visit">Progress</div>
									<div class="visit">Next Appointment</div> -->
									<div class="country">View </div>
									<div class="country">Appointment </div>
								</div>
								
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
//PreparedStatement ps=connection.prepareStatement("select * from treatment where patient_id = "+pid);
/* statement=connection.createStatement();
String sql ="SELECT * FROM patient"; */
Statement ps=connection.createStatement();
rs = ps.executeQuery("select * from treatment where Pid = "+pid+" ORDER BY Start_date DESC");
while(rs.next()){
%>

<div class="table-row">
<div class="country"><%=rs.getString("Start_date") %></div>
<div class="visit"><%=rs.getString("treatment") %></div> 

<div class="country"><a href="Treatmentdetails.jsp?Pid=<%=rs.getString("Pid")%>&treatment=<%=rs.getString("treatment")%>">View</a>
</div>

<div class="country"><a class="genric-btn primary" href="Appointment_details.jsp?Pid=<%=rs.getString("Pid") %>&Treatment=<%=rs.getString("treatment")  %>">Appointment</a>
</div>
</div>


<% 
}

} catch (Exception e) {
e.printStackTrace();
}

%>	
</div>
</div>
</div>		
</div>			
</div>
</div>	


<%-- <div id="modal-wrapper2" class="modal2"> 
	<form class="modal-content2 animate appoinment-form" id="myForm" action="treatment_details" method="post">      
    <div class="imgcontainer2">
    <span onclick="document.getElementById('modal-wrapper2').style.display='none'" class="close" title="Close">&times;</span> 
    <h3 class="text-white mt-20">
							<center>Todays Log</center>
							</h3>
		                        <div class="row">
		                    
								<div class="col-lg-12 d-flex flex-column">
		                                <input name="Patient_Id" value="<%=rs1.getString(2)%>"  class="form-control mt-20" readonly>
		                            </div>
		                            
		                            <div class="col-lg-12 d-flex flex-column"> 
		                                <input name="Patient _Name" value="<%=rs1.getString(3)%>"  class="form-control mt-20" readonly>
		                            </div>  
								
									<div class="col-lg-12 d-flex flex-column"> 
		                                <input name="treatment" value="<%=rs1.getString(5)%>"  class="form-control mt-20" readonly>
		                            </div>  
		                            <%
		                            }
		                            %>
								
									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">Date:</div>
									<input type="date" name="date" class="form-control mt-10" >
								
									</div>	
										
								    

									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">
										<textarea class="single-textarea form-control"  name="diagnosis" style="border:solid 1px #D2D1D5" placeholder="Diagnosis" onfocus="this.placeholder = ''" onblur="this.placeholder = ''"  ></textarea>
									</div>
									</div>
 									
									
									
									
									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">
										<textarea class="single-textarea form-control" name="medicine" style="border:solid 1px #D2D1D5" placeholder="Medicine" onfocus="this.placeholder = ''" onblur="this.placeholder = ''"  ></textarea>
									</div>
									</div>
									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">
										<textarea class="single-textarea form-control" name="progress" style="border:solid 1px #D2D1D5" placeholder="Long Term Goal/Patients Progress" onfocus="this.placeholder = ''" onblur="this.placeholder = ''"  ></textarea>
									</div>
									</div> 
									
									<div class="col-lg-12 d-flex flex-column">
									<div class="mt-20">Next Appointment:</div>
									<input type="date" name="nextdate" class="form-control mt-10" >
								
									</div>	
											
									<div class="col-lg-12 d-flex flex-column">
									
									
									
							        <input id="paid1 " name="paidfees"  placeholder="Paid <%= rs2.getString(1)%>"  class="form-control mt-20"   type="text">
		                        	</div>
		                        	
		                        										
									<!-- <div class="col-lg-12 d-flex flex-column">
							        <input name="noi"  placeholder="Number Of Installment" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Number Of Installment'" class="form-control mt-20"   type="text">
		                        	</div>
									<div class="col-lg-12 d-flex flex-column">
							        <input name="pa"  placeholder="Paid Amount" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Paid Amount'" class="form-control mt-20"   type="text">
		                        	</div>-->
		                        	
		                        	 		
		                        	 	
									<div class="col-lg-12 d-flex flex-column">
										<button type="submit" class="genric-btn primary mt-20 text-uppercase " >Save</button>
									
									</div>
									
									</div>
								</form>
    
    </div> --%>
</section>				
				
				
	
</body>
<script>
var modal1 = document.getElementById('modal-wrapper1');
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
var modal1 = document.getElementById('modal-wrapper2');
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>
</html>