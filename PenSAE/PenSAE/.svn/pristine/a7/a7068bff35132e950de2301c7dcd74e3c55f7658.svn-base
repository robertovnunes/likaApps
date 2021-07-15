package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import model.Arquivo;
import model.Curso;
import model.Professor;
import model.Usuario;
import dao.ArquivoDAO;
import dao.CursoDAO;
import define.Define;


public class CursoNegocios {
	private static CursoNegocios instancia;
	public static CursoNegocios getInstancia(){
		if(CursoNegocios.instancia == null){
			CursoNegocios.instancia = new CursoNegocios();
		}
		return CursoNegocios.instancia;
	}

	private FabricaDAO fabrica;

	private CursoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public String editarCurso(Curso curso, Professor professorLogado, Arquivo programacao){

		String retorno = "";
		String nome = "";
		String nomeAntigo = "";
		Curso cursoEditar = null;
		CursoDAO dao = fabrica.getCursoDAO();

		try{
			cursoEditar = dao.getPorId(curso.getId());
			nomeAntigo = dao.getNomeCursoPorId(curso.getId());
			nome = dao.getNomeCursoPorNome(curso.getNome());

			if(cursoEditar != null && (!nomeAntigo.equalsIgnoreCase(nome) || nome == null)){ 
				//	verifica se o curso existe no BD (possui um id)
				// e se a nome do curso nao foi editado para nome ja existente
				// a nao ser que ele seja editado pro praprio nome (manter o nome)

				cursoEditar.setNome(curso.getNome());
				cursoEditar.setObjetivo(curso.getObjetivo());
				cursoEditar.setEmenta(curso.getEmenta());
				cursoEditar.setDataInicio(curso.getDataInicio());
				cursoEditar.setDataFim(curso.getDataFim());
				
				dao.persistir(cursoEditar);
				
				if(programacao != null){
					
					ArquivoDAO arquivoDao = fabrica.getArquivoDAO();
					
					programacao.setId_EntidadeMae(cursoEditar.getId());
					
					arquivoDao.persistir(programacao);
					
				}
				
				retorno = Define.OUTCOME_CRIAR_CURSO_SUCESSO;
				
			}else{
				
				retorno = Define.OUTCOME_CRIAR_CURSO_INFO_FALHA;
			}

		}catch (Exception e){
			
			retorno = Define.OUTCOME_CRIAR_CURSO_BD_FALHA;
			e.printStackTrace();
		}

		return retorno;
	}

	public void excluirCurso(int id){

		Curso cursoExcluir = null;
		CursoDAO dao = fabrica.getCursoDAO();

		try{
			cursoExcluir = dao.getPorId(id);
			
			if(cursoExcluir != null){
				
				dao.remover(cursoExcluir);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public Arquivo getArquivoCurso(int idCurso, int tipoArquivo){
		
		Arquivo retorno = null;
		
		ArquivoDAO dao = fabrica.getArquivoDAO();
		
		try{
			
			retorno = dao.getArquivoPorIDMae(idCurso, tipoArquivo);
			
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return retorno;
	}

	public Curso getCursoPorId(int cursoId) {
		
		Curso retorno = null;
		
		CursoDAO dao = fabrica.getCursoDAO();
		
		retorno = dao.getPorId(cursoId);
		
		return retorno;
	}

	public String getProfessorResponsavel(int cursoId){
		
		String professor = "";
		
		CursoDAO dao = fabrica.getCursoDAO();
		
		try{
			
			professor = dao.getProfessorResponsavel(cursoId);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return professor;
	}

	public int getQuantidadeCasosPorCurso(int cursoId){
		int quantidadeCasos = 0;
		
		CursoDAO dao = fabrica.getCursoDAO();
		
		try{
			
			quantidadeCasos = (int) dao.getQuantidadeCasosPorCurso(cursoId);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return quantidadeCasos;
	} 
	
	public List<Curso> listarCursosNaoMatriculadosPorUsuario(Usuario u){
		List<Curso> retorno = null;
		
		CursoDAO dao = fabrica.getCursoDAO();
		try{
			retorno = dao.getCursosNaoMatriculadosPorUsuario(u);			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return retorno;
	}
	
	public List<Curso> listarCursosPorProfessor(Professor p){
		List<Curso> retorno = null;

		//Estou implementando isso
		CursoDAO dao = fabrica.getCursoDAO();
		try {

			retorno = dao.listarCursosPorProfessor(p);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;
	}
	
	public List<Curso> listarCursosPorUsuario(Usuario u){
		
		List<Curso> retorno = null;

		CursoDAO dao = fabrica.getCursoDAO();
		
		try {

			retorno = dao.getCursosPorUsuario(u);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;
	}
	
	public List<Curso> listarTodosCursos(){
		List<Curso> retorno = null;

		//Estou implementando isso
		CursoDAO dao = fabrica.getCursoDAO();
		try {

			retorno = dao.listarTodosCursos();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;
	}
	
	public String salvarCurso(Curso curso, Professor professorLogado, Arquivo programacao){

		String retorno = "";

		try{

			Curso instancia = new Curso();

			CursoDAO dao = fabrica.getCursoDAO();
			
			instancia = dao.getCursoPorNome(curso.getNome());

			if(instancia == null){


				instancia = curso;

				dao.persistir(instancia);
				
				Set<Professor> professores = new HashSet<Professor>();

				Set<Curso> cursos = professorLogado.getCursos();
				
				cursos.add(instancia);
				
				professorLogado.setCursos(cursos);
				
				professores.add(professorLogado);
				
				curso.setProfessors(professores);
				
				dao.merge(instancia);

				// fim do cadastro dos dados do curso

				if(programacao != null){

					ArquivoDAO arquivoDao = fabrica.getArquivoDAO();

					programacao.setId_EntidadeMae(instancia.getId());

					arquivoDao.persistir(programacao);
				}

				retorno = Define.OUTCOME_CRIAR_CURSO_SUCESSO;

			}else{

				retorno = Define.OUTCOME_CRIAR_CURSO_INFO_FALHA;
			}

		}catch(Exception ex){

			retorno = Define.OUTCOME_CRIAR_CURSO_BD_FALHA;
			ex.printStackTrace();
		}

		return retorno;
	}
}
