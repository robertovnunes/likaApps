package negocios;

import java.util.List;

import model.usuario.Aluno;
import model.usuario.Enfermeiro;
import model.usuario.Professor;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;
import dados.FabricaDAO;
import dados.basicas.AlunoDAO;
import dados.basicas.EnfermeiroDAO;
import dados.basicas.ProfessorDAO;
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
		retorno = this.getAluno(login);
		if(retorno == null){
			retorno = this.getProfessor(login);
			if(retorno == null){
				retorno = this.getEnfermeiro(login);
				if(retorno != null){
					((Enfermeiro) retorno).setTipoUsuario(TipoUsuario.ENFERMEIRO);
				}
			}else{
				((Professor) retorno).setTipoUsuario(TipoUsuario.PROFESSOR);
			}
		}else{
			if(((Aluno) retorno).getTipo().equals(TipoUsuario.ALUNOLABORATORIO.toString())){
				((Aluno) retorno).setTipoUsuario(TipoUsuario.ALUNOLABORATORIO);
			}else{
				((Aluno) retorno).setTipoUsuario(TipoUsuario.ALUNOENFERMARIA);
			}
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
	private Enfermeiro getEnfermeiro(String login){
		EnfermeiroDAO dao = fabrica.getEnfermeiroDAO();
		Enfermeiro enfermeiro = dao.getEnfermeiroPorLogin(login);
		return enfermeiro;
	}
	
}
