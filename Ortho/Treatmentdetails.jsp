<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.swing.JOptionPane" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<style>

#myTable {
	background: #f9f9ff;
	padding: 15px 0px 30px 0px;
	width: 50%;
}

#myTable .serial {
	width: 20%;
	padding-left: 40px
}

#myTable .country {
	width: 40%;
	padding-left: 20px;
}

#myTable .visit {
	width: 40%;
	padding-left: 0;
}


#myTable .table-head {
	display: flex
}

#myTable .table-head .serial,
#myTable .table-head .country,
#myTable .table-head .visit,
#myTable .table-head .percentage {
	color: #222;
	line-height: 40px;
	text-transform: uppercase;
	font-weight: 500
}

#myTable .table-row {
	padding: 15px 0;
	border-top: 1px solid #edf3fd;
	display: flex
}

#myTable .table-row .serial,
#myTable .table-row .country,
#myTable .table-row .visit,
{
	display: flex;
	align-items: center
}

#myTable .table-row .country img {
	margin-right: 15px
}

#myTable .table-row .percentage .progress {
	width: 100%;
	border-radius: 0px;
	background: transparent
}

#myTable .table-row .percentage .progress .progress-bar {
	height: 5px;
	line-height: 5px
}

#myTable .table-row .percentage .progress .progress-bar.color-1 {
	background-color: #6382e6
}

#myTable .table-row .percentage .progress .progress-bar.color-2 {
	background-color: #e66686
}

#myTable .table-row .percentage .progress .progress-bar.color-3 {
	background-color: #f09359
}

#myTable .table-row .percentage .progress .progress-bar.color-4 {
	background-color: #73fbaf
}

#myTable .table-row .percentage .progress .progress-bar.color-5 {
	background-color: #73fbaf
}

#myTable .table-row .percentage .progress .progress-bar.color-6 {
	background-color: #6382e6
}

#myTable .table-row .percentage .progress .progress-bar.color-7 {
	background-color: #a367e7
}

#myTable .table-row .percentage .progress .progress-bar.color-8 {
	background-color: #e66686
}


* {
  box-sizing: border-box;
}






#myTable tr:hover {
  background-color: #f1f1f1;
}
</style>	

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
ResultSet rs4 = null;
int total;

String pid= request.getParameter("Pid");
String treatment = request.getParameter("treatment");
System.out.println(treatment+".....");
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
System.out.println(treatment+"ghe");
//Statement ps=connection.createStatement();
Statement ps2=connection.createStatement();
PreparedStatement ps=connection.prepareStatement("select * from treatment where Pid = "+pid);
rs1=ps.executeQuery();
System.out.println(pid+"tu pan ghe");
PreparedStatement ps3=connection.prepareStatement("select SUM(paid_fees) from treatment_details where Pid = ? and treatment = ?");
ps3.setString(1, pid);
ps3.setString(2,treatment);
rs2=ps3.executeQuery();
PreparedStatement ps4=connection.prepareStatement("select * from treatment_details where Pid = ? and treatment = ?");
ps4.setString(1, pid);
ps4.setString(2,treatment);
rs4=ps4.executeQuery();


