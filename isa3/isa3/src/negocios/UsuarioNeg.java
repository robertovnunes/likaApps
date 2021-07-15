package negocios;

import dados.FabricaDAO;
import dados.basicas.AdministradorDAO;
import dados.basicas.AlunoDAO;
import dados.basicas.ProfessorDAO;
import dados.basicas.UsuarioDAO;
import dados.hibernate.FabricaHibernateDAO;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;

public class UsuarioNeg extends GenericNeg<Usuario>{

	private static UsuarioNeg instancia;
	private FabricaDAO fabrica;
	
	private UsuarioNeg() {
		super(Usuario.class);
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
		retorno = this.getAluno(login);
		if(retorno == null){
			retorno = this.getProfessor(login);
			if(retorno == null){
				retorno = this.getAdministrador(login);
				if(retorno != null){
					((Administrador) retorno).setTipoUsuario(TipoUsuario.ADMINISTRADOR);
				}
			}else{
				((Professor) retorno).setTipoUsuario(TipoUsuario.PROFESSOR);
			}
		}else{
				((Aluno) retorno).setTipoUsuario(TipoUsuario.ALUNO);
		}
		return retorno;
	}
	
	//Método usado apenas para alteração da senha!!
	public void saveOrUpdateUsuario(Usuario usuario){
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		dao.persistir(usuario);
	}
	
	/**Métodos Privados*/
	private Professor getProfessor(String login){
		ProfessorDAO dao = fabrica.getProfessorDAO();
		Professor prof = dao.getProfessorPorLogin(login);
		return prof;
	}
	private Aluno getAluno(String login){
		AlunoDAO dao = fabrica.getAlunoDAO();
		Aluno aluno = dao.getAlunoPorLogin(login);
		return aluno;
	}
	private Administrador getAdministrador(String login){
		AdministradorDAO dao = fabrica.getAdministradorDAO();
		Administrador enfermeiro = dao.getAdministradorPorLogin(login);
		return enfermeiro;
	}
	
}
