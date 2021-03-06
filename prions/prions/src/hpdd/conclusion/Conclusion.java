package hpdd.conclusion;

import java.io.Serializable;
import java.util.Date;

import hpdd.notification.Notification;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name="conclusion")
public class Conclusion implements Serializable{

	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(general) ser� excluido.
	@JoinColumn(name = "cod_conclusion", nullable = false)
	private Notification notification;
	@Column(name = "final_diag")
	private String finalDiag;
	private String criteria;
	@Column(name = "evol_case")
	private String evolCase;
	@Column(name = "death_date")
	private Date deathDate;
	@Column(name = "closure_date")
	private Date clousureDate;
	
	
	
	public Notification getNotification() {
		return notification;
	}
	public void setNotification(Notification notification) {
		this.notification = notification;
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
	
	public Date getDeathDate() {
		return deathDate;
	}
	public void setDeathDate(Date deathDate) {
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
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
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
		Conclusion other = (Conclusion) obj;
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
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		return true;
	}
	
}
