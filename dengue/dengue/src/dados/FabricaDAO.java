package dados;

import dados.basicas.ArquivoDAO;
import dados.basicas.BairroDAO;
import dados.basicas.CNESDAO;
import dados.basicas.CidadeDAO;
import dados.basicas.ConclusaoDAO;
import dados.basicas.DadosClinicosDAO;
import dados.basicas.DadosGeraisDAO;
import dados.basicas.DadosLaboratoriaisDAO;
import dados.basicas.ErroDAO;
import dados.basicas.LogradouroDAO;
import dados.basicas.NotificacaoInvestigativaDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.PaisDAO;
import dados.basicas.ResidenciaDAO;
import dados.basicas.UFDAO;
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
	    
	    public abstract ResidenciaDAO getEnderecoDAO();
	    public abstract UsuarioDAO getUsuarioDAO();
	    public abstract ErroDAO getErroDAO();

		public abstract BairroDAO getBairroDAO();
		public abstract CidadeDAO getCidadeDAO();
		public abstract LogradouroDAO getLogradouroDAO();
		public abstract PaisDAO getPaisDAO();
		public abstract ResidenciaDAO getResidenciaDAO();
		public abstract UFDAO getUFDAO();
		
		public abstract CNESDAO getCNESDAO();
		
		public abstract ArquivoDAO getArquivoDAO();
		public abstract NotificacaoInvestigativaDAO getNotificacaoInvestigativaDAO();
		
		public abstract DadosGeraisDAO getDadosGeraisDAO();
		public abstract ConclusaoDAO getConclusaoDAO();
		public abstract DadosLaboratoriaisDAO getDadosLaboratoriaisDAO();
		public abstract DadosClinicosDAO getDadosClinicosDAO();
		public abstract PacienteDAO getPacienteDAO();
		
}
