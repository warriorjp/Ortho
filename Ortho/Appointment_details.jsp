<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.swing.JOptionPane" %>

<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "ortho1?useSSL=false";
String userId = "root";
String password = "root";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet rs1 = null;
ResultSet rs2 = null;

%>    

<%
/* HttpSession ht1 = request.getSession();
String pid = (String)ht1.getAttribute("Patient_Id");
String pname = (String)ht1.getAttribute("Patient_Name"); */
String pid = request.getParameter("Pid");
String treatment = request.getParameter("Treatment");
System.out.println(treatment+".....");

try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement ps=connection.createStatement();

/* rs1 = ps.executeQuery("select * from patientregistration where patient_id = "+pid+ "and patient_name= "+patient_name); */
rs1 = ps.executeQuery("select * from treatment where Pid = "+pid);

PreparedStatement ps3=connection.prepareStatement("select SUM(paid_fees) from treatment_details where Pid = ? and treatment = ?");
ps3.setString(1, pid);
ps3.setString(2,treatment);
rs2=ps3.executeQuery();

if(rs1.next()){				
	
	/* System.out.println(rs.getString("patient_id")+" "+rs.getString("patient_name"));
	String pid2=rs.getString(1); */
	//System.out.println(patient_name);
	System.out.println("pid get "+pid);
	HttpSession session7=request.getSession();
	session7.setAttribute("pid", rs1.getString(2));
	session7.setAttribute("pname",rs1.getString(3));
	//System.out.println("pname get "+pname);
	System.out.println(rs1.getString(1)+" "+rs1.getString(3));
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ortho - Patient Treatment</title>

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
			
<script type="text/javascript">
function showAlert(){
alert("Hi This is Simple alert");
}
</script>


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
								<a class="logout-btn danger circle arrow" href="patientProfile.jsp?Pid=<%= pid%>"><span class="lnr lnr-arrow-left"></span>&nbsp;&nbsp;Back</a>
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
				          <li><a href="dashboard.jsp">Dashboard</a></li>
				          <li><a href="patientinfo.jsp">Patient Registration</a></li>
				          <li><a href="patientlist.jsp">Patient List</a></li>
				          
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
							<center>Todays Log</center>
							</h1>
		                    <form class="appoinment-form" id="myForm" action="Appointment_details" method="post"> 

		                        <div class="row">
								<div class="col-lg-12 d-flex flex-column">
		                                <input name="Patient_Id" value="<%=rs1.getString(2)%>"  class="form-control mt-20" readonly>
		                            </div>
								
									<div class="col-lg-12 d-flex flex-column"> 
		                                <input name="Patient _Name" value="<%=rs1.getString(3) %>"  class="form-control mt-20" readonly>
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
									<%
									if(rs2.next())
									{
									%>
		                            
		                      		<div class="col-lg-12 d-flex flex-column">
									
									
									
							        <input id="paid1 " name="paidfees"  placeholder="Paid <%=rs2.getString(1) %>"  class="form-control mt-20"   type="text">
		                        	</div>
		                        	<%
		                        	}%>
									
														
									<div class="col-lg-12 d-flex flex-column">
										<button type="submit" class="genric-btn primary mt-20 text-uppercase " >Save</button>
									</div>
									
									</div>
								</form>
		                        </div>
		       				</div>
						</div>
			</section>

			
<%

 

} catch (Exception e) {
e.printStackTrace();
}

%>    

<!-- **********************Treatment*********************************** --> 
<%--  
<%

HttpSession ht1 = request.getSession();
String pid1 = (String)ht1.getAttribute("Patient_Id");
String pname = (String)ht1.getAttribute("Patient_Name");
String date = request.getParameter("date");
String diagnosis=request.getParameter("diagnosis");
String treatment=request.getParameter("treatment");
String medicine=request.getParameter("medicine");
String progress=request.getParameter("progress");
String nextdate=request.getParameter("nextdate");
String totalfees=request.getParameter("totalfees");
String noi=request.getParameter("noi");
String pa=request.getParameter("pa");
String ra=request.getParameter("ra");

try{
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("register!");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho","root","actionpop");
	System.out.println("connected!");
	
	PreparedStatement ps=con.prepareStatement("Insert into treatment values(?,?,?,?,?,?,?,?,?,?,?,?)");
	System.out.println("Query!");
	
	ps.setString(1,pid1);
	System.out.println(pid1);
	ps.setString(2,pname);
	System.out.println(pname);
	ps.setString(3,date);
	System.out.println(date);
	ps.setString(4,diagnosis);
	System.out.println(diagnosis);
	ps.setString(5,treatment);
	System.out.println(treatment);
	ps.setString(6,medicine);
	System.out.println(medicine);
	ps.setString(7,progress);
	System.out.println(progress);
	ps.setString(8,nextdate);
	System.out.println(nextdate);
	ps.setString(9,totalfees);
	System.out.println(totalfees);
	ps.setString(10,noi);
	System.out.println(noi);
	ps.setString(11,pa);
	System.out.println(pa);
	ps.setString(12,ra);
	System.out.println(ra);
	
	int i=ps.executeUpdate();
	if(i>0)
	{
		/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() {");
		out.println("swal('Good job!', 'Record Stored Successfully!', 'success');");
		out.println("});");
		out.println("</script>");*/
		
		RequestDispatcher rd = request.getRequestDispatcher("patientProfile.jsp");
		rd.include(request, response);
		//response.sendRedirect("patientProfile.jsp");
		JOptionPane.showMessageDialog(null, " Record Stored Successfully! ");
	}
ps.close();
con.close();
}
catch(Exception e)
{
	out.println(e);
}
out.close();




%> --%>

		
		
		
	
</body>

</html>