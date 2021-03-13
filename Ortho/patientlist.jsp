<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>

<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "ortho1";
String userId = "root";
String password = "root";

HttpSession session3=request.getSession();
String did=(String)session3.getAttribute("did");



System.out.println(did);


try {
	
	
	Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
	<!DOCTYPE html>
	<html lang="zxx" class="no-js">
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
	<title>Ortho - Patient List</title>	
		

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
				          <!-- <li><a href="about.html">About</a></li> -->
				          <li><a href="dashboard.jsp">Dashboard</a></li>
				          <li><a href="patientinfo.jsp">Patient Registration</a></li>	          	          			          	          
				        </ul>
				      </nav><!-- #nav-menu-container -->	    		
			    	</div>
			    </div>
				</header>
				<center>
				
				<section class="open-hour-area">
				<div class="container"><form action="patientlist.jsp" method="post">
<div class="row justify-content-center open-hour-wrap">

						<div class="col-lg-12 no-padding appoinment-right">
						
						<div class="row">
						
		                            <div class="col-lg-12 d-flex flex-column">
									

    <input id="myInput" type="text" class="form-control mt-20" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
   

						
							
</div>
	<div class="col-lg-12 d-flex flex-column">						
<h3 class="mb-30 mt-30">Patient List</h3>
</div>
<div class="col-lg-12 d-flex flex-column ml-150">
						<div class="progress-table-wrap">
						<table id="myTable" style="width:75%;">
								<tr class="table-head">
									<th class="country">Patient Id</th>
									<th class="country">Patient Name</th>
									<th class="country">Age</th>
									<!-- <th class="country">Mobile No.</th> -->
									<!-- <th class="visit">Treatment</th> -->
									<th class="country">Profile</th>
									</tr>
								
								
								

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
PreparedStatement ps=connection.prepareStatement("select * from patient where did=?");
 
ps.setString(1, did);
System.out.println(did);
resultSet = ps.executeQuery();

while(resultSet.next()){
	
	
	
%>

<tr class="table-row">
<td class="country"><%=resultSet.getString("Pid")%></td>
<td class="country"><%=resultSet.getString("Pname") %></td>
<td class="country"><%=resultSet.getString("age") %></td>
<td class="country"><a href="patientProfile.jsp?Pid=<%=resultSet.getString("Pid") %>">View Details</a></td> 
</tr>
<% 
}

} catch (Exception e) {
e.printStackTrace();
}

%>
				</table>
				
				</div>
				</div>
				
			</div></div>
				</div>
			   </form> 
			
				
			
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


<script type="text/javascript">
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>				
				
				

   
</body>
</html> 