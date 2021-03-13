import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Statement;

@WebServlet("/doc_login")
public class doc_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public doc_login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
			
		
	
			String Email = request.getParameter("Email");
			System.out.println(Email);
			HttpSession s1=request.getSession();
			s1.setAttribute("Name", Email);
	        String Password1 = request.getParameter("Password");
	        
	        
	        try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	System.out.println("driver loaded");
	            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1","root","root");
	            System.out.println("Connection est.");
	            /*?useSSL=false*/
	            
	            PreparedStatement ps =con.prepareStatement("select * from docregistration where Email = ? and Password = ?");

				ps.setString(1, Email);
				ps.setString(2, Password1);
	            ResultSet rs=ps.executeQuery(); 
	          
	            
	            if(rs.next())
	            {
	            	
	            	rs.getString(7);
	            	System.out.println(rs.getString(7));
	            	HttpSession session2=request.getSession();
	            	session2.setAttribute("did", rs.getString(1));
	            	String did=rs.getString(1);
	            	PreparedStatement ps3= con.prepareStatement("select * from status where did=?");
	            	ps3.setString(1,did);
	            	ResultSet rs3=ps3.executeQuery();
	            	if(rs3.next())
	            	{
	            		int status=rs3.getInt("status");
	            		System.out.println(status);
	            		
	            		if(status==0){
	            			/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	    					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	    					out.println("<script>");
	    					out.println("$(document2).ready(function2() {");
	    					out.println("swal('Error!', 'Account is not Approved Please Contact Admin!', 'fail');");
	    					//out.println("window.location.href='login.html'");
	    					out.println("});");*/
	            			response.sendRedirect("doc_login_fail.jsp");
	            			/*JOptionPane.showMessageDialog(null, "Account is not Approved Please Contact Admin!");*/
	            			/*RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	    					rd.include(request, response);*/
	            		}
	            		else if(status==1){
	            			/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	    					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	    					out.println("<script>");
	    					out.println("$(document3).ready(function3() {");
	    					out.println("swal('Welcome!', 'Your Successfully Login!', 'success');");
	    					//out.println("window.location.href='login.html'");
	    					out.println("});");*/
	            			/*JOptionPane.showMessageDialog(null, "Login Successfull");*/
	            			/*RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
	    					rd.include(request, response);*/
	            			response.sendRedirect("doc_login_success.jsp");
	            		}
	            	}

	            	/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function() {");
					out.println("swal('Welcome!', 'Your Successfully Login!', 'success');");
					//out.println("window.location.href='login.html'");
					out.println("});");*/
	            
	            	
	            	
	            	return;
	            }
	            else
	            {	
	            	/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function() {");
					out.println("swal('Failed!', 'Invalid Username And Password!', 'error');");
					//out.println("window.location.href='login.html'");
					out.println("});");*/
	            	
	            	//JOptionPane.showMessageDialog(null, "Invalid Username and Password!");
	            	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
		            return;
	            }
	        
	        }
	        catch(Exception e)
	        {
	        	System.out.println(e);
	        }
	}

}
