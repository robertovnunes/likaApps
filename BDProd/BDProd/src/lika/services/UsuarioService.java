/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.services;

import lika.model.Usuario;

/**
 * 
 * @author Marcio
 */
public interface UsuarioService extends CRUDInterface<Usuario> {

	public Usuario autenticarUsuario(Usuario ex);

	public String getSenhaUsuario(Usuario ex);

}
