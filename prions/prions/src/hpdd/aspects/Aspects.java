package hpdd.aspects;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
//teste
@SuppressWarnings("serial")
@Entity
@Table(name="aspects")
public class Aspects implements Serializable {
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(general) ser? excluido.
	@JoinColumn(name = "cod_aspects", nullable = false)
	private Notification notification;
	
	private String travel;
	
	@Column(name = "last_trip")
	@Temporal(TemporalType.DATE)
	private Date lastTrip;
	private String country;
	@Column(name = "relative_clin_feat")
	private String relativeClinFeat;
	private String beef;
	private String vegetarian;
	private String duramater;
	private String hgh;
	@Column(name = "cornea_transp")
	private String corneaTransp;
	private String neurosurgery;
	@Column(name = "blood_transf")
	private String bloodTransf;
	public Notification getNotification() {
		return notification;
	}
	public void setNotification(Notification notification) {
		this.notification = notification;
	}
	public String getTravel() {
		return travel;
	}
	public void setTravel(String travel) {
		this.travel = travel;
	}
	public Date getLastTrip() {
		return lastTrip;
	}
	public void setLastTrip(Date lastTrip) {
		this.lastTrip = lastTrip;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getRelativeClinFeat() {
		return relativeClinFeat;
	}
	public void setRelativeClinFeat(String relativeClinFeat) {
		this.relativeClinFeat = relativeClinFeat;
	}
	public String getBeef() {
		return beef;
	}
	public void setBeef(String beef) {
		this.beef = beef;
	}
	public String getVegetarian() {
		return vegetarian;
	}
	public void setVegetarian(String vegetarian) {
		this.vegetarian = vegetarian;
	}
	public String getDuramater() {
		return duramater;
	}
	public void setDuramater(String duramater) {
		this.duramater = duramater;
	}
	public String getHgh() {
		return hgh;
	}
	public void setHgh(String hgh) {
		this.hgh = hgh;
	}
	public String getCorneaTransp() {
		return corneaTransp;
	}
	public void setCorneaTransp(String corneaTransp) {
		this.corneaTransp = corneaTransp;
	}
	public String getNeurosurgery() {
		return neurosurgery;
	}
	public void setNeurosurgery(String neurosurgery) {
		this.neurosurgery = neurosurgery;
	}
	public String getBloodTransf() {
		return bloodTransf;
	}
	public void setBloodTransf(String bloodTransf) {
		this.bloodTransf = bloodTransf;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((beef == null) ? 0 : beef.hashCode());
		result = prime * result
				+ ((bloodTransf == null) ? 0 : bloodTransf.hashCode());
		result = prime * result
				+ ((corneaTransp == null) ? 0 : corneaTransp.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((duramater == null) ? 0 : duramater.hashCode());
		result = prime * result + ((hgh == null) ? 0 : hgh.hashCode());
		result = prime * result
				+ ((lastTrip == null) ? 0 : lastTrip.hashCode());
		result = prime * result
				+ ((neurosurgery == null) ? 0 : neurosurgery.hashCode());
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime
				* result
				+ ((relativeClinFeat == null) ? 0 : relativeClinFeat.hashCode());
		result = prime * result + ((travel == null) ? 0 : travel.hashCode());
		result = prime * result
				+ ((vegetarian == null) ? 0 : vegetarian.hashCode());
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
		Aspects other = (Aspects) obj;
		if (beef == null) {
			if (other.beef != null)
				return false;
		} else if (!beef.equals(other.beef))
			return false;
		if (bloodTransf == null) {
			if (other.bloodTransf != null)
				return false;
		} else if (!bloodTransf.equals(other.bloodTransf))
			return false;
		if (corneaTransp == null) {
			if (other.corneaTransp != null)
				return false;
		} else if (!corneaTransp.equals(other.corneaTransp))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (duramater == null) {
			if (other.duramater != null)
				return false;
		} else if (!duramater.equals(other.duramater))
			return false;
		if (hgh == null) {
			if (other.hgh != null)
				return false;
		} else if (!hgh.equals(other.hgh))
			return false;
		if (lastTrip == null) {
			if (other.lastTrip != null)
				return false;
		} else if (!lastTrip.equals(other.lastTrip))
			return false;
		if (neurosurgery == null) {
			if (other.neurosurgery != null)
				return false;
		} else if (!neurosurgery.equals(other.neurosurgery))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (relativeClinFeat == null) {
			if (other.relativeClinFeat != null)
				return false;
		} else if (!relativeClinFeat.equals(other.relativeClinFeat))
			return false;
		if (travel == null) {
			if (other.travel != null)
				return false;
		} else if (!travel.equals(other.travel))
			return false;
		if (vegetarian == null) {
			if (other.vegetarian != null)
				return false;
		} else if (!vegetarian.equals(other.vegetarian))
			return false;
		return true;
	}
	
	
}
