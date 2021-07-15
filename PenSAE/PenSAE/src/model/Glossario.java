package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the glossario database table.
 * 
 */
@Entity
@Table(name="glossario")
@NamedQuery(name="Glossario.findAll", query="SELECT g FROM Glossario g")
public class Glossario implements Serializable {
	private static final long serialVersionUID = 1L;

	//bi-directional many-to-one association to Estudocaso
	@ManyToOne
	@JoinColumn(name="estudocaso_id", nullable=false)
	private EstudoCaso estudocaso;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="usuario_id", nullable=false)
	private Usuario usuario;

	@Column(length=200)
	private String termo;

	@Column(length=500)
	private String definicao;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	public Glossario() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;

		if(obj != null){

			if(obj.getClass().equals(Glossario.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){

				retorno = true;
			}
		}

		return retorno;
	}

	public String getDefinicao() {
		return this.definicao;
	}

	public EstudoCaso getEstudocaso() {
		return this.estudocaso;
	}

	public int getId() {
		return this.id;
	}

	/**
	 * @return the termo
	 */
	public String getTermo() {
		return termo;
	}

	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setDefinicao(String definicao) {
		this.definicao = definicao;
	}

	public void setEstudocaso(EstudoCaso estudocaso) {
		this.estudocaso = estudocaso;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @param termo the termo to set
	 */
	public void setTermo(String termo) {
		this.termo = termo;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {

		return String.valueOf(this.id);
	}
}