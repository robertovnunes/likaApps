package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * The primary key class for the usuario_has_idioma database table.
 * 
 */
@Embeddable
public class UsuarioHasIdiomaPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="idioma_id", unique=true, nullable=false)
	private int idiomaId;

	@Column(name="usuario_id", unique=true, nullable=false)
	private int usuarioId;

	public UsuarioHasIdiomaPK() {
	}
	public UsuarioHasIdiomaPK(int idUsuario, int idIdioma) {
		this.idiomaId = idIdioma;
		this.usuarioId = idUsuario;
	}
	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof UsuarioHasIdiomaPK)) {
			return false;
		}
		UsuarioHasIdiomaPK castOther = (UsuarioHasIdiomaPK)other;
		return 
			(this.usuarioId == castOther.usuarioId)
			&& (this.idiomaId == castOther.idiomaId);
	}
	public int getIdiomaId() {
		return this.idiomaId;
	}
	public int getUsuarioId() {
		return this.usuarioId;
	}
	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.usuarioId;
		hash = hash * prime + this.idiomaId;
		
		return hash;
	}

	public void setIdiomaId(int idiomaId) {
		this.idiomaId = idiomaId;
	}

	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.hashCode());
	}
}