/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Marcio
 */
@Embeddable
public class PessoaProjetoID implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@ManyToOne
    @JoinColumn(name = "Pessoa_idPessoa")
    private Pessoa pessoa;
    @ManyToOne
    @JoinColumn(name = "Projeto_idProjeto")
    private Projeto projeto;

    public PessoaProjetoID() {
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public Projeto getProjeto() {
        return projeto;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public void setProjeto(Projeto projeto) {
        this.projeto = projeto;
    }
}
