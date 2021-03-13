
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
import javax.swing.JOptionPane;

@WebServlet("/appoinment")
public class appoinment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public appoinment() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String pname = request.getParameter("patient-name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String a_date=request.getParameter("appoinment-date");
		String message=request.getParameter("message");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("register!");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1","root","actionpop");
			System.out.println("connected!");
			
			PreparedStatement ps=con.prepareStatement("Insert into appoinment values(?,?,?,?,?,?)");
			System.out.println("Query!");
			
			ps.setString(1,pname);
			System.out.println(pname);
			ps.setString(2,phone);
			System.out.println(phone);
			ps.setString(3,email);
			System.out.println(email);
			ps.setString(4,dob);
			System.out.println(dob);
			ps.setString(5,a_date);
			System.out.println(a_date);
			ps.setString(6,message);
			System.out.println(message);

			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd = request.getRequestDispatcher("index.html");
				rd.include(request, response);
				JOptionPane.showMessageDialog(null, "Your Appoinment Is Scheduled!");
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
