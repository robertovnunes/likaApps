package lika.relatorio;

import java.util.Iterator;
import java.util.List;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

import lika.handler.DaoHandler;
import lika.model.Autor;
import lika.model.Pessoa;
import lika.model.Publicacao;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * @author Marcio
 */
public class SubRelatorioPublicacaoDS implements JRDataSource {

	public List<Publicacao> dados;
	public Iterator<Publicacao> iterator;
	public boolean proximo = false;
	public Publicacao publicacaoAtual;

	public SubRelatorioPublicacaoDS(List<Publicacao> dados) {
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
			valor = this.publicacoes(publicacao);
		} else if ("tipo".equals(campo.getName())) {
			valor = publicacao.getTipoPublicacao();
		} else if ("anoPublicacao".equals(campo.getName())) {
			valor = publicacao.getAnoPublicacao();
		} else if ("total".equals(campo.getName())) {
			valor = " " + this.dados.size();
		}
		return valor;
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
		autores = autores + " " + ". In: ";

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
