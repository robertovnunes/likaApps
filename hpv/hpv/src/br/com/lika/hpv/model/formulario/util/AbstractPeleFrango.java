 package br.com.lika.hpv.model.formulario.util;
 
 import java.util.ArrayList;
 import java.util.List;
 
 public abstract class AbstractPeleFrango
 {
   public static final String SEMPRE = "Sempre retira a pele antes de comer";
   public static final String MAIORIA = "Na maioria das vezes retira";
   public static final String ALGUMAS = "Algumas vezes retira";
   public static final String QUASE_NUNCA = "Quase nunca retira";
   public static final String NUNCA = "Nunca retira";
   public static final String NAO_COME_GORDURA = "Não come carne que tenha muita gordura";
   public static final String NS_NR = "NS/NR";
 
   public static List<String> getListaOpcoesPeleFrango()
   {
     ArrayList retorno = new ArrayList();
     retorno.add("Sempre retira a pele antes de comer");
     retorno.add("Na maioria das vezes retira");
     retorno.add("Algumas vezes retira");
     retorno.add("Quase nunca retira");
     retorno.add("Nunca retira");
     retorno.add("Não come carne que tenha muita gordura");
     retorno.add("NS/NR");
     return retorno;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.formulario.util.AbstractPeleFrango
 * JD-Core Version:    0.6.0
 */