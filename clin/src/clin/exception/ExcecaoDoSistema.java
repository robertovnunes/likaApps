/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package clin.exception;

/**
 *
 * @author Marcio
 */
@SuppressWarnings("serial")
public class ExcecaoDoSistema extends Exception{
    public ExcecaoDoSistema(String mensagem){
        super(mensagem);
    }

    public ExcecaoDoSistema(String message, Exception cause) {
		super(message, cause);
	}

}
