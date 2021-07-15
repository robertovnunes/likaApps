package hpdd.pictures;

import hpdd.individual.IndividualPaper;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name = "picturespaper")
public class PicturesPaper implements Serializable {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(general) será excluido.
	@JoinColumn(name = "cod_picpap", nullable = false)
	private IndividualPaper individualPaper;
	
	@Lob 
	@Column(name = "image", columnDefinition = "LONGBLOB")
	private byte[] imagem;
	@Column(name = "name_image")
	private String name;
	@Column(name = "type_image")
	private String type;
	
	
	public IndividualPaper getIndividualPaper() {
		return individualPaper;
	}
	public void setIndividualPaper(IndividualPaper individualPaper) {
		this.individualPaper = individualPaper;
	}
	public byte[] getImagem() {
		return imagem;
	}
	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + Arrays.hashCode(imagem);
		result = prime * result
				+ ((individualPaper == null) ? 0 : individualPaper.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PicturesPaper other = (PicturesPaper) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (!Arrays.equals(imagem, other.imagem))
			return false;
		if (individualPaper == null) {
			if (other.individualPaper != null)
				return false;
		} else if (!individualPaper.equals(other.individualPaper))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	
	
}
