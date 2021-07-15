package hpdd.conclusion;

import java.io.Serializable;
import java.util.Date;

import hpdd.individual.IndividualPaper;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name="conclusionPaper")
public class ConclusionPaper implements Serializable{
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;
	
	@OneToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "cod_conpap", nullable = false)
	private IndividualPaper individualPaper;
	
	@Column(name = "final_diag")
	private String finalDiag;
	private String criteria;
	@Column(name = "evol_case")
	private String evolCase;
	
	@Column(name = "death_date")
	private String deathDate;
	
	@Column(name = "closure_date")
	private Date clousureDate;
	@Column(name = "other")
	private String other;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public IndividualPaper getIndividualPaper() {
		return individualPaper;
	}
	public void setIndividualPaper(IndividualPaper individualPaper) {
		this.individualPaper = individualPaper;
	}
	public String getFinalDiag() {
		return finalDiag;
	}
	public void setFinalDiag(String finalDiag) {
		this.finalDiag = finalDiag;
	}
	
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getEvolCase() {
		return evolCase;
	}
	public void setEvolCase(String evolCase) {
		this.evolCase = evolCase;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	public String getDeathDate() {
		return deathDate;
	}
	public void setDeathDate(String deathDate) {
		this.deathDate = deathDate;
	}
	public Date getClousureDate() {
		return clousureDate;
	}
	public void setClousureDate(Date clousureDate) {
		this.clousureDate = clousureDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((clousureDate == null) ? 0 : clousureDate.hashCode());
		result = prime * result
				+ ((criteria == null) ? 0 : criteria.hashCode());
		result = prime * result
				+ ((deathDate == null) ? 0 : deathDate.hashCode());
		result = prime * result
				+ ((evolCase == null) ? 0 : evolCase.hashCode());
		result = prime * result
				+ ((finalDiag == null) ? 0 : finalDiag.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((individualPaper == null) ? 0 : individualPaper.hashCode());
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
		ConclusionPaper other = (ConclusionPaper) obj;
		if (clousureDate == null) {
			if (other.clousureDate != null)
				return false;
		} else if (!clousureDate.equals(other.clousureDate))
			return false;
		if (criteria == null) {
			if (other.criteria != null)
				return false;
		} else if (!criteria.equals(other.criteria))
			return false;
		if (deathDate == null) {
			if (other.deathDate != null)
				return false;
		} else if (!deathDate.equals(other.deathDate))
			return false;
		if (evolCase == null) {
			if (other.evolCase != null)
				return false;
		} else if (!evolCase.equals(other.evolCase))
			return false;
		if (finalDiag == null) {
			if (other.finalDiag != null)
				return false;
		} else if (!finalDiag.equals(other.finalDiag))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (individualPaper == null) {
			if (other.individualPaper != null)
				return false;
		} else if (!individualPaper.equals(other.individualPaper))
			return false;
		return true;
	}
	
}
