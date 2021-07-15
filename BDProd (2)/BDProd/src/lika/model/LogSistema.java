/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lika.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 *
 * @author Marcio
 */
@Entity
@Table(name="logsistema")
public class LogSistema implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue
    private Integer idLogSistema;
    private String acao;
    private String nomeRegistro;
    private String nomeUsuario;
    private String tipoRegistro;

    public String getTipoRegistro() {
        return tipoRegistro;
    }

    public void setTipoRegistro(String tipoRegistro) {
        this.tipoRegistro = tipoRegistro;
    }

    public String getAcao() {
        return acao;
    }

    public Integer getIdLogSistema() {
        return idLogSistema;
    }

    public String getNomeRegistro() {
        return nomeRegistro;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setAcao(String acao) {
        this.acao = acao;
    }

    public void setIdLogSistema(Integer idLogSistema) {
        this.idLogSistema = idLogSistema;
    }

    public void setNomeRegistro(String nomeRegistro) {
        this.nomeRegistro = nomeRegistro;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }



}
