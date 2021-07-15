package genericos.implementacao;

import genericos.FabricaDAO;

import javax.persistence.EntityManager;

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
import dao.jpa.AlunoEstudoCasoJPADAO;
import dao.jpa.AlunoJPADAO;
import dao.jpa.AmbulatorioJAPDAO;
import dao.jpa.ArquivoJPADAO;
import dao.jpa.AvaliacaoJPADAO;
import dao.jpa.CipeJPADAO;
import dao.jpa.CompetenciaHabilidadeEspecificaJPADAO;
import dao.jpa.CompetenciaHabilidadeGeralJPADAO;
import dao.jpa.CursoJPADAO;
import dao.jpa.DescritorJPADAO;
import dao.jpa.DiagnosticoAlunoJPADAO;
import dao.jpa.DiagnosticoProfessorJPADAO;
import dao.jpa.EstudocasoJPADAO;
import dao.jpa.FeedbackJPADAO;
import dao.jpa.GlossarioJPADAO;
import dao.jpa.IdiomaJPADAO;
import dao.jpa.IntervencaoAlunoJPADAO;
import dao.jpa.IntervencaoProfessorJPADAO;
import dao.jpa.MetaAlunoJPADAO;
import dao.jpa.MetaProfessorJPADAO;
import dao.jpa.PontoChaveAlunoJPADAO;
import dao.jpa.PontoChaveProfessorJPADAO;
import dao.jpa.ProfessorJPADAO;
import dao.jpa.UsuarioHasIdiomaJPADAO;
import dao.jpa.UsuarioJPADAO;
import entityManagerFactory.EntityManageFactoryImpl;
/**
 * @author Jesus
 *
 */

public class FabricaJPADAO extends FabricaDAO{

	public static FabricaJPADAO instancia;

	public static FabricaJPADAO getInstancia(){
		if(FabricaJPADAO.instancia == null){
			FabricaJPADAO.instancia = new FabricaJPADAO();
		}
		return FabricaJPADAO.instancia;
	}

	@Override
	public AlunoDAO getAlunoDAO() {
		if(alunoDAO == null){
			alunoDAO = (AlunoDAO) this.instanciarDAO(AlunoJPADAO.class);
		}
		return alunoDAO;
	}

	@Override
	public AlunoEstudoCasoDAO getAlunoEstudoCasoDAO() {
		if(alunoEstudoCasoDAO == null){
			alunoEstudoCasoDAO = (AlunoEstudoCasoDAO) this.instanciarDAO(AlunoEstudoCasoJPADAO.class);
		}
		return alunoEstudoCasoDAO;
	}
	
	@Override
	public AmbulatorioDAO getAmbulatorioDAO() {
		if(ambulatorioDAO == null){
			ambulatorioDAO = (AmbulatorioDAO) this.instanciarDAO(AmbulatorioJAPDAO.class);
		}
		return ambulatorioDAO;
	}
	
	
	@Override
	public ArquivoDAO getArquivoDAO() {
		if(arquivoDAO == null){
			arquivoDAO = (ArquivoDAO) this.instanciarDAO(ArquivoJPADAO.class);
		}
		return arquivoDAO;
	}
	
	@Override
	public AvaliacaoDAO getAvaliacaoDAO() {
		if(avaliacaoDAO == null){
			avaliacaoDAO = (AvaliacaoDAO) this.instanciarDAO(AvaliacaoJPADAO.class);
		}
		return avaliacaoDAO;
	}
	
	@Override
	public CipeDAO getCipeDAO(){
		if(cipeDAO == null){
			cipeDAO = (CipeDAO) this.instanciarDAO(CipeJPADAO.class);
		}
		return cipeDAO;
	}
	
	@Override
	public CompetenciaHabilidadeEspecificaDAO getCompetenciaHabilidadeEspecificaDAO() {
		if(compHabEspDAO == null){
			compHabEspDAO = (CompetenciaHabilidadeEspecificaDAO) this.instanciarDAO(CompetenciaHabilidadeEspecificaJPADAO.class);
		}
		return compHabEspDAO;
	}
	

	@Override
	public CompetenciaHabilidadeGeralDAO getCompetenciaHabilidadeGeralDAO() {
		if(compHabGerDAO == null){
			compHabGerDAO = (CompetenciaHabilidadeGeralDAO) this.instanciarDAO(CompetenciaHabilidadeGeralJPADAO.class);
		}
		return compHabGerDAO;
	}
	
	protected EntityManager getCurrentManager() {
		return EntityManageFactoryImpl.currentEntityManager();
	}
	
	@Override
	public CursoDAO getCursoDAO() {
		if(cursoDAO == null){
			cursoDAO = (CursoDAO) this.instanciarDAO(CursoJPADAO.class);
		}
		return cursoDAO;
	}
	
	@Override
	public DescritorDAO getDescritorDAO() {
		if(descritorDAO == null){
			descritorDAO = (DescritorDAO) this.instanciarDAO(DescritorJPADAO.class);
		}
		return descritorDAO;
	}
	
