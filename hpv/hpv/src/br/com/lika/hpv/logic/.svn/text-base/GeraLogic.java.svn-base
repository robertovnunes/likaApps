 package br.com.lika.hpv.logic;
 
 import br.com.lika.hpv.dao.DAOFactory;
 import br.com.lika.hpv.interceptor.DAOInterceptor;
 import org.hibernate.cfg.AnnotationConfiguration;
 import org.hibernate.cfg.Configuration;
 import org.hibernate.tool.hbm2ddl.SchemaExport;
 import org.vraptor.annotations.Component;
 import org.vraptor.annotations.InterceptedBy;
 
 @Component("gera")
 @InterceptedBy({DAOInterceptor.class})
 public class GeraLogic
 {
   private final DAOFactory daoFactory;
 
   public GeraLogic(DAOFactory dao)
   {
     this.daoFactory = dao;
   }
 
   public void geraBanco_autoDatabaseGenerationMethodHPV_LIKA() {
     Configuration confI = new AnnotationConfiguration();
     confI.configure();
     SchemaExport se = new SchemaExport(confI);
     se.drop(true, true);
     se.create(true, true);
   }
 
   public DAOFactory getDaoFactory()
   {
     return this.daoFactory;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.GeraLogic
 * JD-Core Version:    0.6.0
 */