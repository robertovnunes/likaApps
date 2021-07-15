 package br.com.lika.hpv.util;
 
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.util.Collection;
 
 public class TagLibrary
 {
   public static boolean contains(Collection options, Object option)
   {
     boolean retorno = option == null ? false : options == null ? false : options.contains(option);
     return retorno;
   }
   public static boolean equalsIgnoreCase(String a, String b) {
     return a.equalsIgnoreCase(b);
   }
   public static boolean acessoViral(Object o) {
     if (o == null) return false;
     Character priv1 = ((Usuario)o).getAcessoViralClamidia();
     Character priv2 = ((Usuario)o).getAcessoViralHbv();
     Character priv3 = ((Usuario)o).getAcessoViralHcv();
     Character priv4 = ((Usuario)o).getAcessoViralHiv();
     Character priv5 = ((Usuario)o).getAcessoViralHpv();
     Character priv6 = ((Usuario)o).getAcessoViralSifilis();
     boolean retorno = 
       ((priv1 != null) && (priv1.charValue() == 'Y')) || 
       ((priv2 != null) && (priv2.charValue() == 'Y')) || 
       ((priv3 != null) && (priv3.charValue() == 'Y')) || 
       ((priv4 != null) && (priv4.charValue() == 'Y')) || 
       ((priv5 != null) && (priv5.charValue() == 'Y')) || (
       (priv6 != null) && (priv6.charValue() == 'Y'));
     return retorno;
   }
   public static boolean acessoCitopato(Object o) {
     if (o == null) return false;
     Character priv = ((Usuario)o).getAcessoCitopato();
     return (priv != null) && (priv.charValue() == 'Y');
   }
   public static boolean acessoAnexo(Object o) {
     if (o == null) return false;
     Character priv = ((Usuario)o).getAcessoAnexos();
     return (priv != null) && (priv.charValue() == 'Y');
   }
   public static boolean acessoAmostra(Object o) {
     if (o == null) return false;
     Character priv = ((Usuario)o).getAcessoAmostras();
     return (priv != null) && (priv.charValue() == 'Y');
   }
   public static boolean acessoUsuario(Object o) {
     if (o == null) return false;
     Character priv = ((Usuario)o).getAcessoAdministrador();
     return (priv != null) && (priv.charValue() == 'Y');
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.TagLibrary
 * JD-Core Version:    0.6.0
 */