package hpdd.residential;

import hpdd.notification.Notification;
import java.io.Serializable;

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
@Table(name = "residential")
public class Residential implements Serializable {
	/*@Id
	@GeneratedValue
	@Column(name = "cod_residential")
	private Integer codResidential;
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.NO_ACTION) //se um usuário for excluido seus caso(residential) será excluido.
	@JoinColumn(name = "cod_user", nullable = false)
	private User user;*/
	
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(residential) será excluido.
	@JoinColumn(name = "cod_residential", nullable = false)
	private Notification notification;
	
	@Column(name = "city_residence")
	private String cityResidence;
	
	private String state;
	private String code;
	private String district;
	private String neighborhood;
	private String sidewalk;
	private Integer number;
	private String complement;
	@Column(name = "geo_coordinates")
	private String geoCoordinates;
	private String zip;
	private String phone;
	private String zone;
	private String country;
	public Notification getNotification() {
		return notification;
	}
	public void setNotification(Notification notification) {
		this.notification = notification;
	}
	public String getCityResidence() {
		return cityResidence;
	}
	public void setCityResidence(String cityResidence) {
		this.cityResidence = cityResidence;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getNeighborhood() {
		return neighborhood;
	}
	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}
	public String getSidewalk() {
		return sidewalk;
	}
	public void setSidewalk(String sidewalk) {
		this.sidewalk = sidewalk;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getComplement() {
		return complement;
	}
	public void setComplement(String complement) {
		this.complement = complement;
	}
	public String getGeoCoordinates() {
		return geoCoordinates;
	}
	public void setGeoCoordinates(String geoCoordinates) {
		this.geoCoordinates = geoCoordinates;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
		result = prime * result
				+ ((cityResidence == null) ? 0 : cityResidence.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result
				+ ((complement == null) ? 0 : complement.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((district == null) ? 0 : district.hashCode());
		result = prime * result
				+ ((geoCoordinates == null) ? 0 : geoCoordinates.hashCode());
		result = prime * result
				+ ((neighborhood == null) ? 0 : neighborhood.hashCode());
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result
				+ ((sidewalk == null) ? 0 : sidewalk.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((zip == null) ? 0 : zip.hashCode());
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
		Residential other = (Residential) obj;
		if (cityResidence == null) {
			if (other.cityResidence != null)
				return false;
		} else if (!cityResidence.equals(other.cityResidence))
			return false;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (complement == null) {
			if (other.complement != null)
				return false;
		} else if (!complement.equals(other.complement))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (district == null) {
			if (other.district != null)
				return false;
		} else if (!district.equals(other.district))
			return false;
		if (geoCoordinates == null) {
			if (other.geoCoordinates != null)
				return false;
		} else if (!geoCoordinates.equals(other.geoCoordinates))
			return false;
		if (neighborhood == null) {
			if (other.neighborhood != null)
				return false;
		} else if (!neighborhood.equals(other.neighborhood))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (sidewalk == null) {
			if (other.sidewalk != null)
				return false;
		} else if (!sidewalk.equals(other.sidewalk))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (zip == null) {
			if (other.zip != null)
				return false;
		} else if (!zip.equals(other.zip))
			return false;
		if (zone == null) {
			if (other.zone != null)
				return false;
		} else if (!zone.equals(other.zone))
			return false;
		return true;
	}
	
		
}