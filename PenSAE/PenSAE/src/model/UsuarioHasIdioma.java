package model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the usuario_has_idioma database table.
 * 
 */
@Entity
@Table(name="usuario_has_idioma")
@NamedQuery(name="UsuarioHasIdioma.findAll", query="SELECT u FROM UsuarioHasIdioma u")
public class UsuarioHasIdioma implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private UsuarioHasIdiomaPK id;

	//bi-directional many-to-one association to Idioma
	@ManyToOne
	@JoinColumn(name="idioma_id", nullable=false, insertable=false, updatable=false)
	private Idioma idioma;

	private int score;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="usuario_id", nullable=false, insertable=false, updatable=false)
	private Usuario usuario;

	public UsuarioHasIdioma() {
	}

	public UsuarioHasIdioma(UsuarioHasIdiomaPK phiId, Usuario usuario,
			Idioma idioma, int score) {
		
		this.id = phiId;
		this.usuario = usuario;
		this.idioma = idioma;
		this.score = score;
		
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(UsuarioHasIdioma.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public UsuarioHasIdiomaPK getId() {
		return this.id;
	}

	public Idioma getIdioma() {
		return this.idioma;
	}

	public int getScore() {
		return this.score;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setId(UsuarioHasIdiomaPK id) {
		this.id = id;
	}

	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}