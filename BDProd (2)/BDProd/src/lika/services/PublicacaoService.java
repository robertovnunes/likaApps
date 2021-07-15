package lika.services;

import java.util.List;

import lika.model.AreaDePesquisa;
import lika.model.Autor;
import lika.model.GrupoDePesquisa;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;

public interface PublicacaoService extends CRUDInterface<Publicacao> {

	public List<Autor> listarAutores(Publicacao p);

	public List<Publicacao> listarPublicacoesDaPessoa(Pessoa p);

	public List<Publicacao> listarPublicacaoRelatorio(String anoInicial,
			String anoFinal);

	public List<Publicacao> listarPublicacaoRelatorio(String anoInicial,
			String anoFinal, String tipo);

	public List<Publicacao> publicacoesDaPessoaRelatorio(String anoInicial,
			String anoFinal, Pessoa p, String tipo);

	public List<Publicacao> listarPublicacaoProjetoRelatorio(String anoInicial,
			String anoFinal, Projeto projeto, String tipo);

	public List<Publicacao> listarPublicacaoGrupoRelatorio(String anoInicial,
			String anoFinal, GrupoDePesquisa grupo, String tipo);

	public List<Publicacao> listarPublicacaoAreaDePequisaRelatorio(
			String anoInicial, String anoFinal, AreaDePesquisa area, String tipo);

	public void atualizarAutor(Pessoa object);

}
