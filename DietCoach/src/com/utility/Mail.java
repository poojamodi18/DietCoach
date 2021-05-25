package com.utility;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	static Properties properties = new Properties();
	static {
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
	}

	public static void sendMail(String email,String messagemail,String subject) {
		String returnStatement = null;
		try {
			Authenticator auth = new Authenticator() {
				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dietcoach2020@gmail.com", "Diet2020coach");
				}
			};
			Session session = Session.getInstance(properties, auth);
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("dietcoach2020@gmail.com"));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSentDate(new Date());
			message.setSubject(subject);
			message.setText(messagemail);
			returnStatement = "The e-mail was sent successfully";
		//	System.out.println(returnStatement);
			Transport.send(message);
		} catch (Exception e) {
			returnStatement = "error in sending mail";
			e.printStackTrace();
		}
	}
}
