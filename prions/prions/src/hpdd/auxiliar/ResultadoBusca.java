package hpdd.auxiliar;

public class ResultadoBusca {
	// public Integer notification;
	// public String pais;
	// private Date creationDate;
	// public String referencia;
	public Integer code;
	public String country;
	public String state;
	public String gender;
	public Integer age;
	public String symptom;
	public long numCases;
	
	public long getNumCases() {
		return numCases;
	}

	public void setNumCases(long numCases) {
		this.numCases = numCases;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	/*
	 * public ResultadoBusca(String pais) { this.pais = pais;
	 * 
	 * }
	 * 
	 * public ResultadoBusca(String pais, Integer notification) { this.pais =
	 * pais; this.notification = notification;
	 * 
	 * }
	 * 
	 * public ResultadoBusca(String pais, Integer notification, String
	 * referencia) { this.pais = pais; this.notification = notification;
	 * this.referencia = referencia;
	 * 
	 * }
	 * 
	 * public ResultadoBusca(String pais, Integer notification, Date
	 * creationDate, String referencia) { this.pais = pais; this.notification =
	 * notification; this.creationDate = creationDate; this.referencia =
	 * referencia;
	 * 
	 * }
	 */

	public Integer getCode() {
		return code;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public ResultadoBusca(Integer code, Integer age, String country, String gender,
			String state) {
		this.code = code;
		this.country = country;
		this.state = state;
		this.gender = gender;
		this.age = age;

	}
	
	public ResultadoBusca( Integer code, String country) {
		this.code = code;
		this.country = country;

	}
	/*
	 * public Integer getNotification() { return notification; }
	 * 
	 * public void setNotification(Integer notification) { this.notification =
	 * notification; }
	 * 
	 * public String getPais() { return pais; }
	 * 
	 * public void setPais(String pais) { this.pais = pais; }
	 * 
	 * public Date getCreationDate() { return creationDate; }
	 * 
	 * public void setCreationDate(Date creationDate) { this.creationDate =
	 * creationDate; }
	 * 
	 * public String getReferencia() { return referencia; }
	 * 
	 * public void setReferencia(String referencia) { this.referencia =
	 * referencia; }
	 */

	public ResultadoBusca() {
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((age == null) ? 0 : age.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
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
		ResultadoBusca other = (ResultadoBusca) obj;
		if (age == null) {
			if (other.age != null)
				return false;
		} else if (!age.equals(other.age))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}

	

}
