package dados;

import dados.basicas.AlunoDAO;
import dados.basicas.AtendimentoDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.EnfermeiroDAO;
import dados.basicas.ErroDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.ProfessorDAO;
import dados.basicas.ProntuarioDAO;
import dados.basicas.UsuarioDAO;
import dados.basicas.atendimento.AdendoDAO;
import dados.basicas.atendimento.AdmissaoDAO;
import dados.basicas.atendimento.AltaDAO;
import dados.basicas.atendimento.AvaliacaoProfessorDAO;
import dados.basicas.atendimento.EvolucaoDAO;
import dados.basicas.atendimento.antecedentes.AntecedenteFamiliarDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesFamiliaresDAO;
import dados.basicas.atendimento.antecedentes.AntecedentesPessoaisDAO;
import dados.basicas.atendimento.diagnosticointervencoes.CipeDAO;
import dados.basicas.atendimento.diagnosticointervencoes.DiagnosticoDAO;
import dados.basicas.atendimento.diagnosticointervencoes.IntervencoesDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NicDAO;
import dados.basicas.atendimento.diagnosticointervencoes.NocDAO;
import dados.basicas.atendimento.diagnosticointervencoes.ResultadosDAO;
import dados.basicas.atendimento.examefisico.ExameAuditivoDAO;
import dados.basicas.atendimento.examefisico.ExameBocaDAO;
import dados.basicas.atendimento.examefisico.ExameCouroDAO;
import dados.basicas.atendimento.examefisico.ExameFisicoDAO;
import dados.basicas.atendimento.examefisico.ExameMamasDAO;
import dados.basicas.atendimento.examefisico.ExameNarizDAO;
import dados.basicas.atendimento.examefisico.ExameOlhosDAO;
import dados.basicas.atendimento.examefisico.ExamePadraoDAO;
import dados.basicas.atendimento.examefisico.ExamePelesAnexosDAO;
import dados.basicas.atendimento.examefisico.ExamePescocoDAO;
import dados.basicas.atendimento.examefisico.ExameSistCardiovascularDAO;
import dados.basicas.atendimento.examefisico.ExameSistGastroIntestinalDAO;
import dados.basicas.atendimento.examefisico.ExameSistGenitoUrinarioDAO;
import dados.basicas.atendimento.examefisico.ExameSistRespiratorioDAO;
import dados.basicas.atendimento.examemental.ExameMentalDAO;
import dados.basicas.atendimento.examemental.ExameMentalGeralDAO;
import dados.basicas.atendimento.examemental.ExameMentalMiniMentalDAO;
import dados.basicas.atendimento.necessidades.NecessidadesBasicasDAO;
import dados.basicas.atendimento.queixa.QueixaDAO;

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
	    public abstract EnfermeiroDAO getEnfermeiroDAO();
	    public abstract ProfessorDAO getProfessorDAO();
	    public abstract EnderecoDAO getEnderecoDAO();
	    public abstract UsuarioDAO getUsuarioDAO();
	    public abstract PacienteDAO getPacienteDAO();
	    public abstract AtendimentoDAO getAtendimentoDAO();
	    public abstract ProntuarioDAO getProntuarioDAO();
	    
	    public abstract AdmissaoDAO getAdmissaoDAO();
	    public abstract EvolucaoDAO getEvolucaoDAO();
	    public abstract QueixaDAO getQueixaDAO();
	    
	    public abstract AltaDAO getAltaDAO();
	    
	    public abstract AntecedentesDAO getAntecedentesDAO();
	    public abstract AntecedentesPessoaisDAO getAntecedentesPessoaisDAO();
	    public abstract AntecedenteFamiliarDAO getAntecedenteFamiliarDAO();
	    public abstract AntecedentesFamiliaresDAO getAntecedentesFamiliaresDAO();
	    public abstract NecessidadesBasicasDAO getNecessidadesBasicasDAO();
	    
	    public abstract ExameAuditivoDAO getExameAuditivoDAO();
	    public abstract ExameBocaDAO getExameBocaDAO();
	    public abstract ExameCouroDAO getExameCouroDAO();
	    public abstract ExameFisicoDAO getExameFisicoDAO();
	    public abstract ExameMamasDAO getExameMamasDAO();
	    public abstract ExameNarizDAO getExameNarizDAO();
	    public abstract ExameOlhosDAO getExameOlhosDAO();
	    public abstract ExamePadraoDAO getExamePadraoDAO();
	    public abstract ExamePelesAnexosDAO getExamePelesAnexosDAO();
	    public abstract ExamePescocoDAO getExamePescocoDAO();
	    public abstract ExameSistCardiovascularDAO getExameSistCardiovascularDAO();
	    public abstract ExameSistGastroIntestinalDAO getExameSistGastroIntestinalDAO();
	    public abstract ExameSistGenitoUrinarioDAO getExameSistGenitoUrinarioDAO();
	    public abstract ExameSistRespiratorioDAO getExameSistRespiratorioDAO();
	    
	    public abstract ExameMentalDAO getExameMentalDAO();
	    public abstract ExameMentalGeralDAO getExameMentalGeralDAO();
	    public abstract ExameMentalMiniMentalDAO getExameMentalMiniMentalDAO();
	    
	    public abstract CipeDAO getCipeDAO();
	    public abstract NicDAO getNicDAO();
	    public abstract NocDAO getNocDAO();
	    
	    public abstract DiagnosticoDAO getDiagnosticoDAO();
	    public abstract IntervencoesDAO getIntervencoesDAO();
	    public abstract ResultadosDAO getResultadosDAO();
	    
	    public abstract AdendoDAO getAdendoDAO();
	    public abstract AvaliacaoProfessorDAO getAvaliacaoProfessorDAO();

		public abstract ErroDAO getErroDAO();
}
