/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dados.hibernate.conteudo;

import java.util.List;

import model.Livro;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dados.basicas.LivroDao;
import dados.hibernate.HibernateUtil;

/**
 *
 * @author José Alexandre
 */
public class LivroHibernateDAO implements LivroDao {

    public void save(Livro livro) {
        Session session = HibernateUtil.getFabricaDeSessao().openSession();
        Transaction t = session.beginTransaction();
        session.save(livro);
        t.commit();
    }
    public Livro getLivro(long id) {
        Session session = HibernateUtil.getFabricaDeSessao().openSession();
        return (Livro) session.load(Livro.class, id);
    }
    public List<Livro> list() {
        Session session = HibernateUtil.getFabricaDeSessao().openSession();
        Transaction t = session.beginTransaction();
        List lista = session.createQuery("from Livro").list();
        t.commit();
        return lista;
    }
    public void remove(Livro livro) {
        Session session = HibernateUtil.getFabricaDeSessao().openSession();
        Transaction t = session.beginTransaction();
        session.delete(livro);
        t.commit();
    }
    public void update(Livro livro) {
        Session session = HibernateUtil.getFabricaDeSessao().openSession();
        Transaction t = session.beginTransaction();
        session.update(livro);
        t.commit();
    }
}
