package com.algoo.app.email;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	private static final Logger logger
		= LoggerFactory.getLogger(EmailSender.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver
				, String sender) throws MessagingException{
		logger.info("메일 발송 메서드 호출");
		
		MimeMessage message = mailSender.createMimeMessage();
		message.setSubject(subject);
		message.setText(content);
		message.setRecipient(RecipientType.TO,
				new InternetAddress(receiver)); // => 받는 사람
		message.setFrom(new InternetAddress(sender)); // => 보내는 사람
		
		mailSender.send(message); // 메일 발송
	}
}
