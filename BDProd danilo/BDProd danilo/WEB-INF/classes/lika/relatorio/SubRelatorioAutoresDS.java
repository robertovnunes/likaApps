package lika.relatorio;

import java.sql.Date;
import java.text.DateFormat;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import lika.model.Autor;
import lika.model.Pessoa;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class SubRelatorioAutoresDS implements JRDataSource {

	public List<Autor> dados;
	public Iterator<Autor> iterator;
	public boolean proximo = false;
	public Autor pessoaAtual;

	public SubRelatorioAutoresDS(List<Autor> dados) {
		this.dados = dados;
		this.iterator = dados.iterator();
	}

	public boolean next() throws JRException {
		this.pessoaAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.pessoaAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Autor pessoa = this.pessoaAtual;
		if ("total".equals(campo.getName())) {
			valor = " " + this.dados.size();
		}
		if ("nome".equals(campo.getName())) {
			valor = pessoa.getNome();
		} else if ("situacao".equals(campo.getName())) {
			if (pessoa.getAutorDoLika() != null) {
				valor = pessoa.getAutorDoLika().getSituacao();
				System.out.println(" TESTEEEEE" + pessoa.getAutorDoLika().getSituacao());
			} else {
				valor = "Autor Externo";
			}
		} else if ("dataDesligamento".equals(campo.getName())) {
			if (pessoa.getAutorDoLika() != null) {
				if (pessoa.getAutorDoLika().getDataDesligamento() != null) {
					DateFormat df = DateFormat.getDateInstance(
							DateFormat.MEDIUM, new Locale("pt", "BR"));

					valor = df.format(pessoa.getAutorDoLika()
							.getDataDesligamento());
				} else {
					valor = " - ";
				}
			} else {
				valor = " - ";
			}
		}
		return valor;
	}
}
