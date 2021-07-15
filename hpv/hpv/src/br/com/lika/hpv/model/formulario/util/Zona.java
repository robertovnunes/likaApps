 package br.com.lika.hpv.model.formulario.util;
 
 import java.util.ArrayList;
 import java.util.List;
 
 public abstract class Zona
 {
   public static final String URBANA = "Urbana";
   public static final String RURAL = "Rural";
 
   public static List<String> getListaZonas()
   {
     ArrayList retorno = new ArrayList();
     retorno.add("Urbana");
     retorno.add("Rural");
     return retorno;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.Zona
 * JD-Core Version:    0.6.0
 */