package forum.app.dao.util;

import java.security.Security;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	public static void envoiMail(String adresseMail, String login, String mdp) throws Exception {
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("polyforum69@gmail.com", "pforum69");
					}
				});
		session.setDebug(true);
		Transport transport = session.getTransport();
		InternetAddress addressFrom = new InternetAddress("polyforum69@gmail.com");
		MimeMessage message = new MimeMessage(session);
		message.setSender(addressFrom);

		
			message.setSubject("Confirmation de votre inscription à PolyForum");
			message.setContent("Bonjour, \n\nVoici vos identifiants pour vous connecter à PolyForum:\n\nLogin:"+ login +"\nMot de passe:" + mdp + "\n\nCordialement,\nL'équipe PolyForum", "text/plain");
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(adresseMail));
			
			transport.connect();
			transport.send(message);
			transport.close();
		}
	
}