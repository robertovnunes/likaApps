package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.ManyToOne;

import model.Arquivo;
import model.Curso;
import model.DiagnosticoProfessor;
import model.EstudoCaso;
import model.Usuario;
import dao.ArquivoDAO;
import dao.DiagnosticoProfessorDAO;
import dao.EstudocasoDAO;


public class EstudoCasoNegocios {

	private static EstudoCasoNegocios instancia;
	public static EstudoCasoNegocios getInstancia(){
		if(EstudoCasoNegocios.instancia == null){
			EstudoCasoNegocios.instancia = new EstudoCasoNegocios();
		}
		return EstudoCasoNegocios.instancia;
	}

	@ManyToOne
	private FabricaDAO fabrica;

	private EstudoCasoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public void excluirEstudoCaso(EstudoCaso estudo){

		try{
			
			EstudocasoDAO estudocasoDAO = fabrica.getEstudocasoDAO();
			
			estudocasoDAO.remover(estudo);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void excluirEstudosCasoPorCurso(int cursoId){

		EstudoCaso estudoExcluir = new EstudoCaso();

		EstudocasoDAO dao = fabrica.getEstudocasoDAO();

		try{
			estudoExcluir = dao.getPorId(cursoId); 

			dao.remover(estudoExcluir);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public List<EstudoCaso> listarEstudoCasoPorUsuariuCurso(Usuario u, Curso c) {

		List<EstudoCaso> retorno = null;

		EstudocasoDAO dao = fabrica.getEstudocasoDAO();

		retorno = dao.getEstudoPorUsuarioCurso(u, c);

		return retorno;
	}

	public void mudarHabilitar(EstudoCaso estudo){
		EstudocasoDAO dao = fabrica.getEstudocasoDAO();

		estudo.setHabilitado(!estudo.getHabilitado());

		dao.persistir(estudo);
	}

	public void salvarEstudoCaso(EstudoCaso estudo, Arquivo arquivo) {

		EstudocasoDAO estudocasoDAO = fabrica.getEstudocasoDAO();
		EstudoCaso instancia = null;
		if(estudo.getId() > 0){
			instancia = estudocasoDAO.getPorId(estudo.getId());
		}
		
		if(instancia == null){
			if(estudo.getDataCriacao() == null){
				estudo.setDataCriacao(new Date());
			}

			Set<DiagnosticoProfessor> diagnosticos = estudo.getDiagnosticoprofessors();

			estudo.setDiagnosticoprofessors(null);
			
			estudo.setHabilitado(false);

			estudocasoDAO.persistir(estudo);

			DiagnosticoProfessorDAO diagnosticoProfessorDAO = fabrica.getDiagnosticoProfessorDAO();

			for (Iterator<DiagnosticoProfessor> iterator = diagnosticos.iterator(); iterator.hasNext();) {
				DiagnosticoProfessor diagnosticoProfessor = (DiagnosticoProfessor) iterator
						.next();

				diagnosticoProfessor.setEstudocaso(estudo);

				diagnosticoProfessorDAO.persistir(diagnosticoProfessor);

			}

			ArquivoDAO arquivoDAO = fabrica.getArquivoDAO();

			arquivo.setId_EntidadeMae(estudo.getId());
			arquivoDAO.persistir(arquivo);
			
		}else{
			estudocasoDAO.merge(estudo);
		}
	}

}
