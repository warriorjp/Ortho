package mail;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PsendMail {


public  void send(final String Name,final String Password,String user,String Email,String sub,String msg)
	{ 

	Properties props = new Properties();


	props.put("mail.smtp.host", "smtp.gmail.com");

	props.put("mail.smtp.port", "587");		
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");

	System.out.println("hiiiiii");

	Session session = Session.getInstance(props,new javax.mail.Authenticator()
	{
	protected PasswordAuthentication getPasswordAuthentication() 
	{
	return new PasswordAuthentication(Name,Password);
	}
	});

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ortho1","root", "actionpop");
		PreparedStatement pt=con.prepareStatement("select * from patient where Email=?");
		pt.setString(1,Email);
	System.out.println(Email);


	MimeMessage message = new MimeMessage(session);
	message.setFrom(new InternetAddress(user));
	message.addRecipient(Message.RecipientType.TO,new InternetAddress(Email));
	message.setSubject(sub);
	message.setText(msg);



	Transport.send(message);


	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
	}  
		 
	}


