package lika.handler;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import lika.model.Pessoa;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("pessoaHandler")
@Scope("session")
public class PessoaHandler {

	private Pessoa pessoaAtual;

	private String parametroConsulta = "";

	private List<Pessoa> pessoas = new ArrayList<Pessoa>();

	public void consultar() {
		try {
			this.pessoas.clear();

			this.listarPessoaPorNome();

		} catch (Exception e) {
			FacesContext fc = FacesContext.getCurrentInstance();
			fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"ERRO: ao tentar listar as Pessoas " + e.getMessage(), ""));
		}
	}

	public void listarPessoaPorNome() {
		this.pessoas.clear();
		this.pessoas = DaoHandler.getInstance().getPessoaDao().listar(
				this.parametroConsulta, "");
	}

	public Pessoa getPessoaAtual() {
		return pessoaAtual;
	}

	public void setPessoaAtual(Pessoa pessoaAtual) {
		this.pessoaAtual = pessoaAtual;
	}

	public String getParametroConsulta() {
		return parametroConsulta;
	}

	public void setParametroConsulta(String parametroConsulta) {
		this.parametroConsulta = parametroConsulta;
	}

	public List<Pessoa> getPessoas() {
		return pessoas;
	}

	public void setPessoas(List<Pessoa> pessoas) {
		this.pessoas = pessoas;
	}

}
