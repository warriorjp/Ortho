 <%@page import="javax.swing.JOptionPane"%>
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
String treatment=request.getParameter("treatment");
System.out.println(treatment);
HttpSession session50=request.getSession();
String did=(String)session50.getAttribute("did");
HttpSession session55=request.getSession();

session55.setAttribute("treatment", treatment);
System.out.println("tu pan ghe."+did);

String Email = (String)session50.getAttribute("Name");
ResultSet rs =null;
System.out.println(Email+"in dashboard....");
String pid=(String)session50.getAttribute("Pid");
System.out.println("tu pan ghe."+pid);


System.out.println("tu pan ghe in images"+treatment);


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
PreparedStatement ps3=connection.prepareStatement("select * from treatment_details where Pid = ? and treatment = ?");
ps3.setString(1, pid);
ps3.setString(2,treatment);
rs=ps3.executeQuery();


if(rs.next())
{
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
								<a class="logout-btn danger circle arrow" href="Treatmentdetails.jsp?Pid=<%=rs.getString("Pid")%>&treatment=<%=rs.getString("treatment")%>"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
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
				          <h2 style="color:#fff;"> Welcome &nbsp;</h2>
				          
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    </div>
			  </header><!-- #header -->


		
			<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
						<div class="col-lg-12 no-padding appoinment-right">
						<div class="row ">
					
						<div class="col-lg-12 d-flex flex-column mt-20 pl-90">
						<FORM id="myForm" ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD="POST" class="appoinment-form">
<center>
<h1>Upload File</h1>
<table border="0" bgcolor=#ccFDDEE>

<tr><td colspan="2" align="center"> Choose the file To Upload:</td></tr>
<tr><td><INPUT name=" TYPE="text" value="<%=rs.getString("treatment") %>"></td>
</tr>
<tr><td><INPUT NAME="file" TYPE="file"></td>
</tr>

<tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
<table>
</center>
</FORM>
						
								
                                </div>
							
						</div>
						
						
						
						
						</div>
							
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
		</body>
		<%
}
		}
 catch (Exception e) {
e.printStackTrace();
}
%>
	</html>
