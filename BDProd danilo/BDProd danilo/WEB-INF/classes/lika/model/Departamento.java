/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Marcio
 */
@Entity
@Table(name = "departamento")
public class Departamento implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue
    private Integer idDepartamento;
    private String nome;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "departamento")
    private List<Pesquisador> pesquisadores = new ArrayList<Pesquisador>();

    public Integer getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(Integer idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Pesquisador> getPesquisadores() {
        return pesquisadores;
    }

    public void setPesquisadores(List<Pesquisador> pesquisadores) {
        this.pesquisadores = pesquisadores;
    }

    


}
