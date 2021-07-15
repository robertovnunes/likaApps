package lika.services;

import java.util.List;

import lika.model.BolsistaProjeto;
import lika.model.Pessoa;
import lika.model.Projeto;

public interface BolsistaProjetoService extends CRUDInterface<BolsistaProjeto> {

	public List<Projeto> listarProjetosESubProjetos(Pessoa p);

	public String nomeSubProjeto(Pessoa p, Projeto proj);

	public void removerProjeto(Pessoa p, Projeto proj);

	public void refresh(BolsistaProjeto p);
}
