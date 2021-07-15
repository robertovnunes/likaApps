 package br.com.lika.hpv.dao;
 
 import br.com.lika.hpv.model.usuario.Usuario;
 import java.util.List;
 import org.hibernate.Criteria;
 import org.hibernate.Query;
 import org.hibernate.Session;
 import org.hibernate.criterion.Restrictions;
 
 public class UsuarioDAO extends DAO<Usuario>
 {
   public UsuarioDAO(Session session)
   {
     super(session, Usuario.class);
   }
   public Usuario existeUnico(Usuario u) {
     return (Usuario)this.session.createCriteria(this.classe).add(Restrictions.and(Restrictions.eq("login", u.getLogin()), Restrictions.eq("senha", u.getSenha()))).uniqueResult();
   }
 
   public Usuario procurarUsuarioPorLogin(String login) {
     return (Usuario)getSession().createCriteria(this.classe).add(Restrictions.eq("login", login)).uniqueResult();
   }
 
   public List<Usuario> procurarUsuariosPorNome(String nome) {
     return getSession().createCriteria(this.classe).add(Restrictions.ilike("nome", nome)).list();
   }
 
   public List<Usuario> procurarUsuariosPorEmail(String email) {
     return getSession().createCriteria(this.classe).add(Restrictions.ilike("email", email)).list();
   }
 
   public List<Usuario> procurarUsuariosPorLogin(String login)
   {
     return getSession().createCriteria(this.classe).add(Restrictions.ilike("login", login)).list();
   }
 
   public void atualizarMeusDados(Usuario u) {
     String hql = "update usuario set email = :novoemail, login = :novologin, nome = :novonome, senha = :novosenha where id = :usuarioid";
     Query query = this.session.createQuery(hql);
     query.setString("novoemail", String.valueOf(u.getEmail()));
     query.setString("novologin", String.valueOf(u.getLogin()));
     query.setString("novonome", String.valueOf(u.getNome()));
     query.setString("novosenha", String.valueOf(u.getSenha()));
     query.setLong("usuarioid", Long.valueOf(u.getId().longValue()).longValue());
 
     int rowCount = query.executeUpdate();
   }
   public Usuario existeEmail(Usuario u) {
     String hql = "select u from usuario as u where u.email = :email";
     Query query = getSession().createQuery(hql);
     query.setParameter("email", u.getEmail());
     return (Usuario)query.uniqueResult();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.dao.UsuarioDAO
 * JD-Core Version:    0.6.0
 */