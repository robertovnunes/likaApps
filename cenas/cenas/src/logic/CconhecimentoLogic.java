/*     */ package logic;
/*     */ 
/*     */ import interceptor.DaoInterceptor;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import model.Aluno;
import model.Disciplina;
import model.MaterialGrafico;
import model.Periodo;
import model.Problema;
import model.Professor;
import model.Tutor;
import model.Usuario;

import org.vraptor.annotations.Component;
import org.vraptor.annotations.In;
import org.vraptor.annotations.InterceptedBy;
import org.vraptor.annotations.Out;
import org.vraptor.annotations.Viewless;
import org.vraptor.i18n.FixedMessage;
import org.vraptor.interceptor.MultipartRequestInterceptor;
import org.vraptor.interceptor.UploadedFileInformation;
import org.vraptor.plugin.hibernate.Validate;
import org.vraptor.scope.ScopeType;
import org.vraptor.validator.ValidationErrors;

import dao.DaoFactory;
/*     */ 
/*     */ @Component("cconhecimento")
/*     */ @InterceptedBy({DaoInterceptor.class, MultipartRequestInterceptor.class})
/*     */ public class CconhecimentoLogic
/*     */ {
/*     */   private final DaoFactory factory;
/*     */ 
/*     */   @Out(scope=ScopeType.SESSION)
/*     */   private Usuario usuario;
/*     */   private List<Problema> problemas;
/*     */   Aluno aluno;
/*     */   Disciplina disciplina;
/*     */   List<Disciplina> disciplinas;
/*     */ 
/*     */   @In(scope=ScopeType.SESSION, required=false)
/*     */   @Out(scope=ScopeType.SESSION)
/*     */   private Periodo periodo;
/*     */   private Problema problema;
/*     */ 
/*     */   @In(required=false)
/*     */   private UploadedFileInformation fileInfo;
/*     */ 
/*     */   @In
/*     */   private HttpServletResponse response;
/*     */ 
/*     */   public CconhecimentoLogic(DaoFactory factory)
/*     */   {
/*  77 */     this.factory = factory;
/*     */   }
/*     */ 
/*     */   public String login(Usuario usuario)
/*     */   {
/*  82 */     String retorno = "invalid";
/*  83 */     if ((usuario != null) && 
/*  84 */       (!usuario.getLogin().equals("")) && (!usuario.getSenha().equals(""))) {
/*  85 */       this.usuario = this.factory.getDaoUsuario().existeUnico(usuario);
/*     */ 
/*  87 */       if ((this.usuario instanceof Aluno))
/*  88 */         retorno = "aluno";
/*  89 */       else if ((this.usuario instanceof Professor))
/*  90 */         retorno = "professor";
/*  91 */       else if ((this.usuario instanceof Tutor))
/*  92 */         retorno = "tutor";
/*  93 */       else if ((this.usuario instanceof Usuario)) {
/*  94 */         retorno = "admin";
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/*  99 */     return retorno;
/*     */   }
/*     */ 
/*     */   public void acessoLivre() {
/* 103 */     this.problemas = this.factory.getDaoProblema().listaTudo();
/*     */   }
/*     */ 
/*     */   public void formularioCadastroAluno()
/*     */   {
/* 109 */     this.disciplinas = this.factory.getDaoDisciplina().listaTudo();
/* 110 */     setPeriodo(this.factory.getDaoPeriodo().carregar());
/*     */   }
/*     */   @Validate(params={"aluno"})
/*     */   public void cadastrarAluno(Aluno aluno) throws Exception, MessagingException {
/* 115 */     this.factory.beginTransaction();
/* 116 */     this.factory.getDaoAluno().adiciona(aluno);
/* 117 */     this.factory.commit();
/*     */ 
/* 123 */     String nomeAluno = aluno.getNome();
/* 124 */     String emailAluno = aluno.getEmail();
/* 125 */     String senhaAluno = aluno.getSenha();
/* 126 */     String loginAluno = aluno.getLogin();
/*     */ 
/* 128 */     Properties props = System.getProperties();
/* 129 */     props.put("mail.smtp.host", "smtp.gmail.com");
/* 130 */     props.put("mail.smtp.port", "25");
/* 131 */     props.put("mail.smtp.auth", "true");
/* 132 */     props.put("mail.smtp.starttls.enable", "true");
/* 133 */     Authenticator auth = new Authenticator() {
/*     */       public PasswordAuthentication getPasswordAuthentication() {
/* 135 */         return new PasswordAuthentication("contato.cenas.lika@gmail.com", "rosaliebelian");
/*     */       }
/*     */     };
/* 138 */     Session session = Session.getInstance(props, auth);
/* 139 */     MimeMessage message = new MimeMessage(session);
/* 140 */     message.setFrom(new InternetAddress("contato.cenas.lika@gmail.com", "Sistema Cenas"));
/* 141 */     message.addRecipient(Message.RecipientType.TO, 
/* 142 */       new InternetAddress(emailAluno, nomeAluno));
/* 143 */     message.setSubject("Cadastro de Usu??rio");
/* 144 */     message.setContent("Usu??rio: " + nomeAluno + "\nLogin: " + loginAluno + "\nSenha: " + senhaAluno, "text/plain");
/*     */ 
/* 146 */     Transport.send(message);
/*     */   }
/*     */ 
/*     */   public void validateCadastrarAluno(ValidationErrors erros, Aluno aluno)
/*     */   {
/* 151 */     this.aluno = aluno;
/*     */ 
/* 153 */     if (aluno != null) {
/* 154 */       if (aluno.getLogin() != null) {
/* 155 */         if (aluno.getId() == null) {
/* 156 */           if (this.factory.getDaoAluno().recuperarAlunoPorLogin(aluno.getLogin()) != null)
/* 157 */             erros.add(new FixedMessage("aluno.login", "J?? existe um aluno cadastrado com este Login.", "aluno"));
/*     */         }
/* 159 */         else if (this.factory.getDaoAluno().recuperarAlunoPorLogin(aluno.getLogin(), aluno.getId()) != null) {
/* 160 */           erros.add(new FixedMessage("aluno.login", "J?? existe um aluno cadastrado com este Login.", "aluno"));
/*     */         }
/*     */       }
/*     */ 
/* 164 */       if (aluno.getCPF() != null)
/* 165 */         if (aluno.getId() == null) {
/* 166 */           if (this.factory.getDaoAluno().recuperarAlunoPorCPF(aluno.getCPF()) != null) {
/* 167 */             erros.add(new FixedMessage("aluno.CPF", "J?? existe um aluno cadastrado com este CPF.", "aluno"));
/*     */           }
/*     */         }
/* 170 */         else if (this.factory.getDaoAluno().recuperarAlunoPorCPF(aluno.getCPF(), aluno.getId()) != null)
/* 171 */           erros.add(new FixedMessage("aluno.CPF", "J?? existe um aluno cadastrado com este CPF.", "aluno"));
/*     */     }
/*     */   }
/*     */ 
/*     */   public void relatorio(Problema problema)
/*     */   {
/* 179 */     this.problema = ((Problema)this.factory.getDaoProblema().procura(problema.getIdProblema()));
/*     */   }
/*     */ 
/*     */   @Viewless
/*     */   public void mostraImagem(MaterialGrafico materialGrafico) throws IOException
/*     */   {
/* 186 */     byte[] imagem = (byte[])null;
/*     */ 
/* 188 */     MaterialGrafico material = (MaterialGrafico)this.factory.getDaoMaterialGrafico().procura(materialGrafico.getIdMaterialGrafico());
/*     */ 
/* 191 */     imagem = material.getImagem();
/*     */ 
/* 193 */     this.response.setContentType("image/bmp");
/* 194 */     this.response.setHeader("Content-Disposition", "filename=xxx.jpg");
/* 195 */     this.response.setContentLength(imagem.length);
/* 196 */     ServletOutputStream ouputStream = this.response.getOutputStream();
/* 197 */     ouputStream.write(imagem, 0, imagem.length);
/* 198 */     ouputStream.flush();
/* 199 */     ouputStream.close();
/*     */   }
/*     */ 
/*     */   public void logout() {
/* 203 */     this.usuario = null;
/*     */   }
/*     */ 
/*     */   public Usuario getUsuario() {
/* 207 */     return this.usuario;
/*     */   }
/*     */ 
/*     */   public DaoFactory getFactory() {
/* 211 */     return this.factory;
/*     */   }
/*     */ 
/*     */   public void setUsuario(Usuario usuario) {
/* 215 */     this.usuario = usuario;
/*     */   }
/*     */ 
/*     */   public List<Problema> getProblemas() {
/* 219 */     return this.problemas;
/*     */   }
/*     */ 
/*     */   public void setProblemas(List<Problema> problemas) {
/* 223 */     this.problemas = problemas;
/*     */   }
/*     */ 
/*     */   public Problema getProblema() {
/* 227 */     return this.problema;
/*     */   }
/*     */ 
/*     */   public void setProblema(Problema problema) {
/* 231 */     this.problema = problema;
/*     */   }
/*     */ 
/*     */   public UploadedFileInformation getFileInfo() {
/* 235 */     return this.fileInfo;
/*     */   }
/*     */ 
/*     */   public void setFileInfo(UploadedFileInformation fileInfo) {
/* 239 */     this.fileInfo = fileInfo;
/*     */   }
/*     */ 
/*     */   public HttpServletResponse getResponse() {
/* 243 */     return this.response;
/*     */   }
/*     */ 
/*     */   public void setResponse(HttpServletResponse response) {
/* 247 */     this.response = response;
/*     */   }
/*     */ 
/*     */   static byte[] getBytesFromFile(File file) throws IOException {
/* 251 */     InputStream is = new FileInputStream(file);
/*     */ 
/* 253 */     long length = file.length();
/*     */ 
/* 260 */     if (length > 2147483647L) {
/* 261 */       return null;
/*     */     }
/*     */ 
/* 265 */     byte[] bytes = new byte[(int)length];
/*     */ 
/* 268 */     int offset = 0;
/* 269 */     int numRead = 0;
/* 270 */     while ((offset < bytes.length) && ((numRead = is.read(bytes, offset, bytes.length - offset)) >= 0)) {
/* 271 */       offset += numRead;
/*     */     }
/*     */ 
/* 275 */     if (offset < bytes.length) {
/* 276 */       throw new IOException("Could not completely read file " + 
/* 277 */         file.getName());
/*     */     }
/*     */ 
/* 280 */     is.close();
/* 281 */     return bytes;
/*     */   }
/*     */ 
/*     */   public void setPeriodo(Periodo periodo) {
/* 285 */     this.periodo = periodo;
/*     */   }
/*     */ 
/*     */   public Periodo getPeriodo() {
/* 289 */     return this.periodo;
/*     */   }
/*     */ 
/*     */   public Aluno getAluno() {
/* 293 */     return this.aluno;
/*     */   }
/*     */ 
/*     */   public void setAluno(Aluno aluno) {
/* 297 */     this.aluno = aluno;
/*     */   }
/*     */ 
/*     */   public Disciplina getDisciplina() {
/* 301 */     return this.disciplina;
/*     */   }
/*     */ 
/*     */   public void setDisciplina(Disciplina disciplina) {
/* 305 */     this.disciplina = disciplina;
/*     */   }
/*     */ 
/*     */   public List<Disciplina> getDisciplinas() {
/* 309 */     return this.disciplinas;
/*     */   }
/*     */ 
/*     */   public void setDisciplinas(List<Disciplina> disciplinas) {
/* 313 */     this.disciplinas = disciplinas;
/*     */   }
/*     */ }

/* Location:           C:\workspaces\workspace-lika\Cenas4\ImportedClasses\
 * Qualified Name:     logic.CconhecimentoLogic
 * JD-Core Version:    0.6.0
 */