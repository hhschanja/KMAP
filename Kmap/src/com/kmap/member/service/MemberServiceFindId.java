package com.kmap.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmap.action.Action;
import com.kmap.action.ActionForward;
import com.kmap.email.AuthNum;
import com.kmap.email.SMTPAuthenticator;
import com.kmap.member.MemberDAO;
import com.kmap.member.MemberDTO;

public class MemberServiceFindId implements Action {

	@Override
	public ActionForward process(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		AuthNum authNum = new AuthNum();
		
		int result = 0;
		String authNumCheck = null;
		try {
			mdto.setName(request.getParameter("name"));
			mdto.setEmail_id(request.getParameter("email_id"));
			mdto.setEmail_site(request.getParameter("email_site"));
			
			result = mdao.findId(mdto);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(result>0){
			System.out.println("1번쨰");
			try {
				mdto = mdao.idView(mdto);
				
				System.out.println("here:"+mdto.getEmail_id());
				
				String mail_from = "hhschanja@gmail.com";
				String mail_to = mdto.getEmail_id()+"@"+mdto.getEmail_site();
				String title = "대동여酒도 인증번호 전달";
				String contents = "인증번호 ["+authNum.RandomNum()+"]";
				authNumCheck = contents.substring(contents.indexOf("[")+1, contents.lastIndexOf("]"));
				mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
				mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
				
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.socketFactory.port", "465" );
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.auth", "true");
				
				Authenticator auth = new SMTPAuthenticator();
				Session sess = Session.getDefaultInstance(props, auth);
				
				MimeMessage msg = new MimeMessage(sess);
				
				msg.setFrom(new InternetAddress(mail_from));
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mail_to));
				msg.setSubject(title, "UTF-8");
				msg.setContent(contents, "text/html; charset=UTF-8");
				msg.setHeader("Content-type", "text/html; charset=UTF-8");
				
				Transport.send(msg);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("dto", mdto);
			request.setAttribute("authNum", authNumCheck);
			actionForward.setPath("email_comfirm.jsp");
		}else {
			request.setAttribute("message", "일치하는 정보가 없습니다.");
			request.setAttribute("path", "../member/login.jsp");
			actionForward.setPath("../common/result.jsp");
		}
		actionForward.setCheck(true);
		
		
		return actionForward;
	}

}
