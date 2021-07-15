/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lika.services;

import java.util.List;

import lika.model.Pesquisador;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.Publicacao;

/**
 * 
 * @author Marcio
 */
public interface PesquisadorService extends CRUDInterface<Pesquisador> {

	public List<Projeto> listarProjetosESubProjetos(Pessoa p);

	public String nomeSubProjeto(Pessoa p, Projeto proj);

	public void removerProjeto(Pessoa p, Projeto proj);

	public void refresh(Pesquisador p);

	public Pesquisador tornarAlunoPesquisador(Pesquisador p);
	

}
