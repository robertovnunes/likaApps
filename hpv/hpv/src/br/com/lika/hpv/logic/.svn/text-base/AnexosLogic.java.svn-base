 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAO;
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.dao.FormularioDAO;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import br.com.lika.hpv.interceptor.DownloadInterceptor;
 import br.com.lika.hpv.interceptor.PerfilAnexosInterceptor;
 import br.com.lika.hpv.model.anexo.Anexo;
 import br.com.lika.hpv.model.formulario.Formulario;
 import br.com.lika.hpv.model.usuario.Usuario;
 import br.com.lika.hpv.util.ClientInput;
 import br.com.lika.hpv.util.ClientOutput;
 import java.io.File;
 import java.io.FileInputStream;
 import java.io.IOException;
 import java.io.InputStream;
 import java.util.Date;
 import java.util.List;
 import javax.servlet.ServletOutputStream;
 import javax.servlet.http.HttpServletResponse;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.In;
 import org.vraptor.annotations.InterceptedBy;
 import org.vraptor.annotations.Viewless;
 import org.vraptor.interceptor.MultipartRequestInterceptor;
 import org.vraptor.interceptor.UploadedFileInformation;
 import org.vraptor.plugin.hibernate.Validate;
 import org.vraptor.scope.ScopeType;
 import org.vraptor.validator.ValidationErrors;
 
 @Component("anexos")
 @InterceptedBy({MultipartRequestInterceptor.class, MultipartRequestInterceptor.class, DAOInterceptor.class, DownloadInterceptor.class, PerfilAnexosInterceptor.class})
 public class AnexosLogic
 {
 
   @In(scope=ScopeType.SESSION, required=true)
   protected Usuario usuarioDaSessao;
   protected final DAOFactory daoFactory;
   private ClientOutput clientOutput;
   private ClientInput clientInput;
 
   @In(required=false)
   private UploadedFileInformation fileInfo;
   private Formulario formulario;
   private Anexo anexo;
   private List<Anexo> anexos;
   private List<Formulario> formularios;
 
   public void index()
   {
     this.formularios = this.daoFactory.getFormularioDAO().listaTudo();
   }
 
   public AnexosLogic(DAOFactory factory, ClientOutput clientOutput, ClientInput clientInput) {
     this.daoFactory = factory;
     this.clientInput = clientInput;
     this.clientOutput = clientOutput;
   }
 
   public void formulario(Formulario formulario) {
     this.formulario = ((Formulario)this.daoFactory.getFormularioDAO().procura(formulario.getId()));
     this.anexos = this.formulario.getAnexos();
   }
 
   public void formulario2(Anexo anexo) {
     this.anexo = anexo;
   }
   @Validate(params={"anexo"})
   public void add(Anexo anexo) {
     this.daoFactory.beginTransaction();
 
     anexo.setData(new Date());
     this.daoFactory.getAnexoDAO().atualiza(anexo);
     this.daoFactory.commit();
   }
 
   public void validateAdd(ValidationErrors errors, Anexo anexo) {
     if (anexo.getData() == null) anexo.setData(new Date());
     if (this.fileInfo != null) {
       File uploadedFile = this.fileInfo.getFile();
       try
       {
         anexo.setAnexo(getBytesFromFile(uploadedFile));
         String tipo = this.fileInfo.getCompleteFileName();
         tipo = tipo.replaceAll(" ", "");
         anexo.setTipo(tipo);
       }
       catch (IOException localIOException)
       {
       }
     }
   }
 
   private byte[] getBytesFromFile(File file) throws IOException {
     InputStream is = new FileInputStream(file);
 
     long length = file.length();
 
     if (length > 2147483647L) {
       return null;
     }
 
     byte[] bytes = new byte[(int)length];
 
     int offset = 0;
     int numRead = 0;
     while ((offset < bytes.length) && ((numRead = is.read(bytes, offset, bytes.length - offset)) >= 0)) {
       offset += numRead;
     }
 
     if (offset < bytes.length) {
       throw new IOException("Could not completely read file " + 
         file.getName());
     }
 
     is.close();
     return bytes;
   }
 
   public void remove(Anexo anexo) {
     this.daoFactory.beginTransaction();
     this.daoFactory.getAnexoDAO().remover(anexo.getId());
     this.daoFactory.commit();
   }
 
   public void list() {
     this.anexos = this.daoFactory.getAnexoDAO().listaTudo();
   }
   @Viewless
   public void download(Anexo anexo) {
     anexo = (Anexo)this.daoFactory.getAnexoDAO().procura(anexo.getId());
 
     String tipo = anexo.getTipo();
     this.clientOutput.getResponse().setContentType("inline/download");
     String arq = "attachment;filename=" + tipo;
     this.clientOutput.getResponse().setHeader("Content-Disposition", arq);
     try
     {
       ServletOutputStream os = this.clientOutput.getResponse().getOutputStream();
       os.write(anexo.getAnexo());
       os.flush();
       os.close();
     }
     catch (IOException e) {
       e.printStackTrace();
     }
   }
 
   public Usuario getUsuarioDaSessao() {
     return this.usuarioDaSessao;
   }
 
   public void setUsuarioDaSessao(Usuario usuarioDaSessao) {
     this.usuarioDaSessao = usuarioDaSessao;
   }
 
   public Formulario getFormulario() {
     return this.formulario;
   }
 
   public void setFormulario(Formulario formulario) {
     this.formulario = formulario;
   }
 
   public Anexo getAnexo() {
     return this.anexo;
   }
 
   public void setAnexo(Anexo anexo) {
     this.anexo = anexo;
   }
 
   public List<Anexo> getAnexos() {
     return this.anexos;
   }
 
   public void setAnexos(List<Anexo> anexos) {
     this.anexos = anexos;
   }
 
   public DAOFactory getDaoFactory() {
     return this.daoFactory;
   }
 
   public ClientOutput getClientOutput() {
     return this.clientOutput;
   }
 
   public void setClientOutput(ClientOutput clientOutput) {
     this.clientOutput = clientOutput;
   }
 
   public ClientInput getClientInput() {
     return this.clientInput;
   }
 
   public void setClientInput(ClientInput clientInput) {
     this.clientInput = clientInput;
   }
 
   public UploadedFileInformation getFileInfo() {
     return this.fileInfo;
   }
 
   public void setFileInfo(UploadedFileInformation fileInfo) {
     this.fileInfo = fileInfo;
   }
 
   public List<Formulario> getFormularios() {
     return this.formularios;
   }
 
   public void setFormularios(List<Formulario> formularios) {
     this.formularios = formularios;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.AnexosLogic
 * JD-Core Version:    0.6.0
 */