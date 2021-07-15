 package br.com.lika.hpv.interceptor;
 
 import br.com.lika.hpv.util.ClientInput;
 import br.com.lika.hpv.util.ClientOutput;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import org.vraptor.Interceptor;
 import org.vraptor.LogicException;
 import org.vraptor.LogicFlow;
 import org.vraptor.annotations.Out;
 import org.vraptor.view.ViewException;
 
 public class PdfLaudoInterceptor
   implements Interceptor
 {
   private HttpServletResponse response;
   private HttpServletRequest request;
   private ClientOutput clientOutput;
   private ClientInput clientInput;
 
   public PdfLaudoInterceptor(HttpServletResponse response, HttpServletRequest request)
   {
     this.response = response;
     this.request = request;
   }
 
   public void intercept(LogicFlow flow) throws LogicException, ViewException
   {
     this.clientOutput = new ClientOutput(this.response);
     this.clientInput = new ClientInput(this.request);
     flow.execute();
   }
   @Out(key="br.com.lika.hpv.util.ClientOutput")
   public ClientOutput getClientOutput() {
     return this.clientOutput;
   }
   @Out(key="br.com.lika.hpv.util.ClientInput")
   public ClientInput getClientInput() {
     return this.clientInput;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.interceptor.PdfLaudoInterceptor
 * JD-Core Version:    0.6.0
 */