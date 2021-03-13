import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import mail.PsendMail;

@WebServlet("/patient_registration")
public class patient_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public patient_registration() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session=request.getSession();
		//String Name=request.getParameter("Name");
		String Pid = request.getParameter("pid");
		//request.getAttribute("did");
		String did=(String)session.getAttribute("did");
		System.out.println(did+"didididididd");
		//String pid = request.getParameter("pid");
		String pname=request.getParameter("Patient Name");
		String age=request.getParameter("Age");
		String gender=request.getParameter("gender");
		String bgroup=request.getParameter("Bloodgroup");
		String pmobile=request.getParameter("Patient Mobile");
		String email=request.getParameter("E-mail");
		String address=request.getParameter("address");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("register!");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1?useSSL=false","root","root");
			System.out.println("connected!");
			
			PreparedStatement ps=con.prepareStatement("Insert into patient values(?,?,?,?,?,?,?,?,?)");
			System.out.println("Query!");
			
			ps.setString(1,Pid);
			System.out.println(Pid);
			ps.setString(2,did);
			System.out.println(did);
			ps.setString(3,pname);
			System.out.println(pname);
			ps.setString(4,age);
			System.out.println(age);
			ps.setString(5,gender);
			System.out.println(gender);
			ps.setString(6,bgroup);
			System.out.println(bgroup);
			ps.setString(7,pmobile);
			System.out.println(pmobile);
			ps.setString(8,email);
			System.out.println(email);
			ps.setString(9,address);
			System.out.println(address);

			int i=ps.executeUpdate();
			if(i>0)
			{
				/*out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function() {");
				out.println("swal('Good Job!', 'Registered Successfully!', 'success');");
				//out.println("window.location.href='login.html'");
				out.println("});");*/
				PsendMail p=new PsendMail();
				p.send("bookbazarr@gmail.com", "amar4029", "bookbazarr@gmail.com", email, "You are Register Succesfully In Book Bazaar", "welcome In Book Bazaar Thank you for register.");
				out.println("Email Send Succesfully...");
				
				System.out.println("Registered!");
				RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
				rd.include(request, response);
				//JOptionPane.showMessageDialog(null, "Your Are Successfully Registered!");
				/*sendmail m =new sendmail();
				m.send("nakkashriniwas1@gmail.com", "actionpop",email_id, " Your Are Registered successfully With TrainGO! ", "nakkashriniwas1@gmail.com");*/
			}
		ps.close();
		con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
