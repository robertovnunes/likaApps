package negocios;

import java.util.List;

import model.Endereco;
import model.Nanda;
import model.Nic;
import model.Noc;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.curso.matricula.MatriculaCursoAluno;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;
import model.curso.matricula.arcomaguerez.Avaliacao;
import model.curso.matricula.arcomaguerez.DiagnosticosImplementacoes;
import model.curso.matricula.arcomaguerez.DiagnosticosResultados;
import model.curso.matricula.arcomaguerez.HyperLink;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.curso.matricula.arcomaguerez.Planejamento;
import model.curso.matricula.arcomaguerez.ResultadosEsperados;
import model.sistema.Arquivo;
import model.sistema.Erro;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;
import model.usuario.Usuario;
import dados.DAOGenerico;
import dados.FabricaDAO;
import dados.hibernate.FabricaHibernateDAO;


public abstract class GenericNeg<T> {

	public FabricaDAO fabrica;
	private Class<T> type;
	
	public GenericNeg(Class<T> type) {
		fabrica = FabricaHibernateDAO.getInstancia();
		this.type = type;
	}
	
	public List<T> getTodos(){
		DAOGenerico<T, Integer> dao = getDao();
		return (List<T>) dao.getTodos();
	}
	
	public T getPorId(int id){
		DAOGenerico<T, Integer> dao = getDao();
		return (T) dao.getPorId(id, true);
	}

	public List<T> getPorConsulta(String tipo, String valor) {
		DAOGenerico<T, Integer> dao = getDao();
		return (List<T>) dao.getPorConsulta(tipo, valor);
	}
	
	public T persistir(T entity) {
		DAOGenerico<T, Integer> dao = getDao();
		return (T) dao.persistir(entity);
	}
	
	public T updateEntidade(T entity) {
		DAOGenerico<T, Integer> dao = getDao();
		return (T) dao.updateEntidade(entity);
	}
	
	public void refreshEntidade(T entity){
		DAOGenerico<T, Integer> dao = getDao();
		dao.refreshEntidade(entity);
	}
	
	public void remover(T entity) {
		DAOGenerico<T, Integer> dao = getDao();
		dao.remover(entity);
	}
	
	@SuppressWarnings("unchecked")
	public DAOGenerico<T, Integer> getDao(){
		DAOGenerico<T, Integer> daoRetorno = null;
		try {
			if(type.newInstance() instanceof Administrador){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getAdministradorDAO();
			}else if(type.newInstance() instanceof Aluno){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getAlunoDAO();
			}else if(type.newInstance() instanceof ArcoMaguerezEstudoDeCaso){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getArcoMaguerezDAO();
			}else if(type.newInstance() instanceof Arquivo){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getArquivoDAO();
			}else if(type.newInstance() instanceof Avaliacao){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getAvaliacaoDAO();
			}else if(type.newInstance() instanceof Avaliacao){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getAvaliacaoProfessorDAO();
			}else if(type.newInstance() instanceof Curso){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getCursoDAO();
			}else if(type.newInstance() instanceof DiagnosticosImplementacoes){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getDiagnosticosImplementacoesDAO();
			}else if(type.newInstance() instanceof DiagnosticosResultados){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getDiagnosticosResultadosDAO();
			}else if(type.newInstance() instanceof Endereco){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getEnderecoDAO();
			}else if(type.newInstance() instanceof Erro){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getErroDAO();
			}else if(type.newInstance() instanceof EstudoDeCaso){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getEstudoDeCasoDAO();
			}else if(type.newInstance() instanceof Implementacao){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getImplementacaoDAO();
			}else if(type.newInstance() instanceof MatriculaCursoAluno){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getMatriculaCursoAlunoDAO();
			}else if(type.newInstance() instanceof Nanda){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getNandaDAO();
			}else if(type.newInstance() instanceof Nic){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getNicDAO();
			}else if(type.newInstance() instanceof Noc){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getNocDAO();
			}else if(type.newInstance() instanceof Planejamento){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getPlanejamentoDAO();
			}else if(type.newInstance() instanceof Professor){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getProfessorDAO();
			}else if(type.newInstance() instanceof ResultadosEsperados){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getResultadosEsperadosDAO();
			}else if(type.newInstance() instanceof Usuario){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getUsuarioDAO();
			}else if(type.newInstance() instanceof HyperLink){
				daoRetorno = (DAOGenerico<T, Integer>) fabrica.getHyperLinkDAO();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return daoRetorno;
	}
}
