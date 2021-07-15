package br.com.lika.hpv.logic;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.vraptor.annotations.Component;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.annotations.Out;
import org.vraptor.scope.ScopeType;

import br.com.lika.hpv.dao.DAOFactory;
import br.com.lika.hpv.dao.UsuarioDAO;
import br.com.lika.hpv.interceptor.DAOInterceptor;
import br.com.lika.hpv.model.usuario.Usuario;

@Component("login")
@InterceptedBy({DAOInterceptor.class})
public class LoginLogic
{

	@Out(scope=ScopeType.SESSION)
	private Usuario usuarioDaSessao;
	private final DAOFactory daoFactory;

	public LoginLogic(DAOFactory daoFactory)
	{
		this.daoFactory = daoFactory;
	}

	public void index() {
		this.usuarioDaSessao = null;
	}

	public String efetuarLogin(Usuario usuario) {

		String retorno = "invalid";
		if (usuario != null) {
			if ((usuario.getLogin().equals("")) || (usuario.getSenha().equals(""))){ 
				retorno = "invalid";
			}
			this.usuarioDaSessao = this.daoFactory.getUsuarioDAO().existeUnico(usuario);
			if ((this.usuarioDaSessao != null) && (this.usuarioDaSessao.getId() != null)){ 
				retorno = "logado";
			
			}
			
			
		}

		return retorno;
	}
	public String lembrarSenha(Usuario usuario) {
		UsuarioDAO dao = this.daoFactory.getUsuarioDAO();
		Usuario emailUsuario = dao.existeEmail(usuario);
		
		
		
		if (emailUsuario == null)
			return "invalid";
		Properties p = new Properties();

		p.put("mail.host", "infomed.lika.ufpe.br");
		Session session = Session.getInstance(p, null);
		MimeMessage msg = new MimeMessage(session);
		try
		{
			msg.setFrom(new InternetAddress("thiago@hpvweb.lika"));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(emailUsuario.getEmail()));
			msg.setSentDate(new Date());
			msg.setSubject("Lembrete de senha - HPVWEB");
			msg.setText("Sua senha de login no HPVWEB: " + emailUsuario.getSenha());
			Transport.send(msg);
		} catch (AddressException localAddressException) {
		} catch (MessagingException localMessagingException) {
		}
		
		return "ok";
	}

//	public void logout() {
//		this.usuarioDaSessao = null;
//	}
//	
	public void logout(){
		
		this.usuarioDaSessao = null;
		
	}

	public Usuario getUsuarioDaSessao() {
		return this.usuarioDaSessao;
	}

	public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
		this.usuarioDaSessao = usuarioDaSessao;
	}

	public DAOFactory getDaoFactory() {
		return this.daoFactory;
	}
}

