 package br.com.lika.hpv.dao;
 
 import java.util.List;
 import org.hibernate.Criteria;
 import org.hibernate.Session;
 
 public class DAO<T>
 {
   protected Session session;
   protected final Class classe;
 
   public DAO(Session session, Class classe)
   {
     this.session = session;
     this.classe = classe;
   }
 
   public void adiciona(T u) {
     this.session.saveOrUpdate(u);
   }
 
   public void remover(T u) {
     this.session.delete(u);
   }
 
   public void remover(Long codigo) {
     this.session.delete(procura(codigo));
   }
 
   public void atualiza(T u) {
     this.session.saveOrUpdate(u);
   }
 
   public void somenteAtualizar(T u) {
     this.session.update(u);
   }
 
   public List<T> listaTudo()
   {
     return this.session.createCriteria(this.classe).list();
   }
 
   public T procura(Long id)
   {
     return (T) this.session.load(this.classe, id);
   }
   
   public T find(Long id)
   {
	   return (T) this.session.get(this.classe, id);
   }
   
   public void rebind(T u) {
     this.session.refresh(u);
   }
 
   protected Session getSession() {
     return this.session;
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.DAO
 * JD-Core Version:    0.6.0
 */