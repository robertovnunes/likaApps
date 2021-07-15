package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * The persistent class for the idioma database table.
 * 
 */
@Entity
@Table(name="idioma")
@NamedQuery(name="Idioma.findAll", query="SELECT i FROM Idioma i")
public class Idioma implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=45)
	private String idioma;

	//bi-directional many-to-one association to UsuarioHasIdioma
	@OneToMany(mappedBy="idioma", cascade={CascadeType.ALL})
	private Set<UsuarioHasIdioma> usuarioHasIdiomas;

	public Idioma() {
	}

	public UsuarioHasIdioma addUsuarioHasIdioma(UsuarioHasIdioma usuarioHasIdioma) {
		getUsuarioHasIdiomas().add(usuarioHasIdioma);
		usuarioHasIdioma.setIdioma(this);

		return usuarioHasIdioma;
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Idioma.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public int getId() {
		return this.id;
	}

	public String getIdioma() {
		return this.idioma;
	}

	public Set<UsuarioHasIdioma> getUsuarioHasIdiomas() {
		return this.usuarioHasIdiomas;
	}

	public UsuarioHasIdioma removeUsuarioHasIdioma(UsuarioHasIdioma usuarioHasIdioma) {
		getUsuarioHasIdiomas().remove(usuarioHasIdioma);
		usuarioHasIdioma.setIdioma(null);

		return usuarioHasIdioma;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	public void setUsuarioHasIdiomas(Set<UsuarioHasIdioma> usuarioHasIdiomas) {
		this.usuarioHasIdiomas = usuarioHasIdiomas;
	}
	
	@Override
	public String toString() {
		
		return String.valueOf(this.id);
	}
}