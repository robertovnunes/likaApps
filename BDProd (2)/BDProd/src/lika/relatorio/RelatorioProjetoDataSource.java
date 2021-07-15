/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

/**
 *
 * @author Marcio
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.text.DateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import lika.model.Projeto;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioProjetoDataSource implements JRDataSource {

	public List<Projeto> dados;
	public Iterator<Projeto> iterator;
	public boolean proximo = false;
	public Projeto projetoAtual;

	public RelatorioProjetoDataSource(List<Projeto> dados) throws Exception {

		this.dados = dados;
		this.iterator = this.dados.iterator();
	}

	public boolean next() throws JRException {
		this.projetoAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.projetoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Projeto projeto = this.projetoAtual;
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
				new Locale("pt", "BR"));

		if ("titulo".equals(campo.getName())) {
			valor = projeto.getNome();
		} else if ("descricao".equals(campo.getName())) {
			valor = projeto.getDescricao();
		} else if ("dataInicio".equals(campo.getName())) {
			if (projeto.getDataInicio() != null) {
				valor = df.format(projeto.getDataInicio());
			} else {
				valor = "-";

			}
		} else if ("dataFim".equals(campo.getName())) {
			if (projeto.getDataFim() != null) {
				valor = df.format(projeto.getDataFim());
			} else {
				valor = "-";

			}
		} else if ("situacao".equals(campo.getName())) {
			valor = projeto.getSituacaoAtual();
		} else if ("responsavel".equals(campo.getName())) {
			if (projeto.getGerente() != null) {
				valor = projeto.getGerente().getNome();
			} else {
				valor = "-";
			}

		} else if ("viceResponsavel".equals(campo.getName())) {
			if (projeto.getViceGerente() != null) {
				valor = projeto.getViceGerente().getNome();
			} else {
				valor = "-";
			}

		} else if ("tipoProjeto".equals(campo.getName())) {
			valor = projeto.getTipo();
		} else if ("responsavelExterno".equals(campo.getName())) {
			valor = "-";
		} else if ("valor".equals(campo.getName())) {
			valor = projeto.getValor();
			if (valor == null) {
				valor = "";
			}
		} else if ("orgaoFinanciador".equals(campo.getName())) {
			valor = projeto.getOrgaoFinanciador();
			if (valor == null) {
				valor = "Não possui";
			} else if (valor.equals("")) {
				valor = "Não possui";
			}

		}

		return valor;
	}
}
