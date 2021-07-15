/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

/**
 *
 * @author Marcio
 */
@Entity
@Table(name = "pessoaprojeto")
@AssociationOverrides({
    @AssociationOverride(name = "id.pessoa", joinColumns =
    @JoinColumn(name = "Pessoa_idPessoa")),
    @AssociationOverride(name = "id.projeto", joinColumns =
    @JoinColumn(name = "Projeto_idProjeto"))
})
public class PessoaProjeto implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
    private PessoaProjetoID id;
    private String nomeSubProjeto;

    public PessoaProjeto() {
    }

    public PessoaProjetoID getId() {
        return id;
    }

    public String getNomeSubProjeto() {
        return nomeSubProjeto;
    }

    public void setId(PessoaProjetoID id) {
        this.id = id;
    }

    public void setNomeSubProjeto(String nomeSubProjeto) {
        this.nomeSubProjeto = nomeSubProjeto;
    }
}
