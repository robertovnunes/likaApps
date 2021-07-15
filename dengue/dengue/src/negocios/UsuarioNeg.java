package negocios;

import java.util.List;

import model.usuario.TipoUsuario;
import model.usuario.Usuario;
import dados.FabricaDAO;
import dados.basicas.UsuarioDAO;
import dados.hibernate.FabricaHibernateDAO;

public class UsuarioNeg {

	private static UsuarioNeg instancia;
	private FabricaDAO fabrica;
	
	private UsuarioNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}
	
	public static UsuarioNeg getInstancia(){
		if(UsuarioNeg.instancia == null){
			UsuarioNeg.instancia = new UsuarioNeg();
		}
		return UsuarioNeg.instancia;
	}
	
	public Object getUsuario(String login){
		Object retorno = null;
		
			retorno = this.getPorConsulta("login", login);
			if(retorno != null){
				List<Usuario> listUser = (List<Usuario>) retorno;
				Usuario retornoUser = listUser.get(0);
				retorno = retornoUser;
				((Usuario) retorno).setTipoUsuario(TipoUsuario.INVESTIGADOR);
			}
		
		
		return retorno;
	}
	
	public List<Usuario> getTodos(){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		return dao.getTodos();
	}
	public List<Usuario> getPorConsulta(String tipo, String valor){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		return dao.getUsuariosPorConsulta(tipo, valor);
	}
	
	public Usuario getPorId(int id){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		return dao.getPorId(id, true);
	}
	
	//Método usado apenas para alteração da senha!!
	public void saveOrUpdateUsuario(Usuario usuario){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		dao.persistir(usuario);
	}
	
	public Usuario insertUsuario(Usuario usuario){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		Usuario retorno = dao.persistir(usuario);
		return retorno;
	}
	
	
	
}
