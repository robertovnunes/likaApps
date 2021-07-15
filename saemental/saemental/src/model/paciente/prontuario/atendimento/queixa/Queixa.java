package model.paciente.prontuario.atendimento.queixa;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="queixadoencaatual")
public class Queixa implements Serializable{

	public int id;
	public String queixaPrincipal;
	public String medicacoes;
	public List<Cid> cids;
	
	public Queixa(){
		cids = new ArrayList<Cid>();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name="atendimentos_cid")
	public List<Cid> getCids() {
		return cids;
	}

	public void setCids(List<Cid> cids) {
		this.cids = cids;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="queixaPrincipal", nullable=true)
	public String getQueixaPrincipal() {
		return queixaPrincipal;
	}

	public void setQueixaPrincipal(String queixaPrincipal) {
		this.queixaPrincipal = queixaPrincipal;
	}

	@Column(name="medicacoes", nullable=true)
	public String getMedicacoes() {
		return medicacoes;
	}

	public void setMedicacoes(String medicacoes) {
		this.medicacoes = medicacoes;
	}
	
	@Override
	public Queixa clone() {
		Queixa clone = new Queixa();
		clone.queixaPrincipal = queixaPrincipal;
		clone.medicacoes = medicacoes;
		for (Cid cid : cids) {
			clone.cids.add(cid.clone());
		}
		return clone;
	}
	
}
