package negocios;

import java.util.List;

import dados.basicas.ArcoMaguerezDAO;
import dados.basicas.AvaliacaoDAO;
import dados.basicas.AvaliacaoProfessorDAO;
import dados.basicas.ImplementacaoDAO;
import dados.basicas.MatriculaCursoAlunoDAO;
import dados.basicas.PlanejamentoDAO;
import dados.basicas.ResultadosEsperadosDAO;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.curso.matricula.AvaliacaoProfessor;
import model.curso.matricula.MatriculaCursoAluno;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;
import model.curso.matricula.arcomaguerez.Avaliacao;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.curso.matricula.arcomaguerez.Planejamento;
import model.curso.matricula.arcomaguerez.ResultadosEsperados;

public class ArcoMaguerezEstudoDeCasoNeg extends GenericNeg<ArcoMaguerezEstudoDeCaso>{

	private static ArcoMaguerezEstudoDeCasoNeg instancia;
	
	private ArcoMaguerezEstudoDeCasoNeg() {
		super(ArcoMaguerezEstudoDeCaso.class);
	}
	
	public static ArcoMaguerezEstudoDeCasoNeg getInstancia(){
		if(ArcoMaguerezEstudoDeCasoNeg.instancia == null){
			ArcoMaguerezEstudoDeCasoNeg.instancia = new ArcoMaguerezEstudoDeCasoNeg();
		}
		return ArcoMaguerezEstudoDeCasoNeg.instancia;
	}
	
	public ArcoMaguerezEstudoDeCaso getArcoMaguerezPorMatriculaCursoEstudoCaso(
			MatriculaCursoAluno matricula, EstudoDeCaso estudo){
		ArcoMaguerezDAO dao = fabrica.getArcoMaguerezDAO();
		return dao.getArcoMaguerezPorMatriculaCursoEstudoCaso(matricula, estudo);
	}
	
	public List<ArcoMaguerezEstudoDeCaso> buscarArcosMaguerezPorCursoEAluno(MatriculaCursoAluno matricula,Curso curso) {
		ArcoMaguerezDAO dao = fabrica.getArcoMaguerezDAO();
		return dao.buscarArcosMaguerezPorCursoEAluno(matricula, curso);
	}
	
	public List<ArcoMaguerezEstudoDeCaso> getTodasArcoMaguerezEstudoDeCasoPorCurso(Curso curso) {
		MatriculaCursoAlunoDAO dao = fabrica.getMatriculaCursoAlunoDAO();
		return dao.getTodasArcoMaguerezEstudoDeCasoPorCurso(curso);
	}

	public ArcoMaguerezEstudoDeCaso inserirArcoMaguerez(ArcoMaguerezEstudoDeCaso arcoMaguerez){
		ArcoMaguerezDAO daoArco = fabrica.getArcoMaguerezDAO();
		PlanejamentoDAO daoPts = fabrica.getPlanejamentoDAO();
		ImplementacaoDAO daoImplementacao = fabrica.getImplementacaoDAO();
		ResultadosEsperadosDAO daoResultadosEsperados = fabrica.getHipotesesDeSolucaoDAO();
		AvaliacaoDAO daoApp = fabrica.getAplicacaoDAO();
		AvaliacaoProfessorDAO daoAvaProf = fabrica.getAvaliacaoProfessorDAO();
		
		AvaliacaoProfessor avaliacaoPlanejamento = new AvaliacaoProfessor("","");
		daoAvaProf.persistir(avaliacaoPlanejamento);
		arcoMaguerez.getPlanejamento().setAvaliacaoProfessor(avaliacaoPlanejamento);
		
		AvaliacaoProfessor avaliacaoImplementacao = new AvaliacaoProfessor("","");
		daoAvaProf.persistir(avaliacaoImplementacao);
		arcoMaguerez.getImplementacao().setAvaliacaoProfessor(avaliacaoImplementacao);
		
		AvaliacaoProfessor avaliacaoResultados = new AvaliacaoProfessor("","");
		daoAvaProf.persistir(avaliacaoResultados);
		arcoMaguerez.getResultadosEsperados().setAvaliacaoProfessor(avaliacaoResultados);
		
		Planejamento planejamento = daoPts.persistir(arcoMaguerez.getPlanejamento());
		Implementacao implementacao = daoImplementacao.persistir(arcoMaguerez.getImplementacao());
		ResultadosEsperados resultadosEsperados = daoResultadosEsperados.persistir(arcoMaguerez.getResultadosEsperados());
		Avaliacao avaliacao = daoApp.persistir(arcoMaguerez.getAvaliacao());
		
		arcoMaguerez.setPlanejamento(planejamento);
		arcoMaguerez.setImplementacao(implementacao);
		arcoMaguerez.setResultadosEsperados(resultadosEsperados);
		arcoMaguerez.setAvaliacao(avaliacao);
		
		return daoArco.persistir(arcoMaguerez);
	}
}