if(rs1.next()){				
	
	System.out.println("pid get "+pid);
	HttpSession session120=request.getSession();
	session120.setAttribute("pid", rs1.getString(2));
	session120.setAttribute("pname",rs1.getString(3));
	session120.setAttribute("Total_fees", rs1.getString(6));
	//System.out.println("pname get "+pname);
	System.out.println(rs1.getString(2)+" "+rs1.getString(5) +" "+rs1.getString(3)+" "+rs1.getString(6));

%>
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
		<%
									if(rs2.next())
									{
										System.out.print(rs2.getString(1));
											%>
<section class="open-hour-area">
				<div class="container">
					<div class="row justify-content-center open-hour-wrap">
					
					 <!-- <div class="col-lg-12 d-flex flex-column mt-30"> -->
					<%--<div class="progress-table-wrap">
						<table id="myTable" style="width:75%;">
								<tr class="table-row">
								<td rowspan="2">	<button class="genric-btn warning mt-20 text-uppercase" onclick="document.getElementById('modal-wrapper2').style.display='block'">Open Treatment Form</button></td>
								<td><h3 class="text-white">
							Total Fees: Rs.<%= rs1.getString(6) %>
							 	</h3>    </td>
								</tr>
								<tr>
								<td>     <h3 class="text-white">
			                         <center>
			                         Remaining Fees: Rs.  <%
			                         String A = (rs1.getString(6));
			                         String B = (rs2.getString(1));
			                         int C = Integer.parseInt(A)- Integer.parseInt(B);
			                         if(C>=0){
			                         out.println(C);
			                         }
			                         else{
			                         out.println("Remaining Fees Going Negative, Check Paid Fees");
			                         }%>
			                         
								</center>
			                        
								</h3>     
								</td>
								</tr>
								</table>
								</div>
					</div> --%>
					<div class="col-lg-6 d-flex flex-column">
					<button class="ml-50 genric-btn warning mt-20 text-uppercase" onclick="document.getElementById('modal-wrapper2').style.display='block'">New Appointment</button>
					<a class="genric-btn primary text-uppercase" href="images.jsp?Pid=<%=rs1.getString("Pid")%>&treatment=<%=rs1.getString("treatment")%>">Upload Image</a>
					</div>
						 <div class="col-lg-6 d-flex flex-column">
						 <table id="myTable">
						 <tr>
						 <td><h4>Total Fees</h4></td>
						 </tr>
						 <tr  style="border:1px solid black;" class="mt-10">
						 <td>Rs.<%= rs1.getString(6) %></td>
						 </tr>
						 </table>
						 <table id="myTable" class="mt-10">
						 <tr>
						 <td><h4>Remaining Fees</h4></td>
						 </tr>
						 <tr  style="border:1px solid black;">
						 <td>  <%
			                         String A = (rs1.getString(6));
			                         String B = (rs2.getString(1));
			                         int C = Integer.parseInt(A)- Integer.parseInt(B);
			                         if(C>=0){
			                         out.println("Rs."+C);
			                         }
			                         else{
			                         out.println("Remaining Fees Going Negative, Check Paid Fees");
			                         }
			                         
			                         
			                        	%></td>
						 </tr>
						 
						 </table><%-- 
		                            <h3 class="text-white">
							Total Fees: Rs.<%= rs1.getString(6) %>
							 	</h3>    
		                            <!-- </div>
		                        <div class="col-lg-6 d-flex flex-column mr-20"> -->
			                         <h3 class="text-white">
			                         <center>
			                         Remaining Fees: Rs.  <%
			                         String A = (rs1.getString(6));
			                         String B = (rs2.getString(1));
			                         int C = Integer.parseInt(A)- Integer.parseInt(B);
			                         if(C>=0){
			                         out.println(C);
			                         }
			                         else{
			                         out.println("Remaining Fees Going Negative, Check Paid Fees");
			                         }%>
			                         
								</center>
			                        
								</h3>     
						 --%>		        </div>
		                    	 
		                        
						
						<%-- <div class="col-lg-6 no-padding appoinment-right">
							
		                    <form class="appoinment-form" id="myForm" action="treatment_details" method="post"> 
								
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
								
		                        </div>
 --%>		                        
		                     <div class="col-lg-12 d-flex flex-column ">
		                     
						<div class="progress-table-wrap mt-50">
						<table id="myTable" style="width:75%;" class="ml-100">
								<tr class="table-head">
									<th class="country">Date</th>
									<th class="country">Diagnosis</th>
									<th class="country">Medicine</th>
									<!-- <th class="country">Mobile No.</th> -->
									<!-- <th class="visit">Treatment</th> -->
									<th class="country">Paid Fees</th>
									</tr>
<%
while(rs4.next()){
	
	
	
%>

<tr class="table-row">
<td class="country"><%=rs4.getString("date")%></td>
<td class="country"><%=rs4.getString("Diagnosis") %></td>
<td class="country"><%=rs4.getString("medicine") %></td>
<td class="country"><%=rs4.getString("paid_fees") %></td> 
</tr>
<% 
}
%>									
  </table>
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

<div id="modal-wrapper2" class="modal2"> 
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
    
    </div>
	<!-- popup Treatment form -->

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
<%

}

/* String sql=("select * from treatment_details where treatment = "+treatment);
System.out.println(treatment+"in sql");
rs2 = ps2.executeQuery(sql);
if(rs2.next()) 
{
	 System.out.println("tu ye"+rs2.getString(1));
}  */ 
}
 catch (Exception e) {
e.printStackTrace();
}

%> 