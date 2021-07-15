/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import lika.model.Publicacao;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioAnaisDS implements JRDataSource {

	public List<Publicacao> dados;
	public Iterator<Publicacao> iterator;
	public boolean proximo = false;
	public Publicacao publicacaoAtual;

	public RelatorioAnaisDS(List<Publicacao> dados) {

		this.dados = dados;
		this.iterator = this.dados.iterator();
	}

	public boolean next() throws JRException {
		this.publicacaoAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.publicacaoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Publicacao publicacao = this.publicacaoAtual;

		if ("titulo".equals(campo.getName())) {
			valor = publicacao.getTitulo();
		} else if ("autores".equals(campo.getName())) {
			valor = new SubRelatorioAutoresDS(publicacao.getAutores());
		} else if ("ano".equals(campo.getName())) {
			valor = publicacao.getAnoPublicacao();
		} else if ("doi".equals(campo.getName())) {
			valor = publicacao.getDOI();
		} else if ("volume".equals(campo.getName())) {
			if (publicacao.getVolume() != null) {
				valor = publicacao.getVolume();
			} else {
				valor = "-";
			}
		} else if ("serie".equals(campo.getName())) {
			if (publicacao.getSerie() != null) {
				valor = publicacao.getSerie();
			} else {
				valor = "-";
			}
		} else if ("fasciculo".equals(campo.getName())) {
			if (publicacao.getFasciculo() != null) {
				valor = publicacao.getFasciculo();
			} else {
				valor = "-";
			}
		} else if ("link".equals(campo.getName())) {
			if (publicacao.getLinkPublicacao() != null) {
				valor = publicacao.getLinkPublicacao();
			} else {
				valor = "-";
			}
		} else if ("natureza".equals(campo.getName())) {
			if (publicacao.getNatureza() != null) {
				valor = publicacao.getNatureza();
			} else {
				valor = "-";
			}
		} else if ("tipo".equals(campo.getName())) {
			if (publicacao.getTipoPublicacao() != null) {
				valor = publicacao.getTipoPublicacao();
			} else {
				valor = "-";
			}
		} else if ("tipoAnal".equals(campo.getName())) {
			if (publicacao.getTipo() != null) {
				valor = publicacao.getTipo();
			} else {
				valor = "-";
			}
		} else if ("editora".equals(campo.getName())) {
			if (publicacao.getEditora() != null) {
				valor = publicacao.getEditora();
			} else {
				valor = "-";
			}
		} else if ("cidadeEditora".equals(campo.getName())) {
			if (publicacao.getCidadeEditora() != null) {
				valor = publicacao.getCidadeEditora();
			} else {
				valor = "-";
			}

		} else if ("projeto".equals(campo.getName())) {
			if (publicacao.getProjeto() != null) {
				valor = publicacao.getProjeto().getNome();
			} else {
				valor = " - ";
			}

		} else if ("pagInicial".equals(campo.getName())) {
			if (publicacao.getPaginaInicial() != null) {
				valor = publicacao.getPaginaInicial();
			} else {
				valor = "-";
			}

		} else if ("tituloAnais".equals(campo.getName())) {
			if (publicacao.getTituloAnaisEvento() != null) {
				valor = publicacao.getTituloAnaisEvento();
			} else {
				valor = "-";
			}
		} else if ("pagFinal".equals(campo.getName())) {
			if (publicacao.getPaginaFinal() != null) {
				valor = publicacao.getPaginaFinal();
			} else {
				valor = "-";
			}
		} else if ("isbn".equals(campo.getName())) {
			if (publicacao.getISBN() != null) {
				valor = publicacao.getISBN();
			} else {
				valor = "-";
			}
		} else if ("idioma".equals(campo.getName())) {
			if (publicacao.getPais() != null) {
				valor = publicacao.getPais();
			} else {
				valor = "-";
			}
		} else if ("pais".equals(campo.getName())) {
			if (publicacao.getLocalConferencia() != null) {
				valor = publicacao.getLocalConferencia();
			} else {
				valor = "-";
			}
		} else if ("total".equals(campo.getName())) {
			if (this.dados.size() == 1) {
				valor = publicacao.getAutores().size() + " Autor";
			} else {
				valor = publicacao.getAutores().size() + " Autores";
			}
		} else if ("total".equals(campo.getName())) {
			int t = publicacao.getAutores().size();
			if (t == 1) {
				valor = t + " Autor";
			} else {
				valor = t + " Autores";
			}
		}

		return valor;
	}
}