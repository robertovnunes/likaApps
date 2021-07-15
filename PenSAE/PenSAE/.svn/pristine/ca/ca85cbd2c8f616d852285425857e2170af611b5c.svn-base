package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the arquivos database table.
 * 
 */
@Entity
@Table(name="arquivos")
@NamedQuery(name="Arquivo.findAll", query="SELECT a FROM Arquivo a")
public class Arquivo implements Serializable {
	private static final long serialVersionUID = 1L;

	public static String adaptaString(String string){
		string =  string.replace(" ", "_")
				.replace('ç', 'c')
				.replace('ã', 'a')
				.replace('à', 'a')
				.replace('á', 'a')
				.replace('â', 'a')
				.replace('é', 'a')
				.replace('è', 'a')
				.replace('ê', 'a')
				.replace('í', 'i')
				.replace('ì', 'i')
				.replace('î', 'i')
				.replace('õ', 'o')
				.replace('ò', 'o')
				.replace('ó', 'o')
				.replace('ô', 'o')
				.replace('ù', 'u')
				.replace('û', 'u')
				.replace('ú', 'u');
		return string;
	}

	@Lob
	@Column(nullable=false)
	private byte[] arquivo;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false)
	private int id_EntidadeMae;

	@Column(nullable=false, length=200)
	private String nomeArquivo;

	@Column(nullable=false)
	private int tipoArquivo;

	public Arquivo() {
	}

	@Override
	public boolean equals(Object obj){
		boolean retorno = false;
		
		if(obj != null){
		
			if(obj.getClass().equals(Arquivo.class) && 
					this.toString().equalsIgnoreCase(obj.toString())){
				
				retorno = true;
			}
		}
		
		return retorno;
	}

	public byte[] getArquivo() {
		return this.arquivo;
	}

	public int getId() {
		return this.id;
	}

	public int getId_EntidadeMae() {
		return this.id_EntidadeMae;
	}

	public String getNomeArquivo() {
		return this.nomeArquivo;
	}

	public int getTipoArquivo() {
		return this.tipoArquivo;
	}

	public void setArquivo(byte[] arquivo) {
		this.arquivo = arquivo;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setId_EntidadeMae(int id_EntidadeMae) {
		this.id_EntidadeMae = id_EntidadeMae;
	}

	public void setNomeArquivo(String nomeArquivo) {
		this.nomeArquivo = nomeArquivo;
	}
	
	public void setTipoArquivo(int tipoArquivo) {
		this.tipoArquivo = tipoArquivo;
	}
	
	public String toString(){
		return String.valueOf(this.id);
	}
}