package model.curso.matricula.arcomaguerez;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import model.sistema.Arquivo;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="hyperlink")
public class HyperLink implements Serializable{
	
	public int id;
	
	public String titulo;
	public String texto;
	
	public List<Arquivo> imagens;
	public List<Arquivo> documentos;
	
	public HyperLink(){}
	

	public HyperLink(String texto) {
		super();
		this.texto = texto;
	}

	public HyperLink(int id, String texto) {
		super();
		this.id = id;
		this.texto = texto;
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="texto", nullable=true, columnDefinition="TEXT")
	public String getTexto() {
		return texto;
	}


	public void setTexto(String texto) {
		this.texto = texto;
	}

	
	@ManyToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name = "imagens_hyperlink", joinColumns = { @JoinColumn(name = "hyperLinkId") }, inverseJoinColumns = { @JoinColumn(name = "arquivoId") })
	public List<Arquivo> getImagens() {
		return imagens;
	}


	public void setImagens(List<Arquivo> imagens) {
		this.imagens = imagens;
	}

	@ManyToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name = "documentos_hyperlink", joinColumns = { @JoinColumn(name = "hyperLinkId") }, inverseJoinColumns = { @JoinColumn(name = "arquivoId") })
	public List<Arquivo> getDocumentos() {
		return documentos;
	}


	public void setDocumentos(List<Arquivo> documentos) {
		this.documentos = documentos;
	}

	@Column(name="titulo", nullable=true)
	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	@Transient
	public String getTextoResumido(){
		if(getTexto().length() <= 150){
			return this.getTexto().replaceAll("\\<.*?>","");
		}else{
			return this.getTexto().replaceAll("\\<.*?>","").substring(0, 100);
		}
	}
	

}
