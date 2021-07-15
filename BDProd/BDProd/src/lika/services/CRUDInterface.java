/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.services;

import java.util.List;

/**
 * 
 * @author Marcio
 */
public interface CRUDInterface<E> {

	public E salvar(E object);

	public void atualizar(E object);

	public List<E> listar(String parametro, String tipoPesquisa);

	public void excluir(E object);

	public E carregar(E object);

	public void refresh(E object);
}
