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
import javax.swing.JOptionPane;

import mail.SendMail;

@WebServlet("/doctor_registration")
public class doctor_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public doctor_registration() {
        super();
   }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		
		String Name=request.getParameter("Name");
		String clinic=request.getParameter("clinic");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String specialization=request.getParameter("specialization");
		String E_mail=request.getParameter("E-mail");
		String contact=request.getParameter("contact");
		String Password=request.getParameter("Password");
		String con_pass=request.getParameter("conform password");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("register!");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1","root","root");
			System.out.println("connected!");
			
			
			
			PreparedStatement ps=con.prepareStatement("Insert into docregistration values(?,?,?,?,?,?,?,?,?,?)");
			System.out.println("Query!");
			
			
			ps.setString(1,id);
			System.out.println(id);
			ps.setString(2,Name);
			System.out.println(Name);
			ps.setString(3,clinic);
			System.out.println(clinic);
			ps.setString(4,dob);
			System.out.println(dob);
			ps.setString(5,gender);
			System.out.println(gender);
			ps.setString(6,specialization);
			System.out.println(specialization);
			ps.setString(7,E_mail);
			System.out.println(E_mail);
			ps.setString(8,contact);
			System.out.println(contact);
			ps.setString(9,Password);
			System.out.println(Password);
			ps.setString(10,con_pass);
			System.out.println(con_pass);
			
			
			
			/*Statement stmt =(Statement) con.createStatement();
			stmt.executeUpdate("insert into docregistration values ("+Name+",'"+clinic+"','"+dob+"','"+gender+"','"+specialization+"','"+E_mail+"','"+contact+"','"+Password+"','"+con_pass+"')");
			*/
			int i=ps.executeUpdate();
			
			if(Password.equals(con_pass))
			{	
				/*String didon=null;
				PreparedStatement ps3=con.prepareStatement("select did from docregistration where Email="+E_mail);
				ResultSet rs3=ps3.executeQuery();
				if(rs3.next()){
					didon=rs3.getString(1);
				}*/
				int status = 0;
				PreparedStatement ps2= con.prepareStatement("insert into status values(?,?)");
				ps2.setString(1, E_mail);
				ps2.setInt(2, status);
				
				int j=ps2.executeUpdate();

				if(j>0){
					System.out.println("record inserted....");
				}
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function() {");
				out.println("swal('Good job!', 'Your Are Successfully Registerd!', 'success');");
				out.println("});");
				//out.println("window.location.href='patientProfile.jsp?patient_id='+pid1;");
				out.println("</script>");
				
				//JOptionPane.showMessageDialog(null, "Your Are Successfully Registered!");
				SendMail mail=new SendMail();
				mail.send("bookbazarr@gmail.com", "amar4029", "bookbazarr@gmail.com", E_mail, "You are Register Succesfully In Book Bazaar", "welcome In Book Bazaar Thank you for register.");
				out.println("Email Send Succesfully...");
				System.out.println("Rigistered!");
				RequestDispatcher rd = request.getRequestDispatcher("index.html");
				rd.include(request, response);
				/*sendmail m =new sendmail();
				m.send("nakkashriniwas1@gmail.com", "actionpop",email_id, " Your Are Registered successfully With TrainGO! ", "nakkashriniwas1@gmail.com");*/
			}
			/*JOptionPane.showMessageDialog(null, "Password Doesn't Match!");
			System.out.println("Rigistered!");*/
			else
			{	
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function() {");
				out.println("swal('Try Again!', 'Registration Failed!', 'error');");
				//out.println("window.location.href='login.html'");
				out.println("});");
				
				JOptionPane.showMessageDialog(null, "Password Doesn't Match!");
				//alert("Your password and confirmation password do not match.");
				System.out.println("Wrong Password!");
				RequestDispatcher rd = request.getRequestDispatcher("signup.html");
				rd.include(request, response);
			}
		ps.close();
		//con.close();
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
