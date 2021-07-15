package lika.relatorio;

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
public class RelatorioPeriodicoDS implements JRDataSource {

	public List<Publicacao> dados;
	public Iterator<Publicacao> iterator;
	public boolean proximo = false;
	public Publicacao publicacaoAtual;

	public RelatorioPeriodicoDS(List<Publicacao> dados) {
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
		} else if ("link".equals(campo.getName())) {
			if (publicacao.getLinkPublicacao() != null) {
				valor = publicacao.getLinkPublicacao();
			} else {
				valor = "-";
			}
		} else if ("periodico".equals(campo.getName())) {
			if (publicacao.getPeriodico() != null) {
				valor = publicacao.getPeriodico();
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
			if (publicacao.getPaginaInicial() != null
					&& !publicacao.getTipoPublicacao().equals("Livro")) {
				valor = publicacao.getPaginaInicial();
			} else {
				valor = "-";
			}
		} else if ("pagFinal".equals(campo.getName())) {
			if (publicacao.getPaginaFinal() != null
					&& !publicacao.getTipoPublicacao().equals("Livro")) {
				valor = publicacao.getPaginaFinal();
			} else {
				valor = "-";
			}
		} else if ("issn".equals(campo.getName())) {
			if (publicacao.getISSN() != null) {
				valor = publicacao.getISSN();
			} else {
				valor = "-";
			}
		} else if ("idioma".equals(campo.getName())) {
			if (publicacao.getPais() != null) {
				valor = publicacao.getPais();
			} else {
				valor = "-";
			}
		} else if ("tipo".equals(campo.getName())) {
			valor = publicacao.getTipoPublicacao();
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