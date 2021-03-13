<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.net.URL, javax.servlet.http.HttpServlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<h1>PRODUCTS DETAILS</h1>
<p>

<%
String img=null;
/* String web="H:\\Advancejava BBT Workspace\\complete_ortho2\\WebContent\\WEB-INF\\images\\"; */      
          
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ortho1", "root", "root");
                
                PreparedStatement ps = con.prepareStatement("SELECT  * FROM fileupload ");
                
               
                ResultSet rs = ps.executeQuery();
            %>
</p>
<%
            
while(rs.next())
{             img=rs.getString(1);   
/* String path=getServletContext().getRealPath("/images"); 
URL path2 =getServletContext().getResource(path+img);  */

//System.out.println(path+"......in view"+path2);
//OutputStream stream = getServletContext().getResourceAsStream("/images/"+img); 
 
 %>  
 <fieldset>  

 <table style=width:100%>  
      <tr>  
          <td>  
          <div style=""><img border="1" 
              src="images\\<%=img %>" height="150" width="150" /></div>  
          </td>  
           
             
             
     
          </td>  
      </tr>  
  </table>  
 </fieldset>  
    
 <%  
 /* System.out.println(request.getContextPath());    
 System.out.println(rs.getString("images"));    
 System.out.println(path+"in view"+img); */
 System.out.println(img);
}       %>  

 <%  
              
          %>
<p> </p>
 
</body>
</html>