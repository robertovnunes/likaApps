package negocios;

import java.util.Date;

import model.Endereco;
import model.usuario.Administrador;
import dados.basicas.AdministradorDAO;
import dados.basicas.EnderecoDAO;

public class AdministradorNeg extends GenericNeg<Administrador>{

	public AdministradorNeg() {
		super(Administrador.class);
	}

	public static AdministradorNeg instancia;

	public static AdministradorNeg getInstancia() {
		if (AdministradorNeg.instancia == null) {
			AdministradorNeg.instancia = new AdministradorNeg();
		}
		return AdministradorNeg.instancia;
	}

	public Administrador criarUsuarioAdministrador(Administrador enfer) {
		Endereco endereco = enfer.getEndereco();
		endereco = criarEndereco(endereco);
		enfer.setDataCriacao(new Date());
		enfer.setDataCriacao(new Date());

		enfer.setEndereco(endereco);

		AdministradorDAO dao = this.fabrica.getAdministradorDAO();

		enfer = dao.persistir(enfer);
		if (enfer == null) {
			removerEndereco(endereco);
		}
		return enfer;
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
