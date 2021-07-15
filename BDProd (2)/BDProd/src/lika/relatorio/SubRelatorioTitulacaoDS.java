/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

import java.util.Iterator;
import java.util.List;

import lika.model.Titulacao;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class SubRelatorioTitulacaoDS implements JRDataSource {

	public List<Titulacao> dados;
	public Iterator<Titulacao> iterator;
	public boolean proximo = false;
	public Titulacao titulacaoAtual;

	public SubRelatorioTitulacaoDS(List<Titulacao> titulacao) {

		this.dados = titulacao;
		this.iterator = this.dados.iterator();
	}

	public boolean next() throws JRException {
		this.titulacaoAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.titulacaoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Titulacao tit = this.titulacaoAtual;

		if ("titulacao".equals(campo.getName())) {
			valor = tit.getTitulacao();
		} else if ("curso".equals(campo.getName())) {
			valor = tit.getCurso();
		} else if ("instituicao".equals(campo.getName())) {
			valor = tit.getInstituicao();
		} else if ("ano".equals(campo.getName())) {
			valor = tit.getConclusao();
		}
		return valor;

	}

}
