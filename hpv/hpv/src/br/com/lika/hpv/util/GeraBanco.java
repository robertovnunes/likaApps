 package br.com.lika.hpv.util;
 
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.io.PrintStream;
 import org.hibernate.cfg.AnnotationConfiguration;
 import org.hibernate.cfg.Configuration;
 import org.hibernate.tool.hbm2ddl.SchemaExport;
 
 public class GeraBanco
 {
   public static void main(String[] args)
   {
     Configuration confI = new AnnotationConfiguration();
     confI.configure();
     SchemaExport se = new SchemaExport(confI);
 
     se.create(true, false);
 /*    System.out.println("banco gerado com sucesso");
 
     Usuario u = new Usuario();
     u.setLogin("admin");
     u.setSenha("admin");
     u.setNome("Thiago Carvalho");
     u.setEmail("tjcps@cin.ufpe.br");
     u.setAcessoAdministrador(Character.valueOf('Y'));
 
     Configuration conf = new AnnotationConfiguration();
     conf.configure();
     conf.buildSessionFactory();
 
     DAOFactory fact = new DAOFactory();
 
     fact.beginTransaction();
 
     fact.commit();
     fact.close();*/
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.GeraBanco
 * JD-Core Version:    0.6.0
 */