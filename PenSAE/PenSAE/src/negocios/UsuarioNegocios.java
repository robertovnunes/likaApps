package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.ManyToOne;

import model.Aluno;
import model.Curso;
import model.Professor;
import model.Usuario;
import model.UsuarioHasIdioma;
import dao.AlunoDAO;
import dao.ProfessorDAO;
import dao.UsuarioDAO;
import dao.UsuarioHasIdiomaDAO;
import define.Define;
/**
 * @author Jesus
 *
 */

public class UsuarioNegocios {

	private static UsuarioNegocios instancia;
	public static UsuarioNegocios getInstancia(){
		if(UsuarioNegocios.instancia == null){
			UsuarioNegocios.instancia = new UsuarioNegocios();
		}
		return UsuarioNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private UsuarioNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public List<UsuarioHasIdioma> getPessoaHasIdiomaPorUsuario(int idUsuario){

		List<UsuarioHasIdioma> retorno = null;

		UsuarioHasIdiomaDAO phiDao = fabrica.getUsuarioHasIdiomaDAO();

		retorno = phiDao.getPessoaHasIdiomasPorUsuario(idUsuario);

		return retorno;		

	}

	public void inicializacaoBanco(){

		//Essa linha serve só para inicializar a conexão com o banco de dados
		@SuppressWarnings("unused")
		UsuarioDAO dao = fabrica.getUsuarioDAO();
	}

	public Usuario logon(String login, String senha) throws Exception{

		Usuario retorno = null;
		try{
			UsuarioDAO dao = fabrica.getUsuarioDAO();

			Usuario usuario = dao.getUsuarioPorLogin(login);
			if(usuario != null &&
					usuario.getSenha().equals(senha)){
				retorno = usuario;
			}
		}catch(Exception e){
			throw(e);
		}
		return retorno;
	}

	public String salvarUsuario(Usuario usuario, List<Curso> cursos){

		String retorno = "";
		Usuario instancia = new Usuario();

		try{
			UsuarioDAO dao = fabrica.getUsuarioDAO();

			instancia = dao.getUsuarioPorLogin(usuario.getLogin());

			if(instancia == null)
			{

				usuario.setDataCadastro(new Date());

				instancia = usuario;

				instancia.setCadastroLiberado(false);

				dao.persistir(instancia);

				if(instancia.getPerfil() == Define.PERFIL_PROFESSOR){

					Professor professor = new Professor();

					Set<Professor> professores = new HashSet<Professor>();

					professores.add(professor);

					instancia.setProfessors(professores);

					professor.setUsuario(instancia);

					ProfessorDAO daoProfessor = fabrica.getProfessorDAO();

					daoProfessor.persistir(professor);

				}else{

					Aluno aluno = new Aluno();

					Set<Aluno> alunos = new HashSet<Aluno>();

					alunos.add(aluno);

					instancia.setAlunos(alunos);

					aluno.setUsuario(instancia);
					
					AlunoDAO alunoDAO = fabrica.getAlunoDAO();

					alunoDAO.persistir(aluno);

					Set<Curso> conjunto = new HashSet<Curso>();

					for (Iterator<Curso> iterator = cursos.iterator(); iterator
							.hasNext();) {
						Curso curso = (Curso) iterator.next();
						Set<Aluno> alunosCurso = curso.getAlunos();
						alunosCurso.add(aluno);
						curso.setAlunos(alunosCurso);

						conjunto.add(curso);
					}

					aluno.setCursos(conjunto);

					alunoDAO.merge(aluno);
				}

				retorno = Define.OUTCOME_CADASTRO_SUCESSO;



			}else{

				retorno = Define.OUTCOME_CADASTRO_INFO_FALHA;
			}

		}catch(Exception ex){

			ex.printStackTrace();

			retorno = Define.OUTCOME_CADASTRO_BD_FALHA;
		}
		return retorno;
	}

	public boolean verificarSeLoginJaExiste(String login){

		boolean retorno = false;

		UsuarioDAO dao = fabrica.getUsuarioDAO();

		Usuario Usuario = dao.getUsuarioPorLogin(login);

		retorno = (Usuario == null);

		return retorno;
	}

}
