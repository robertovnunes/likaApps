package hpdd.individual;


import hpdd.notification.Notification;
import java.io.Serializable;
import java.util.Date;
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
@Table(name = "individual")
public class Individual implements Serializable {
	/*@Id
	@GeneratedValue
	@Column(name = "cod_individual")
	private Integer codIndividual;
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE) //se um usuário for excluido seus caso(individual) será excluido.
	@JoinColumn(name = "cod_user", nullable = false)
	private User user;*/
	
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(individual) será excluido.
	@JoinColumn(name = "cod_individual", nullable = false)
	private Notification notification;
	
	
	@Column(name = "date_birth")
	private Date dateBirth;
	
	private Integer age;
	
	@Column(name = "type_age")
	private String typeAge;
	
	private String gender;
	private String pregnant;
	
	@Column(name = "ethnic_group")
	private String ethnicGroup;
	
	private String scholarity;
	
	@Column(name = "card_number")
	private Integer cardNumber;

	@Column(name = "mother_name")
	private String motherName;

	private String state;
	private String cityResidence;
	private String code;
	private String zip;
	private String phone;
	private String zone;
	private String country;
	private String address;
	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCityResidence() {
		return cityResidence;
	}

	public void setCityResidence(String cityResidence) {
		this.cityResidence = cityResidence;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public Date getDateBirth() {
		return dateBirth;
	}

	public void setDateBirth(Date dateBirth) {
		this.dateBirth = dateBirth;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getTypeAge() {
		return typeAge;
	}

	public void setTypeAge(String typeAge) {
		this.typeAge = typeAge;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPregnant() {
		return pregnant;
	}

	public void setPregnant(String pregnant) {
		this.pregnant = pregnant;
	}

	public String getEthnicGroup() {
		return ethnicGroup;
	}

	public void setEthnicGroup(String ethnicGroup) {
		this.ethnicGroup = ethnicGroup;
	}

	public String getScholarity() {
		return scholarity;
	}

	public void setScholarity(String scholarity) {
		this.scholarity = scholarity;
	}

	public Integer getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(Integer cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result
				+ ((cardNumber == null) ? 0 : cardNumber.hashCode());
		result = prime * result
				+ ((cityResidence == null) ? 0 : cityResidence.hashCode());
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((dateBirth == null) ? 0 : dateBirth.hashCode());
		result = prime * result
				+ ((ethnicGroup == null) ? 0 : ethnicGroup.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result
				+ ((motherName == null) ? 0 : motherName.hashCode());
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result
				+ ((pregnant == null) ? 0 : pregnant.hashCode());
		result = prime * result
				+ ((scholarity == null) ? 0 : scholarity.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((typeAge == null) ? 0 : typeAge.hashCode());
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
		Individual other = (Individual) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (cardNumber == null) {
			if (other.cardNumber != null)
				return false;
		} else if (!cardNumber.equals(other.cardNumber))
			return false;
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
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (dateBirth == null) {
			if (other.dateBirth != null)
				return false;
		} else if (!dateBirth.equals(other.dateBirth))
			return false;
		if (ethnicGroup == null) {
			if (other.ethnicGroup != null)
				return false;
		} else if (!ethnicGroup.equals(other.ethnicGroup))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (motherName == null) {
			if (other.motherName != null)
				return false;
		} else if (!motherName.equals(other.motherName))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pregnant == null) {
			if (other.pregnant != null)
				return false;
		} else if (!pregnant.equals(other.pregnant))
			return false;
		if (scholarity == null) {
			if (other.scholarity != null)
				return false;
		} else if (!scholarity.equals(other.scholarity))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (typeAge == null) {
			if (other.typeAge != null)
				return false;
		} else if (!typeAge.equals(other.typeAge))
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
