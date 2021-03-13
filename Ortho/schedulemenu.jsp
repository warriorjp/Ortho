
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*,java.sql.*,java.util.*,java.text.*,java.text.SimpleDateFormat" %>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		
		
		<%
Connection conn=null;
ResultSet rs2=null;

//PreparedStatement pstmt = null;
int i=0;
ResultSet rs=null;
String url="jdbc:mysql://localhost:3306/ortho1?useSSL=false";
HttpSession sa=request.getSession();

String did = (String)sa.getAttribute("did");
String name=null;

//String startdate=request.getParameter("date1");


try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection(url, "root", "root");

 
 

PreparedStatement ps2=conn.prepareStatement("select * from docregistration where did=?");

ps2.setString(1, did);
System.out.println(did);
rs2 = ps2.executeQuery();
if(rs2.next()){
	name=rs2.getString("Name");
}


PreparedStatement ps=conn.prepareStatement("select * from treatment_details where Pid IN (select Pid from treatment where Did=?)");
ps.setString(1, did);
System.out.println("query....");


System.out.println("after query...");
rs = ps.executeQuery();

while(rs.next()){
	
	rs.getString("nextdate");
	
	System.out.println(rs.getString("nextdate"));
	
%>

 
			<header id="header" id="home">
		  		<div class="header-top">
		  			<div class="container">
				  		<div class="row align-items-center">
				  			<div class="col-lg-6 col-sm-6 col-4 header-top-left no-padding">
				        		<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>			
				  			</div>
				  			<div class="col-lg-6 col-sm-6 col-8 header-top-right no-padding">
								<a class="logout-btn danger circle arrow" href="dashboard.jsp"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
				  				<a class="logout-btn danger-border circle arrow" href="login.html">Logout<span class="lnr lnr-arrow-right"></span></a>		
				  				
				  				<a class="icons" href="#">
				  					<span class="lnr lnr-envelope"></span>
				  				</a>		
				  			</div>
				  		</div>			  					
		  			</div>
				</div>
			    	
			    <div class="container main-menu">
			    <marquee scrollamount="18">
			    	<div class="row align-items-center justify-content-between d-flex">
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <h2 style="color:#fff;"> Welcome &nbsp;  <%= name%></h2>
				          
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    	</marquee>
			    </div>
			  </header><!-- #header -->


		
			<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-6 no-padding appoinment-right">
						<div class="row ">
					
						<div class="col-lg-6 d-flex flex-column mt-20 pl-90">
						
								<div class="logo justify-content-center" style="height:200px">
								
                                <a href="todays.jsp?nextdate=<%=rs.getString("date")%>">
								<img src="./img/todayapp.png" style="margin-left:15px;">
								<h4 style="margin-left:5px"> &nbsp; Today's &nbsp; 
								Schedule</h4>
								</a>
								
                                </div>
							
						</div>
						<div class="col-lg-6 d-flex flex-column mt-20">
						
								<div class="logo justify-content-center " style="height:200px">
								
                                <a href="appo-filter.jsp">
								<img src="./img/nextapp.png" style="margin-left:5px;">
								<h4 style="margin-left:5px"> 
								Appointment's Filter</h4>
								</a>
								
                                </div>
							
						</div>
						
						
						
						
						</div>
							
						</div>											
					</div>
				</div>
			  </section>
		</body>
	</html>
	<%}

	}
catch(Exception e)
{
e.printStackTrace();
}

%>