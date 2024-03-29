package logic;


import interceptor.DaoInterceptor;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.Usuario;

import org.vraptor.annotations.Component;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.interceptor.MultipartRequestInterceptor;

import dao.DaoFactory;


@Component("esqueceusenha")
@InterceptedBy({DaoInterceptor.class, MultipartRequestInterceptor.class})
public class EsqueceuSenhaLogic {
	
	private Usuario usuario;
	
	private DaoFactory factory;
	
	public EsqueceuSenhaLogic(DaoFactory daoFactory){
		this.factory = daoFactory;
	}
	
	public void recupera(Usuario usuario) throws MessagingException, UnsupportedEncodingException{
		String login = usuario.getLogin();
		
		Usuario usuarioRecuperado = factory.getDaoUsuario().recuperarUsuarioPorLogin(login);
		
		String nomeRecuperado = usuarioRecuperado.getNome();
		String emailRecuperado = usuarioRecuperado.getEmail();
		String senhaRecuperada = usuarioRecuperado.getSenha();
		
		
		
		/*Enviando e-mail*/
		
		 Properties props = System.getProperties();
		  props.put("mail.smtp.host", "smtp.gmail.com");
		  props.put("mail.smtp.port", "25");
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable","true"); 
		  Authenticator auth = new Authenticator() {
		    public PasswordAuthentication getPasswordAuthentication() {
		      return new PasswordAuthentication("contato.cenas.lika@gmail.com", "rosaliebelian");
		    }};

		  Session session = Session.getInstance(props, auth);
		  MimeMessage message = new MimeMessage(session);
		  message.setFrom(new InternetAddress("contato.cenas.lika@gmail.com", "Sistema Cenas"));
		  message.addRecipient(Message.RecipientType.TO,
		    new InternetAddress(emailRecuperado, nomeRecuperado));
		  message.setSubject("Recuperacao de Senha");
		  message.setContent("Usu�rio: " + nomeRecuperado + "\nLogin: " + login + "\nSenha: "  + senhaRecuperada, "text/plain");

		  Transport.send(message);
		
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}
	

}