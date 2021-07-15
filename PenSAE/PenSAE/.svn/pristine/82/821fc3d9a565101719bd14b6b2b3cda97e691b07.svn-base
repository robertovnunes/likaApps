package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import model.AlunoEstudoCaso;
import model.Curso;
import model.EstudoCaso;
import model.Professor;
import model.Usuario;
import dao.AlunoEstudoCasoDAO;
import define.Define;


public class AlunoEstudoCasoNegocios {

	static AlunoEstudoCasoNegocios instancia;

	public static AlunoEstudoCasoNegocios getInstancia(){

		if(AlunoEstudoCasoNegocios.instancia == null){

			AlunoEstudoCasoNegocios.instancia = new AlunoEstudoCasoNegocios();

		}

		return AlunoEstudoCasoNegocios.instancia;
	}

	private FabricaDAO fabrica;

	private AlunoEstudoCasoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();

	}

	public AlunoEstudoCaso getAlunoEstudoCasoPorUsuarioEstudoCaso(Usuario u, EstudoCaso ec){

		AlunoEstudoCaso retorno = null;

		try {
			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

			retorno = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);

			if(retorno == null){
				retorno = new AlunoEstudoCaso();
				retorno.setAluno(u.getAlunos().iterator().next());
				retorno.setFaseAtual(Define.FASE_ARCO_OBSERVACAO);
				retorno.setEstudocaso(ec);

				daoAlunoEstudoCaso.persistir(retorno);

				retorno = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}


		return retorno;
	}

	public boolean getTodosTerminaramFasePontosChave(int idEstudoCaso) {

		AlunoEstudoCasoDAO estudocasoDAO = fabrica.getAlunoEstudoCasoDAO();

		return estudocasoDAO.getTodosTerminaramFasePontosChave(idEstudoCaso);
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCaso(Usuario u) {

		List<AlunoEstudoCaso> retorno = null;

		try {
			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

			retorno = daoAlunoEstudoCaso.listarAlunoEstudoCasos(u);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorEstudoCaso(EstudoCaso ec) {
		List<AlunoEstudoCaso> retorno = null;
		try{
			AlunoEstudoCasoDAO estudoCasoDAO = fabrica.getAlunoEstudoCasoDAO();

			retorno = estudoCasoDAO.listarAlunoEstudoCasoPorEstudoCaso(ec);
		} catch(Exception e){
			e.printStackTrace();
		}
		return retorno;
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorProfessor(Professor p) {
		List<AlunoEstudoCaso> retorno = null;

		AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();
		retorno = daoAlunoEstudoCaso.listarAlunoEstudoCasoPorProfessor(p);

		return retorno;
	}

	public List<AlunoEstudoCaso> listarAlunoEstudoCasoPorUsuarioCurso(Usuario usuarioLogado, Curso curso) {
		List<AlunoEstudoCaso> retorno = null;

		try {
			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

			retorno = daoAlunoEstudoCaso.listarAlunoEstudoCasosPorUsuarioCurso(usuarioLogado,curso);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retorno;

	}

	public AlunoEstudoCaso salvarAlunoEstudoCaso(AlunoEstudoCaso aec) {
		try {
			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

			daoAlunoEstudoCaso.persistir(aec);
			aec = daoAlunoEstudoCaso.getPorId(aec.getId());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return aec;
	}

}
