 package br.com.lika.hpv.util;
 
 import java.io.IOException;
 import javax.servlet.ServletOutputStream;
 import javax.servlet.http.HttpServletResponse;
 
 public class ClientOutput
 {
   private HttpServletResponse response;
 
   public ClientOutput(HttpServletResponse response)
   {
     this.response = response;
   }
 
   public ServletOutputStream getOutputStream() throws IOException {
     return this.response.getOutputStream();
   }
 
   public void setContentType(String type) {
     this.response.setContentType(type);
   }
 
   public HttpServletResponse getResponse() {
     return this.response;
   }
 
   public void setResponse(HttpServletResponse response) {
     this.response = response;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.ClientOutput
 * JD-Core Version:    0.6.0
 */