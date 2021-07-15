package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.List;

import javax.persistence.ManyToOne;

import model.AlunoEstudoCaso;
import model.Cipe;
import model.DiagnosticoAluno;
import model.EstudoCaso;
import model.PontoChaveAluno;
import model.Usuario;
import dao.AlunoEstudoCasoDAO;
import dao.DiagnosticoAlunoDAO;


public class DiagnosticoAlunoNegocios {

	private static DiagnosticoAlunoNegocios instancia;
	public static DiagnosticoAlunoNegocios getInstancia(){
		if(DiagnosticoAlunoNegocios.instancia == null){
			DiagnosticoAlunoNegocios.instancia = new DiagnosticoAlunoNegocios();
		}
		return DiagnosticoAlunoNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private DiagnosticoAlunoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public void editarDiagnosticoAluno(DiagnosticoAluno diag){

		try {

			DiagnosticoAlunoDAO daoRespostaDiagnostico = fabrica.getDiagnosticoAlunoDAO();

			DiagnosticoAluno diagnosticoAluno = daoRespostaDiagnostico.getPorId(diag.getId());
			diagnosticoAluno.setCipe(diag.getCipe());
			diagnosticoAluno.setPontochavealuno(diag.getPontochavealuno());
			diagnosticoAluno.setDescricao(diag.getDescricao());
			
			daoRespostaDiagnostico.persistir(diagnosticoAluno);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	public boolean excluirDiagnosticoAluno(DiagnosticoAluno resposta){
		boolean retorno = false;

		try{

			DiagnosticoAlunoDAO dao = (DiagnosticoAlunoDAO) fabrica.getDiagnosticoAlunoDAO();

			resposta = dao.getPorId(resposta.getId());
			
			dao.remover(resposta);
			
			retorno = true;

		}catch(Exception e){
			e.printStackTrace();
		}

		return retorno;
	}

	public List<DiagnosticoAluno> listarDiagnosticoAlunoEstudoCaso(AlunoEstudoCaso aec){

		List<DiagnosticoAluno> retorno = null;
		try {

			DiagnosticoAlunoDAO daoRespostaDiagnostico = fabrica.getDiagnosticoAlunoDAO();
			
			retorno = daoRespostaDiagnostico.listarDiagnosticoPorAlunoEstudoCaso(aec);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return retorno;
	}
	
	public List<DiagnosticoAluno> listarDiagnosticoUsuarioEstudoCaso(Usuario u, EstudoCaso ec){

		List<DiagnosticoAluno> retorno = null;
		AlunoEstudoCaso aec = null;
		try {

			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();
			
			aec = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);

			DiagnosticoAlunoDAO daoRespostaDiagnostico = fabrica.getDiagnosticoAlunoDAO();
			
			retorno = daoRespostaDiagnostico.listarDiagnosticoPorAlunoEstudoCaso(aec);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return retorno;
	}

	public void salvarDiagnosticoAluno(Cipe resposta, PontoChaveAluno problema, String descricao, Usuario u, EstudoCaso ec){

		AlunoEstudoCaso aec = null;
		try {

			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();
			
			aec = daoAlunoEstudoCaso.getAlunoEstudoCaso(u, ec);

			DiagnosticoAlunoDAO daoRespostaDiagnostico = fabrica.getDiagnosticoAlunoDAO();

			DiagnosticoAluno diagnosticoAluno = new DiagnosticoAluno();
			diagnosticoAluno.setAlunoestudocaso(aec);
			diagnosticoAluno.setCipe(resposta);
			diagnosticoAluno.setPontochavealuno(problema);
			diagnosticoAluno.setDescricao(descricao);
			
			daoRespostaDiagnostico.persistir(diagnosticoAluno);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void salvarDiagnosticoAluno(DiagnosticoAluno diagnostico){

		try {

			DiagnosticoAlunoDAO daoRespostaDiagnostico = fabrica.getDiagnosticoAlunoDAO();
			
			DiagnosticoAluno instancia = daoRespostaDiagnostico.getPorId(diagnostico.getId());
			
			if(instancia == null){
				
				daoRespostaDiagnostico.persistir(diagnostico);
				
			}else{
				
				daoRespostaDiagnostico.merge(diagnostico);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
