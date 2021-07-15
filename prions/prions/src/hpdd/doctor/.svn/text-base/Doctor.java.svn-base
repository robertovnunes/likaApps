package hpdd.doctor;
import java.io.Serializable;
import java.util.*;

import javax.persistence.*;

@SuppressWarnings("serial")
@Entity
@Table(name="doctor")
public class Doctor implements Serializable {
	@Id
	@GeneratedValue
	private Integer iduser;
	private String name;
	private String occupation;
	private String institute;
	private String document;
	private String gender;
	private String direction;
	private String country;
	private String city;
	private String phone;
	@Column(name = "email", updatable = true)
	private String email;
	private String password;
	private Boolean status;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_reg", updatable = false)
	private Date date_reg;
	
	@ElementCollection(targetClass = String.class)
	@JoinTable(
			name="doctor_permission",
			uniqueConstraints = {@UniqueConstraint(columnNames = {"doctor","permission"})},
			joinColumns = @JoinColumn(name = "doctor"))
	@Column(name = "permission", length=50)
	private Set<String> permission = new HashSet<String>();
	

	public Integer getIduser() {
		return iduser;
	}
	public Set<String> getPermisson() {
		return permission;
	}
	public void setPermisson(Set<String> permisson) {
		this.permission = permisson;
	}
	public void setIduser(Integer iduser) {
		this.iduser = iduser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	public String getDocument() {
		return document;
	}
	public void setDocument(String document) {
		this.document = document;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Date getDate_reg() {
		return date_reg;
	}
	public void setDate_reg(Date date_reg) {
		this.date_reg = date_reg;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result
				+ ((date_reg == null) ? 0 : date_reg.hashCode());
		result = prime * result
				+ ((direction == null) ? 0 : direction.hashCode());
		result = prime * result
				+ ((document == null) ? 0 : document.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((iduser == null) ? 0 : iduser.hashCode());
		result = prime * result
				+ ((institute == null) ? 0 : institute.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((occupation == null) ? 0 : occupation.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((permission == null) ? 0 : permission.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Doctor other = (Doctor) obj;
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
		if (date_reg == null) {
			if (other.date_reg != null)
				return false;
		} else if (!date_reg.equals(other.date_reg))
			return false;
		if (direction == null) {
			if (other.direction != null)
				return false;
		} else if (!direction.equals(other.direction))
			return false;
		if (document == null) {
			if (other.document != null)
				return false;
		} else if (!document.equals(other.document))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (iduser == null) {
			if (other.iduser != null)
				return false;
		} else if (!iduser.equals(other.iduser))
			return false;
		if (institute == null) {
			if (other.institute != null)
				return false;
		} else if (!institute.equals(other.institute))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (occupation == null) {
			if (other.occupation != null)
				return false;
		} else if (!occupation.equals(other.occupation))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (permission == null) {
			if (other.permission != null)
				return false;
		} else if (!permission.equals(other.permission))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	
}
