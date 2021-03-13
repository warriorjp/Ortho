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

@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public admin_login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
			
		
	
			String username = request.getParameter("username");
			System.out.println(username);
/*			HttpSession s1=request.getSession();
			s1.setAttribute("Name", Email);*/
	        String password = request.getParameter("password");
	        
	        
	        try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	System.out.println("driver loaded");
	            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1?useSSL=false","root","root");
	            System.out.println("Connection est.");
	            
	            
	            PreparedStatement ps =con.prepareStatement("select * from admin where username = ? and password = ?");

				ps.setString(1, username);
				ps.setString(2, password);
	            ResultSet rs=ps.executeQuery(); 
	          
	            
	            if(rs.next())
	            {
	            	/*rs.getString(7);
	            	System.out.println(rs.getString(7));
	            	HttpSession session2=request.getSession();
	            	session2.setAttribute("did", rs.getString(1));*/
	          response.sendRedirect("admin/home.jsp");
	            /*	RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
					rd.include(request, response);*/
	            	
	            	return;
	            }
	            else
	            {	
	            	RequestDispatcher rd = request.getRequestDispatcher("admin/index.jsp");
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
