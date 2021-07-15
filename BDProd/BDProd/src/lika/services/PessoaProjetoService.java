package lika.services;

import java.util.List;

import lika.model.Aluno;
import lika.model.PessoaProjeto;
import lika.model.Projeto;
import lika.model.ProjetoSimples;

public interface PessoaProjetoService extends CRUDInterface<PessoaProjeto> {

	public List<Aluno> alunoDoProjeto(Projeto p);

	public List<ProjetoSimples> listarProjetosSimples();
}
