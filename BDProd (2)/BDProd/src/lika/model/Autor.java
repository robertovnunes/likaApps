package lika.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name = "autor")
public class Autor implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idAutor = null;
	private int posicao;
	private String nome;
	private String nomePublicacao;
	@OneToOne
	@JoinColumn(name = "Pessoa_idPessoa")
	private Pessoa autorDoLika;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Publicacao_idPublicacao", nullable = false, insertable = false, updatable = false)
	private Publicacao publicacao;

	public int getPosicao() {
		return posicao;
	}

	public void setPosicao(int posicao) {
		this.posicao = posicao;
	}

	public Integer getIdAutor() {
		return idAutor;
	}

	public void setIdAutor(Integer idAutor) {
		this.idAutor = idAutor;
	}

	public Publicacao getPublicacao() {
		return publicacao;
	}

	public void setPublicacao(Publicacao publicacao) {
		this.publicacao = publicacao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	// Para permitir que a atualizaçao no cadastro aparaça aqui
	public String getNomePublicacao() {
		if (this.autorDoLika != null) {
			this.nomePublicacao = this.autorDoLika.getNomePublicacao();
		}

		return nomePublicacao;
	}

	public void setNomePublicacao(String nomePublicacao) {
		this.nomePublicacao = nomePublicacao;
	}

	public Pessoa getAutorDoLika() {
		return autorDoLika;
	}

	public void setAutorDoLika(Pessoa autorDoLika) {
		this.autorDoLika = autorDoLika;
	}

}
