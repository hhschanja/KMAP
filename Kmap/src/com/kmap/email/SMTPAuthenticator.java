package com.kmap.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	public SMTPAuthenticator() {
		super();
	}
	
	public PasswordAuthentication getPasswordAuthentication(){
		String userName = "hhschanja@gmail.com";
		String password = "HyungSeon369!";
		
		return new PasswordAuthentication(userName, password);
		
	}
}
