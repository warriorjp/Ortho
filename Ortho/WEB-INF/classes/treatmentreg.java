import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet("/treatmentreg")
public class treatmentreg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public treatmentreg() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
/*		String pid1 = request.getParameter("Patient_Id");
		String patient_name = request.getParameter("Patient_Name");*/
		HttpSession ht1 = request.getSession();
		String did = (String)ht1.getAttribute("did");
		String Pid = (String)ht1.getAttribute("pid");
		String Pname = (String)ht1.getAttribute("pname");
		System.out.println(Pname);
		String startdate = request.getParameter("startdate");
//		String diagnosis=request.getParameter("diagnosis");
		String treatment=request.getParameter("treatment");
//		String medicine=request.getParameter("medicine");
//		String progress=request.getParameter("progress");
//		String nextdate=request.getParameter("nextdate");
		String totalfees=request.getParameter("totalfees");
/*		String noi=request.getParameter("noi");
		String pa=request.getParameter("pa");
		String ra=request.getParameter("ra");*/
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("register!");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1?allowPublicKeyRetrieval=true","root","root");
			System.out.println("connected!");
			
			PreparedStatement ps=con.prepareStatement("Insert into treatment values(?,?,?,?,?,?)");
			System.out.println("Query!");
			
			ps.setString(1,did);
			System.out.println(did);
			ps.setString(2,Pid);
			System.out.println(Pid);
			ps.setString(3,Pname);
			System.out.println(Pname);
			ps.setString(4,startdate);
			System.out.println(startdate);
			ps.setString(5,treatment);
			System.out.println(treatment);
			/*ps.setString(5,diagnosis);
			System.out.println(diagnosis);

			ps.setString(7,medicine);
			System.out.println(medicine);
			ps.setString(8,progress);
			System.out.println(progress);
			ps.setString(9,nextdate);
			System.out.println(nextdate);*/
			ps.setString(6,totalfees);
			System.out.println(totalfees);
			/*ps.setString(11,noi);
			System.out.println(noi);
			ps.setString(12,pa);
			System.out.println(pa);
			ps.setString(13,ra);
			System.out.println(ra);*/
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function() {");
				out.println("swal('Good job!', 'Record Stored Successfully!', 'success');");
				out.println("});");
				//out.println("window.location.href='patientProfile.jsp?patient_id='+pid1;");
				out.println("</script>");
				
				//window.location.href='';
				
				//JOptionPane.showMessageDialog(null, " Record Stored Successfully! ");
				RequestDispatcher rd = request.getRequestDispatcher("patientProfile.jsp?Pid="+Pid);
				rd.include(request, response);
				//response.sendRedirect("patientProfile.jsp");
				
				/*out.println("<script>");
				out.println("alert('Updated Successfully')");
				out.println("window.location.href='patientProfile.jsp?patient_id='pid1''");
				out.println("</script>");
				System.out.println("PID:"+pid1);*/
				
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

}
