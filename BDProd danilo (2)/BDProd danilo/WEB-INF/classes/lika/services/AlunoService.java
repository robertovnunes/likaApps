package lika.services;

import java.util.Date;
import java.util.List;

import lika.model.Aluno;
import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;

public interface AlunoService extends CRUDInterface<Aluno> {

	public List<Projeto> listarProjetosESubProjetos(Pessoa p);

	public String nomeSubProjeto(Pessoa p, Projeto proj);

	public void removerProjeto(Pessoa p, Projeto proj);

	public void refresh(Aluno p);

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal,
			String situacao);

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal,
			String tipo, String situacao);

	public List<Aluno> listarAlunosRelatorio(Date anoInicial, Date anoFinal,
			Pesquisador p, String tipo, String situacao);

}
