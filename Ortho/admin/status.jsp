
<%-- <%@page import="javax.swing.text.html.HTMLDocument$HTMLReader.PreAction"%> --%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
ResultSet rs3 = null;


String did = request.getParameter("email");


 /* try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
Statement ps=connection.createStatement();
int status = 0;
PreparedStatement ps2= connection.prepareStatement("insert into status values(?,?)");
ps2.setString(1, did);
ps2.setInt(2, status);


int i=ps2.executeUpdate();

if(i>0){
	out.println("record inserted....");
	response.sendRedirect("home.jsp");
}


}
catch(Exception e)
{
	e.printStackTrace();
}
 */
try{ 
int status=0;	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
PreparedStatement ps3= connection.prepareStatement("select * from status where did=?");
ps3.setString(1,did);
rs3=ps3.executeQuery();
if(rs3.next())
{
	status=rs3.getInt("status");
	System.out.println(status);
}


PreparedStatement ps4= connection.prepareStatement("update status set status= ? where did=?");
if(status==1){
	status=0;
ps4.setInt(1, status);}
else if(status==0)
{
	status=1;	
	ps4.setInt(1, status);	
}
ps4.setString(2,did);


int i=ps4.executeUpdate();

if(i==1){
	response.sendRedirect("home.jsp");
}


}
catch(Exception e)
{
	e.printStackTrace();
}

%>    

    
    