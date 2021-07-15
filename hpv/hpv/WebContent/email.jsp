<%@ page import="java.util.Properties"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page errorPage="error.jsp" %>

<%
  //Endereço de SMTP para enviar o email
  String smtpServer   = "150.161.67.2";

  String toMail       = "thiagojose.cin@gmail.com";
  String toName       = "Thiago";

  String fromMail     = "thiago@infomed.lika.ufpe.br";
  String fromName     = "Thiago";

  String subject      = "Mensagem com arquivo anexo";
  String body         = "Esta mensagem contém um arquivo anexo.";
  //String fileToSend   = "c:\\\\command.com";

  try {

    Properties props = new Properties();
    props.setProperty("mail.transport.protocol","smtp");
    props.setProperty("mail.host",smtpServer);
    props.setProperty("mail.user",fromMail);
    props.setProperty("mail.password","");

    Session mailSession = Session.getDefaultInstance(props, null);

    Message msg = new MimeMessage(mailSession);
    msg.setFrom( new InternetAddress(fromMail,fromName) );
    msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail,toName) );
    msg.setSubject( subject );

    // Adiciona o texto do corpo do email
    MimeBodyPart textPart = new MimeBodyPart();
    textPart.setContent(body,"text/plain");

    // Abre e anexa o arquivo
    //MimeBodyPart attachFilePart = new MimeBodyPart();
    //FileDataSource fds = new FileDataSource(fileToSend);
    //attachFilePart.setDataHandler(new DataHandler(fds));
    //attachFilePart.setFileName(fds.getName());

    // Monta a mensagem SMTP
    Multipart mp = new MimeMultipart();
    mp.addBodyPart(textPart);
    //mp.addBodyPart(attachFilePart);
    msg.setContent(mp);

    Transport.send(msg);

    out.println("Email enviado...");

    } catch (Exception e) {
      e.printStackTrace();
      out.println("Email nao enviado...");
  }
%>
