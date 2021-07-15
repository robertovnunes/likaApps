package hpdd.paper;

import hpdd.notification.Notification;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
@Table(name = "paper")
public class Paper implements Serializable {

	
	@ManyToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "cod_paper", nullable = false)
	private Notification notification;

	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@Column(name = "paper_date")
	@Temporal(TemporalType.DATE)
	private Date paperDate;

	private String title;

	@Column(name = "country")
	private String country;

	@Column(name = "doi")
	private String DOI;

	@Column(name = "link")
	private String link;

	@Column(name = "ativo")
	private Boolean ativo;
	/*@Column(name = "eeg")
	private String EEG;

	@Column(name = "result_eeg")
	private String Res_EEG;

	@Column(name = "mri")
	private String MRI;

	@Column(name = "result_mri")
	private String Res_MRI;

	@Column(name = "prot14_3")
	private String prot14_3;

	@Column(name = "result_prot14_3")
	private String Res_prot14_3;

	@Column(name = "genetic")
	private String genetic;

	@Column(name = "result_genetic")
	private String resGenetic;

	@Column(name = "necropsy")
	private String necropsy;

	@Column(name = "result_necropsy")
	private String resNecropsy;*/

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getPaperDate() {
		return paperDate;
	}

	public void setPaperDate(Date paperDate) {
		this.paperDate = paperDate;
	}

	

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}



	public String getDOI() {
		return DOI;
	}

	public void setDOI(String dOI) {
		DOI = dOI;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((DOI == null) ? 0 : DOI.hashCode());
	result = prime * result + ((ativo == null) ? 0 : ativo.hashCode());
	result = prime * result + ((country == null) ? 0 : country.hashCode());
	result = prime * result + ((id == null) ? 0 : id.hashCode());
	result = prime * result + ((link == null) ? 0 : link.hashCode());
	result = prime * result
			+ ((notification == null) ? 0 : notification.hashCode());
	result = prime * result + ((paperDate == null) ? 0 : paperDate.hashCode());
	result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Paper other = (Paper) obj;
		if (DOI == null) {
			if (other.DOI != null)
				return false;
		} else if (!DOI.equals(other.DOI))
			return false;
		if (ativo == null) {
			if (other.ativo != null)
				return false;
		} else if (!ativo.equals(other.ativo))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (link == null) {
			if (other.link != null)
				return false;
		} else if (!link.equals(other.link))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (paperDate == null) {
			if (other.paperDate != null)
				return false;
		} else if (!paperDate.equals(other.paperDate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

}
