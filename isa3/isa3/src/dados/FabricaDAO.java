package dados;

import dados.basicas.AdministradorDAO;
import dados.basicas.AlunoDAO;
import dados.basicas.ArcoMaguerezDAO;
import dados.basicas.ArquivoDAO;
import dados.basicas.AvaliacaoDAO;
import dados.basicas.AvaliacaoProfessorDAO;
import dados.basicas.CursoDAO;
import dados.basicas.DiagnosticoAlunoPlanejamentoDAO;
import dados.basicas.DiagnosticosImplementacoesDAO;
import dados.basicas.DiagnosticosResultadosDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.ErroDAO;
import dados.basicas.EstudoDeCasoDAO;
import dados.basicas.HyperLinkDAO;
import dados.basicas.ImplementacaoDAO;
import dados.basicas.MatriculaCursoAlunoDAO;
import dados.basicas.NandaDAO;
import dados.basicas.NicDAO;
import dados.basicas.NocDAO;
import dados.basicas.PlanejamentoDAO;
import dados.basicas.ProfessorDAO;
import dados.basicas.ResultadosEsperadosDAO;
import dados.basicas.UsuarioDAO;

public abstract class FabricaDAO {

	 @SuppressWarnings("unchecked")
		public static final Class HIBERNATE = dados.hibernate.FabricaHibernateDAO.class;

	    @SuppressWarnings("unchecked")
		public static FabricaDAO instance(Class factory) {
	        try {
	            return (FabricaDAO)factory.newInstance();
	        } catch (Exception ex) {
	            throw new RuntimeException("Não foi possível criar a fábrica DAO: " + factory);
	        }
	    }
	    
	    public abstract AlunoDAO getAlunoDAO();
	    public abstract AdministradorDAO getAdministradorDAO();
	    public abstract EnderecoDAO getEnderecoDAO();
	    public abstract NandaDAO getNandaDAO();
	    public abstract NicDAO getNicDAO();
	    public abstract ProfessorDAO getProfessorDAO();
	    public abstract NocDAO getNocDAO();
	    public abstract UsuarioDAO getUsuarioDAO();
	    public abstract CursoDAO getCursoDAO();
		public abstract ErroDAO getErroDAO();
		public abstract MatriculaCursoAlunoDAO getMatriculaCursoAlunoDAO();
		public abstract ArquivoDAO getArquivoDAO();
		public abstract EstudoDeCasoDAO getEstudoDeCasoDAO();
		public abstract ArcoMaguerezDAO getArcoMaguerezDAO();
		public abstract PlanejamentoDAO getPlanejamentoDAO();
		public abstract ImplementacaoDAO getImplementacaoDAO();
		public abstract DiagnosticosImplementacoesDAO getDiagnosticosImplementacoesDAO();
		public abstract DiagnosticosResultadosDAO getDiagnosticosResultadosDAO();
		public abstract AvaliacaoDAO getAplicacaoDAO();
		public abstract ResultadosEsperadosDAO getHipotesesDeSolucaoDAO();
		public abstract AvaliacaoProfessorDAO getAvaliacaoProfessorDAO();
		public abstract AvaliacaoDAO getAvaliacaoDAO();
		public abstract ResultadosEsperadosDAO getResultadosEsperadosDAO();
		public abstract DiagnosticoAlunoPlanejamentoDAO getDiagnosticoAlunoPlanejamentoDAO();
		public abstract HyperLinkDAO getHyperLinkDAO();
}
