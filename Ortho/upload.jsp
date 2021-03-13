<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<%@page import="java.net.URL, javax.servlet.http.HttpServlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
HttpSession session50=request.getSession();
String did=(String)session50.getAttribute("did");

System.out.println("tu pan ghe."+did);
String pid=(String)session50.getAttribute("Pid");
System.out.println("tu pan ghe."+pid);

String treatment=(String)session50.getAttribute("treatment");
System.out.println("tu pan ghe in upload"+treatment);


String saveFile="";
String contentType = request.getContentType();
String id=request.getParameter("id");
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}

String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
 String web="C:\\Users\\MR.GON\\Ortho\\complete_ortho2\\WebContent\\images\\";
//String path=getServletContext().getRealPath("images\\");
//URL path2 =getServletContext().getResource("images//");
//String path=getServletContext().getRealPath("/images");
//System.out.println(path+"......");
 File ff = new File(web+saveFile); 
 System.out.println(ff);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/ortho1";
PreparedStatement psmnt = null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "root");
 psmnt = connection.prepareStatement("insert into fileupload values(?,?,?,?)");
 psmnt.setString(1, did);
 psmnt.setString(2, pid);
 psmnt.setString(3, treatment);
 psmnt.setString(4, saveFile);


int s = psmnt.executeUpdate();
if(s>0){
System.out.println("Uploaded successfully !");
out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
out.println("<script>");
out.println("$(document).ready(function() {");
out.println("swal('Good job!', 'Image Successfully Uploaded', 'success');");
out.println("});");
//out.println("window.location.href='patientProfile.jsp?patient_id='+pid1;");
out.println("</script>");


System.out.println("Uploaded!");
/* RequestDispatcher rd = request.getRequestDispatcher("images.jsp?Pid="+pid);
rd.include(request, response);  */
response.sendRedirect("images.jsp?Pid="+pid+"&treatment="+treatment);
}
else{
System.out.println("Error!");
}
}
catch(Exception e){
    e.printStackTrace();
}
}
%>
</body>
</html>