package hpdd.paper;


import hpdd.individual.IndividualPaper;

import java.io.Serializable;
import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name = "symptoms")
public class Symptoms implements Serializable {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "cod_symindpaper", nullable = false)
	private IndividualPaper individualPaper;

	@Column(name = "symptom")
	private String symptom;
	
	@Column(name = "sym_date")
	private String symDate;
	
	@Column(name = "age_first_sym")
	private String ageFirstSym;
	
	private Integer period;
	
	private String type;

	

	public Integer getPeriod() {
		return period;
	}

	public void setPeriod(Integer period) {
		this.period = period;
	}

	public IndividualPaper getIndividualPaper() {
		return individualPaper;
	}

	public void setIndividualPaper(IndividualPaper individualPaper) {
		this.individualPaper = individualPaper;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSymDate() {
		return symDate;
	}

	public void setSymDate(String symDate) {
		this.symDate = symDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((individualPaper == null) ? 0 : individualPaper.hashCode());
		result = prime * result + ((period == null) ? 0 : period.hashCode());
		result = prime * result + ((symDate == null) ? 0 : symDate.hashCode());
		result = prime * result + ((symptom == null) ? 0 : symptom.hashCode());
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
		Symptoms other = (Symptoms) obj;
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
		if (period == null) {
			if (other.period != null)
				return false;
		} else if (!period.equals(other.period))
			return false;
		if (symDate == null) {
			if (other.symDate != null)
				return false;
		} else if (!symDate.equals(other.symDate))
			return false;
		if (symptom == null) {
			if (other.symptom != null)
				return false;
		} else if (!symptom.equals(other.symptom))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}

	public String getAgeFirstSym() {
		return ageFirstSym;
	}

	public void setAgeFirstSym(String ageFirstSym) {
		this.ageFirstSym = ageFirstSym;
	}

}