	@Override
	public DiagnosticoAlunoDAO getDiagnosticoAlunoDAO() {
		if(diagnosticoAlunoDAO == null){
			diagnosticoAlunoDAO = (DiagnosticoAlunoDAO) this.instanciarDAO(DiagnosticoAlunoJPADAO.class);
		}
		
		return diagnosticoAlunoDAO;
	}
	
	@Override
	public DiagnosticoProfessorDAO getDiagnosticoProfessorDAO() {
		if(diagnosticoProfessorDAO == null){
			diagnosticoProfessorDAO = (DiagnosticoProfessorDAO) this.instanciarDAO(DiagnosticoProfessorJPADAO.class);
		}
		return diagnosticoProfessorDAO;
	}
	
	@Override
	public EstudocasoDAO getEstudocasoDAO() {
		if(estudoCasoDAO == null){
			estudoCasoDAO = (EstudocasoDAO) this.instanciarDAO(EstudocasoJPADAO.class);
		}
		return estudoCasoDAO;
	}
	
	@Override
	public FeedbackDAO getFeedbackDAO() {
		if(feedbackDAO == null){
			feedbackDAO = (FeedbackDAO) this.instanciarDAO(FeedbackJPADAO.class);
		}
		return feedbackDAO;
	}
	
	@Override
	public GlossarioDAO getGlossarioDAO(){
		if(glossarioDAO == null){
			glossarioDAO = (GlossarioDAO) this.instanciarDAO(GlossarioJPADAO.class);
		}
		return glossarioDAO;
	}

	@Override
	public IdiomaDAO getIdiomaDAO() {
		if(idiomaDAO == null){
			idiomaDAO = (IdiomaDAO) this.instanciarDAO(IdiomaJPADAO.class);
		}
		return idiomaDAO;
	}
	
	@Override
	public IntervencaoAlunoDAO getIntervencaoAlunoDAO() {
		if(intervencaoAlunoDAO == null){
			intervencaoAlunoDAO = (IntervencaoAlunoDAO) this.instanciarDAO(IntervencaoAlunoJPADAO.class);
		}
		return intervencaoAlunoDAO;
	}
	
	@Override
	public IntervencaoProfessorDAO getIntervencaoProfessorDAO() {
		if(intervencaoProfessorDAO == null){
			intervencaoProfessorDAO = (IntervencaoProfessorDAO) this.instanciarDAO(IntervencaoProfessorJPADAO.class);
		}
		return intervencaoProfessorDAO;
	}
	
	@Override
	public MetaAlunoDAO getMetaAlunoDAO() {
		if(metaAlunoDAO == null){
			metaAlunoDAO = (MetaAlunoDAO) this.instanciarDAO(MetaAlunoJPADAO.class);
		}
		return metaAlunoDAO;
	}
	
	@Override
	public MetaProfessorDAO getMetaProfessorDAO() {
		if(metaProfessorDAO == null){
			metaProfessorDAO = (MetaProfessorDAO) this.instanciarDAO(MetaProfessorJPADAO.class);
		}
		return metaProfessorDAO;
	}
	
	@Override
	public PontoChaveAlunoDAO getPontoChaveAlunoDAO() {
		if(pontoChaveAlunoDAO == null){
			pontoChaveAlunoDAO = (PontoChaveAlunoDAO) this.instanciarDAO(PontoChaveAlunoJPADAO.class);
		}
		return pontoChaveAlunoDAO;
	}
	
	@Override
	public PontoChaveProfessorDAO getPontoChaveProfessorDAO() {
		if(pontoChaveProfessorDAO == null){
			pontoChaveProfessorDAO = (PontoChaveProfessorDAO) this.instanciarDAO(PontoChaveProfessorJPADAO.class);
		}
		return pontoChaveProfessorDAO;
	}

	@Override
	public ProfessorDAO getProfessorDAO() {
		if(professorDAO == null){
			professorDAO = (ProfessorDAO) this.instanciarDAO(ProfessorJPADAO.class);
		}
		return professorDAO;
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		if(usuarioDAO == null){
			usuarioDAO = (UsuarioDAO) this.instanciarDAO(UsuarioJPADAO.class);
		}
		return usuarioDAO;
	}

	@Override
	public UsuarioHasIdiomaDAO getUsuarioHasIdiomaDAO() {
		if(usuarioHasIdiomaDAO == null){
			usuarioHasIdiomaDAO = (UsuarioHasIdiomaDAO) this.instanciarDAO(UsuarioHasIdiomaJPADAO.class);
		}
		return usuarioHasIdiomaDAO;
	}

	@SuppressWarnings("rawtypes")
	private DAOGenericoJPA instanciarDAO(Class daoClass) {
		try {
			DAOGenericoJPA dao = (DAOGenericoJPA) daoClass.newInstance();
            dao.setManager(getCurrentManager());
            return dao;
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("Não foi possível instanciar o DAO: " + daoClass, ex);
		}
	}

}
