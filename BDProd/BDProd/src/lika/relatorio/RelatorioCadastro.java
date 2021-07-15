package lika.relatorio;

import java.util.Iterator;
import java.util.List;

import lika.model.Pesquisador;
import lika.model.Pessoa;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

public class RelatorioCadastro implements JRDataSource {

	public List<Pessoa> dados;
	public Iterator<Pessoa> iterator;
	public boolean proximo = false;
	public Pessoa pessoaAtual;

	public RelatorioCadastro(List<Pessoa> titulacao) {

		this.dados = titulacao;
		this.iterator = this.dados.iterator();

	}

	public boolean next() throws JRException {
		this.pessoaAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.pessoaAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Pessoa pessoa = this.pessoaAtual;

		if ("titulacoes".equals(campo.getName())) {
			valor = new SubRelatorioTitulacaoDS(pessoa.getTitulacao());
		}
		return valor;

	}

}