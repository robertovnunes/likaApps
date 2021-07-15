package negocios;

import java.util.Date;
import java.util.List;

import model.Endereco;
import model.usuario.Enfermeiro;
import dados.FabricaDAO;
import dados.basicas.EnderecoDAO;
import dados.basicas.EnfermeiroDAO;
import dados.hibernate.FabricaHibernateDAO;

public class EnfermeiroNeg {

	private FabricaDAO fabrica = new FabricaHibernateDAO();
	public static EnfermeiroNeg instancia;

	public EnfermeiroNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}

	public static EnfermeiroNeg getInstancia() {
		if (EnfermeiroNeg.instancia == null) {
			EnfermeiroNeg.instancia = new EnfermeiroNeg();
		}
		return EnfermeiroNeg.instancia;
	}

	public Enfermeiro criarUsuarioEnfermeiro(Enfermeiro enfer) {
		Endereco endereco = enfer.getEndereco();
		endereco = criarEndereco(endereco);
		enfer.setDataCriacao(new Date());
		enfer.setDataCriacao(new Date());

		enfer.setEndereco(endereco);

		EnfermeiroDAO dao = this.fabrica.getEnfermeiroDAO();

		enfer = dao.persistir(enfer);
		if (enfer == null) {
			removerEndereco(endereco);
		}
		return enfer;
	}

	public void removerEnfermeiro(Enfermeiro enfermeiro) {
		EnfermeiroDAO dao = this.fabrica.getEnfermeiroDAO();
		dao.remover(enfermeiro);
	}

	public Enfermeiro buscarPorId(int id, boolean lock) {
		EnfermeiroDAO dao = this.fabrica.getEnfermeiroDAO();
		return dao.getPorId(id, lock);
	}

	public List<Enfermeiro> getTodos() {
		EnfermeiroDAO dao = this.fabrica.getEnfermeiroDAO();
		return dao.getTodos();
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
