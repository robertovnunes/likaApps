package lika.services;

import java.util.Date;
import java.util.List;

import lika.model.AreaDePesquisa;
import lika.model.GrupoDePesquisa;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;

public interface ProjetoService extends CRUDInterface<Projeto> {

	public List<Pessoa> listarPessoasESubProjetos(Projeto p);

	public String nomeSubProjeto(Pessoa p, Projeto proj);

	public void removerPessoa(Pessoa p, Projeto proj);

	public List<Pessoa> listarPessoas(Projeto p);

	public List<Projeto> listarProjetoRelatorio(Date dataInicio, Date dataFim,
			boolean financiamento, String tipo);

	public List<Projeto> listarProjetoRelatorioData(Date dataInicio,
			Date dataFim);

	public List<Projeto> listarProjetoGrupoRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			GrupoDePesquisa grupo);

	public List<Projeto> listarProjetoResponsavelRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			Pesquisador responsavel);

	public List<Projeto> listarProjetoAreaRelatorio(Date dataInicio,
			Date dataFim, boolean financiamento, String tipo,
			AreaDePesquisa area);

}
