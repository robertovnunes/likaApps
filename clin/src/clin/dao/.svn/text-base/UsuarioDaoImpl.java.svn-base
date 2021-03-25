package clin.dao;



import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import clin.model.Usuario;

public class UsuarioDaoImpl extends DaoGenerico<Usuario, Integer> {
    public UsuarioDaoImpl() {
        super(Usuario.class);
    }
    
    
    public Usuario autenticarUsuario(Usuario ex){
    	Criteria c = this.criarCriteria();
    	c.add(Restrictions.ilike("login", ex.getLogin(),MatchMode.EXACT));
    	c.add(Restrictions.ilike("senha", ex.getSenha(),MatchMode.EXACT));
    	c.setMaxResults(1);
    	Usuario usr = (Usuario) c.uniqueResult();
    	return usr;
    }


}
