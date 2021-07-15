package negocios;

import java.util.Date;
import java.util.List;

import dados.basicas.EnderecoDAO;
import dados.basicas.ProfessorDAO;
import model.Endereco;
import model.usuario.Professor;

public class ProfessorNeg extends GenericNeg<Professor>{

	public static ProfessorNeg instancia;

	public ProfessorNeg() {
		super(Professor.class);
	}

	public static ProfessorNeg getInstancia() {
		if (ProfessorNeg.instancia == null) {
			ProfessorNeg.instancia = new ProfessorNeg();
		}
		return ProfessorNeg.instancia;
	}
	
	public Professor criarUsuarioProfessor(Professor prof) {
		Endereco endereco = prof.getEndereco();
		endereco = criarEndereco(endereco);
		prof.setDataCriacao(new Date());
		prof.setDataCriacao(new Date());

		prof.setEndereco(endereco);

		ProfessorDAO dao = this.fabrica.getProfessorDAO();

		prof = dao.persistir(prof);
		if (prof == null) {
			removerEndereco(endereco);
		}
		return prof;
	}

	

	/** M�todos Privados */
	private Endereco criarEndereco(Endereco end) {

		EnderecoDAO dao = this.fabrica.getEnderecoDAO();
		return dao.persistir(end);
	}

	private void removerEndereco(Endereco end) {

		EnderecoDAO dao = this.fabrica.getEnderecoDAO();
		dao.remover(end);
	}
}
