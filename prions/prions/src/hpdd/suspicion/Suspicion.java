package hpdd.suspicion;

import hpdd.individual.IndividualPaper;
import java.io.Serializable;

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
@Table(name = "suspicion")
public class Suspicion implements Serializable {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@OneToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "cod_suspap", nullable = false)
	private IndividualPaper individualPaper;
	
	@Column(name = "suspect")
	private String suspect;
	
	@Column(name = "second_suspect")
	private String second_suspect;
	
	@Column(name = "criteria")
	private String criteria;
	
	@Column(name = "other")
	private String other;

	

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

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

	public String getSuspect() {
		return suspect;
	}

	public void setSuspect(String suspect) {
		this.suspect = suspect;
	}
	

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((criteria == null) ? 0 : criteria.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((individualPaper == null) ? 0 : individualPaper.hashCode());
		result = prime * result + ((other == null) ? 0 : other.hashCode());
		result = prime * result + ((suspect == null) ? 0 : suspect.hashCode());
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
		Suspicion other = (Suspicion) obj;
		if (criteria == null) {
			if (other.criteria != null)
				return false;
		} else if (!criteria.equals(other.criteria))
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
		if (this.other == null) {
			if (other.other != null)
				return false;
		} else if (!this.other.equals(other.other))
			return false;
		if (suspect == null) {
			if (other.suspect != null)
				return false;
		} else if (!suspect.equals(other.suspect))
			return false;
		return true;
	}

	public String getSecond_suspect() {
		return second_suspect;
	}

	public void setSecond_suspect(String second_suspect) {
		this.second_suspect = second_suspect;
	}
	
}