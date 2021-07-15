package genericos;
import genericos.implementacao.FabricaJPADAO;
import dao.AlunoDAO;
import dao.AlunoEstudoCasoDAO;
import dao.AmbulatorioDAO;
import dao.ArquivoDAO;
import dao.AvaliacaoDAO;
import dao.CipeDAO;
import dao.CompetenciaHabilidadeEspecificaDAO;
import dao.CompetenciaHabilidadeGeralDAO;
import dao.CursoDAO;
import dao.DescritorDAO;
import dao.DiagnosticoAlunoDAO;
import dao.DiagnosticoProfessorDAO;
import dao.EstudocasoDAO;
import dao.FeedbackDAO;
import dao.GlossarioDAO;
import dao.IdiomaDAO;
import dao.IntervencaoAlunoDAO;
import dao.IntervencaoProfessorDAO;
import dao.MetaAlunoDAO;
import dao.MetaProfessorDAO;
import dao.PontoChaveAlunoDAO;
import dao.PontoChaveProfessorDAO;
import dao.ProfessorDAO;
import dao.UsuarioDAO;
import dao.UsuarioHasIdiomaDAO;

/**
 * @author Jesus
 *
 */
public abstract class FabricaDAO {
	
	public static AlunoDAO alunoDAO;

	public static AlunoEstudoCasoDAO alunoEstudoCasoDAO;
	public static AmbulatorioDAO ambulatorioDAO;
	public static ArquivoDAO arquivoDAO;
	public static AvaliacaoDAO avaliacaoDAO;
	public static CipeDAO cipeDAO;
	public static CompetenciaHabilidadeEspecificaDAO compHabEspDAO;
	public static CompetenciaHabilidadeGeralDAO compHabGerDAO;
	public static CursoDAO cursoDAO;
	public static DescritorDAO descritorDAO;
	public static DiagnosticoAlunoDAO diagnosticoAlunoDAO;
	public static DiagnosticoProfessorDAO diagnosticoProfessorDAO;
	public static EstudocasoDAO estudoCasoDAO;
	public static FeedbackDAO feedbackDAO;
	public static GlossarioDAO glossarioDAO;
	public static IdiomaDAO idiomaDAO;
	public static IntervencaoAlunoDAO intervencaoAlunoDAO;
	public static IntervencaoProfessorDAO intervencaoProfessorDAO;
	@SuppressWarnings("rawtypes")
	public static final Class JPA = FabricaJPADAO.class;
	public static MetaAlunoDAO metaAlunoDAO;
	public static MetaProfessorDAO metaProfessorDAO;
	public static PontoChaveAlunoDAO pontoChaveAlunoDAO;
	public static PontoChaveProfessorDAO pontoChaveProfessorDAO;
	public static ProfessorDAO professorDAO;
	public static UsuarioDAO usuarioDAO;
	public static UsuarioHasIdiomaDAO usuarioHasIdiomaDAO;

	@SuppressWarnings("rawtypes")
	public static FabricaDAO instance(Class factory) {
		try {
			return (FabricaDAO)factory.newInstance();
		} catch (Exception ex) {
			throw new RuntimeException("Não foi possivel instanciar o DAO : " + factory);
		}
	}
	
	public abstract AlunoDAO getAlunoDAO();
	
	public abstract AlunoEstudoCasoDAO getAlunoEstudoCasoDAO();
	
	public abstract AmbulatorioDAO getAmbulatorioDAO();
	
	public abstract ArquivoDAO getArquivoDAO();
	
	public abstract AvaliacaoDAO getAvaliacaoDAO();
	
	public abstract CipeDAO getCipeDAO();
	
	public abstract CompetenciaHabilidadeEspecificaDAO getCompetenciaHabilidadeEspecificaDAO();
	
	public abstract CompetenciaHabilidadeGeralDAO getCompetenciaHabilidadeGeralDAO();
	
	public abstract CursoDAO getCursoDAO();
	
	public abstract DescritorDAO getDescritorDAO();
	
	public abstract DiagnosticoAlunoDAO getDiagnosticoAlunoDAO();

	public abstract DiagnosticoProfessorDAO getDiagnosticoProfessorDAO();
	
	public abstract EstudocasoDAO getEstudocasoDAO();
	
	public abstract FeedbackDAO getFeedbackDAO();
	
	public abstract GlossarioDAO getGlossarioDAO();
	
	public abstract IdiomaDAO getIdiomaDAO();
	
	public abstract IntervencaoAlunoDAO getIntervencaoAlunoDAO();

	public abstract IntervencaoProfessorDAO getIntervencaoProfessorDAO();
	
	public abstract MetaAlunoDAO getMetaAlunoDAO();

	public abstract MetaProfessorDAO getMetaProfessorDAO();
	
	public abstract PontoChaveAlunoDAO getPontoChaveAlunoDAO();
	
	public abstract PontoChaveProfessorDAO getPontoChaveProfessorDAO();
	
	public abstract ProfessorDAO getProfessorDAO();
	
	public abstract UsuarioDAO getUsuarioDAO();
	
	public abstract UsuarioHasIdiomaDAO getUsuarioHasIdiomaDAO();

}