/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

import java.util.Iterator;
import java.util.List;

import lika.handler.DaoHandler;
import lika.model.Autor;
import lika.model.Publicacao;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioPublicacaoDataSource implements JRDataSource {

	public List<Publicacao> dados;
	public Iterator<Publicacao> iterator;
	public boolean proximo = false;
	public Publicacao publicacaoAtual;
	public String periodo;
	public String filtro;
	public String tipoPublicacao;
	public String anoAnterior = "";

	public RelatorioPublicacaoDataSource(List<Publicacao> dados,
			String periodo, String filtro, String tipoPublicacao) {
		this.dados = dados;
		this.iterator = this.dados.iterator();
		this.periodo = periodo;
		this.filtro = filtro;
		this.tipoPublicacao = tipoPublicacao;
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
			valor = this.publicacoes(publicacao);
		} else if ("ano".equals(campo.getName())) {
			if (publicacao.getAnoPublicacao().toString().equals(anoAnterior)) {
				valor = null;
			} else {
				valor = publicacao.getAnoPublicacao();
				anoAnterior = publicacao.getAnoPublicacao().toString();
			}
		}

		else if ("autores".equals(campo.getName())) {
			valor = this.listaDeAutores(publicacao);
		} else if ("anoPublicacao".equals(campo.getName())) {
			valor = publicacao.getAnoPublicacao();
		} else if ("volume".equals(campo.getName())) {
			valor = publicacao.getVolume();
		} else if ("serie".equals(campo.getName())) {
			valor = publicacao.getSerie();

		} else if ("paginaInicial".equals(campo.getName())) {
			if (publicacao.getPaginaInicial() != null
					&& !publicacao.getTipoPublicacao().equals("Livro")) {
				valor = publicacao.getPaginaInicial();
			} else {
				valor = "";
			}
		} else if ("paginaFinal".equals(campo.getName())) {
			if (publicacao.getPaginaFinal() != null
					&& !publicacao.getTipoPublicacao().equals("Livro")) {
				valor = publicacao.getPaginaFinal();
			} else {
				valor = "";
			}
		} else if ("issn".equals(campo.getName())) {
			if (publicacao.getISBN() != null) {
				valor = publicacao.getISBN();
			} else {
				valor = publicacao.getISSN();
			}
		} else if ("idioma".equals(campo.getName())) {
			valor = publicacao.getPais();
		} else if ("tipoPublicacao".equals(campo.getName())) {
			valor = tipoPublicacao;
		} else if ("por".equals(campo.getName())) {
			valor = filtro;
		} else if ("periodo".equals(campo.getName())) {
			valor = periodo;
		} else if ("total".equals(campo.getName())) {
			if (this.dados.size() == 1) {
				valor = this.dados.size() + " Publicação";
			} else {
				valor = this.dados.size() + " Publicações";
			}
		}

		return valor;
	}

	public String listaDeAutores(Publicacao publicacao) {
		String autores = publicacao.getTitulo() + ". ";
		List<Autor> pessoas = DaoHandler.getInstance().getPublicacaoDao()
				.listarAutores(publicacao);
		for (int i = 0; i < pessoas.size(); i++) {
			if (pessoas.get(i).getNomePublicacao() != null) {
				if (i == pessoas.size() - 1) {
					autores = autores + pessoas.get(i).getNomePublicacao()
							+ ", ";
				} else {
					autores = autores + pessoas.get(i).getNomePublicacao()
							+ "; ";
				}
			}
		}
		return autores;
	}

	public String publicacoes(Publicacao publicacao) {
		String autores = publicacao.getTitulo() + ". ";
		List<Autor> pessoas = DaoHandler.getInstance().getPublicacaoDao()
				.listarAutores(publicacao);
		for (int i = 0; i < pessoas.size(); i++) {
			if (pessoas.get(i).getNomePublicacao() != null) {
				if (i == pessoas.size() - 1) {
					autores = autores + pessoas.get(i).getNomePublicacao()
							+ ", ";
				} else {
					autores = autores + pessoas.get(i).getNomePublicacao()
							+ "; ";
				}
			}
		}
		autores = autores + ". In: ";

		if (publicacao.getTipoPublicacao().equals("Periódico")) {
			autores = autores + publicacao.getPeriodico();
		} else if (publicacao.getTipoPublicacao().equals("Anais de Eventos")) {
			autores = autores + publicacao.getTituloAnaisEvento();
		} else if (publicacao.getTipoPublicacao().equals("Livro")) {
			autores = autores + publicacao.getEditora();
		}
		autores = autores + ", " + publicacao.getAnoPublicacao();

		return autores;
	}
}
