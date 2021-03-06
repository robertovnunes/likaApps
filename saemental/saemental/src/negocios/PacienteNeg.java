package negocios;

import java.util.Date;
import java.util.List;

import model.Endereco;
import model.paciente.Paciente;
import model.paciente.prontuario.Prontuario;
import model.usuario.Usuario;
import dados.FabricaDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.PacienteDAO;
import dados.basicas.ProntuarioDAO;
import dados.hibernate.FabricaHibernateDAO;

public class PacienteNeg {

	private FabricaDAO fabrica = new FabricaHibernateDAO();
	public static PacienteNeg instancia;
	
	public PacienteNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}

	public static PacienteNeg getInstancia(){
		if(PacienteNeg.instancia == null){
			PacienteNeg.instancia = new PacienteNeg();
		}
		return PacienteNeg.instancia;
	}
	
	public Paciente inserirPaciente(Paciente paciente) {
		Endereco endereco = paciente.getEndereco();
		endereco = criarEndereco(endereco);
		Prontuario prontuario = paciente.getProntuario();
		prontuario.setDataHora(new Date());
		prontuario = criarProntuario(prontuario);
		
		paciente.setDataCriacao(new Date());
		paciente.setEndereco(endereco);
		paciente.setProntuario(prontuario);
		
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		
		paciente = dao.persistir(paciente);
		if (endereco == null || prontuario == null || paciente == null) {
			removerEndereco(endereco);
			removerProntuario(prontuario);
		}
		return paciente;
	}
	
	public void removerPaciente(Paciente paciente) {
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		dao.remover(paciente);
	}
	
	public Paciente buscarPorId(int id, boolean lock){
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		return dao.getPorId(id, lock);
	}
	
	public List<Paciente> getTodos(){
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		return dao.getTodos();
	}
	
	public List<Paciente> getPacientesPorConsulta(String tipo, String valor) {
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		return dao.getPacientesPorConsulta(tipo, valor);
	}
	
	public List<Paciente> getPacientesDoUsuarioPorConsulta(String tipo, String valor, Usuario usuario) {
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		return dao.getPacientesDoUsuarioPorConsulta(tipo, valor,usuario);
	}
	
	public List<Paciente> getPacientesDoUsuario(Usuario usuario) {
		PacienteDAO dao = this.fabrica.getPacienteDAO();
		return dao.getPacientesDoUsuario(usuario);
	}
	
	/** M???todos Privados	 */
	private Endereco criarEndereco(Endereco end) {
		
		EnderecoDAO dao = this.fabrica.getEnderecoDAO();
		return dao.persistir(end);
	}
	
	private Prontuario criarProntuario(Prontuario pronturario) {
		ProntuarioDAO dao = this.fabrica.getProntuarioDAO();
		return dao.persistir(pronturario);
	}
	
	private void removerEndereco(Endereco end) {
		EnderecoDAO dao = this.fabrica.getEnderecoDAO();
		dao.remover(end);
	}
	
	private void removerProntuario(Prontuario pronturario) {
		ProntuarioDAO dao = this.fabrica.getProntuarioDAO();
		dao.remover(pronturario);
	}
}
