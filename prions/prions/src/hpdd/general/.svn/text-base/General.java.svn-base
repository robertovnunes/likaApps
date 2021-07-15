package hpdd.general;

import hpdd.notification.Notification;
//import hpdd.user.User;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.FetchType;
//import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name = "general")
public class General implements Serializable {

	@Id
	@OneToOne(fetch = FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE)
	// se um paciente for excluido seus caso(general) será excluido.
	@JoinColumn(name = "cod_general", nullable = false)
	private Notification notification;

	@Column(name = "notification_date")
	@Temporal(TemporalType.DATE)
	private Date notifDate;
	@Column(name = "state")
	private String state;
	@Column(name = "city")
	private String city;
	@Column(name = "health_unit")
	private String healthUnit;
	@Column(name = "zone")
	private String zone;
	@Column(name = "country")
	private String country;

	// private User user;

	/*
	 * public User getUser() { return user; } public void setUser(User user) {
	 * this.user = user; }
	 */
	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	/*
	 * public Integer getCodGeneral() { return codGeneral; } public void
	 * setCodGeneral(Integer codGeneral) { this.codGeneral = codGeneral; }
	 */
	/*
	 * public User getUser() { return user; } public void setUser(User user) {
	 * this.user = user; }
	 */
	public Date getNotifDate() {
		return notifDate;
	}

	public void setNotifDate(Date notifDate) {
		this.notifDate = notifDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getHealthUnit() {
		return healthUnit;
	}

	public void setHealthUnit(String healthUnit) {
		this.healthUnit = healthUnit;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((healthUnit == null) ? 0 : healthUnit.hashCode());
		result = prime * result
				+ ((notifDate == null) ? 0 : notifDate.hashCode());
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((zone == null) ? 0 : zone.hashCode());
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
		General other = (General) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (healthUnit == null) {
			if (other.healthUnit != null)
				return false;
		} else if (!healthUnit.equals(other.healthUnit))
			return false;
		if (notifDate == null) {
			if (other.notifDate != null)
				return false;
		} else if (!notifDate.equals(other.notifDate))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (zone == null) {
			if (other.zone != null)
				return false;
		} else if (!zone.equals(other.zone))
			return false;
		return true;
	}

}
