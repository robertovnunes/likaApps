package hpdd.clinData;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name="clindata")
public class ClinData implements Serializable{

	
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(general) será excluido.
	@JoinColumn(name = "cod_clinData", nullable = false)
	private Notification notification;
	
	@Column(name = "notif_fisrt_sym")
	@Temporal(TemporalType.DATE)
	private Date notifFisrtSym;
	
	private String occupation;
	
	@Column(name = "prog_dementia")
	private String progDementia;
	@Column(name = "visual_disord")
	private String visualDisorder;
	@Column(name = "myoclonus")
	private String myoclonus;
	@Column(name = "cerebellar_disorders")
	private String cerebellarDisorders;
	@Column(name = "persistent_pain_dys")
	private String persistentPainDys;
	@Column(name = "ataxy")
	private String ataxy;
	@Column(name = "pyramidal_signs")
	private String pyramidalSigns;
	@Column(name = "extrapyramidal_signs")
	private String extrapyramidalSigns;
	@Column(name = "akinetic_mutism")
	private String akineticMutism;
	@Column(name = "psychiatric_disorders")
	private String psychiatricDisorders;
	@Column(name = "sleep_disorders")
	private String sleepDisorders;
	public Notification getNotification() {
		return notification;
	}
	public void setNotification(Notification notification) {
		this.notification = notification;
	}
	public Date getNotifFisrtSym() {
		return notifFisrtSym;
	}
	public void setNotifFisrtSym(Date notifFisrtSym) {
		this.notifFisrtSym = notifFisrtSym;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getProgDementia() {
		return progDementia;
	}
	public void setProgDementia(String progDementia) {
		this.progDementia = progDementia;
	}
	public String getVisualDisorder() {
		return visualDisorder;
	}
	public void setVisualDisorder(String visualDisorder) {
		this.visualDisorder = visualDisorder;
	}
	public String getMyoclonus() {
		return myoclonus;
	}
	public void setMyoclonus(String myoclonus) {
		this.myoclonus = myoclonus;
	}
	public String getCerebellarDisorders() {
		return cerebellarDisorders;
	}
	public void setCerebellarDisorders(String cerebellarDisorders) {
		this.cerebellarDisorders = cerebellarDisorders;
	}
	public String getPersistentPainDys() {
		return persistentPainDys;
	}
	public void setPersistentPainDys(String persistentPainDys) {
		this.persistentPainDys = persistentPainDys;
	}
	public String getAtaxy() {
		return ataxy;
	}
	public void setAtaxy(String ataxy) {
		this.ataxy = ataxy;
	}
	public String getPyramidalSigns() {
		return pyramidalSigns;
	}
	public void setPyramidalSigns(String pyramidalSigns) {
		this.pyramidalSigns = pyramidalSigns;
	}
	public String getExtrapyramidalSigns() {
		return extrapyramidalSigns;
	}
	public void setExtrapyramidalSigns(String extrapyramidalSigns) {
		this.extrapyramidalSigns = extrapyramidalSigns;
	}
	public String getAkineticMutism() {
		return akineticMutism;
	}
	public void setAkineticMutism(String akineticMutism) {
		this.akineticMutism = akineticMutism;
	}
	public String getPsychiatricDisorders() {
		return psychiatricDisorders;
	}
	public void setPsychiatricDisorders(String psychiatricDisorders) {
		this.psychiatricDisorders = psychiatricDisorders;
	}
	public String getSleepDisorders() {
		return sleepDisorders;
	}
	public void setSleepDisorders(String sleepDisorders) {
		this.sleepDisorders = sleepDisorders;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((akineticMutism == null) ? 0 : akineticMutism.hashCode());
		result = prime * result + ((ataxy == null) ? 0 : ataxy.hashCode());
		result = prime
				* result
				+ ((cerebellarDisorders == null) ? 0 : cerebellarDisorders
						.hashCode());
		result = prime
				* result
				+ ((extrapyramidalSigns == null) ? 0 : extrapyramidalSigns
						.hashCode());
		result = prime * result
				+ ((myoclonus == null) ? 0 : myoclonus.hashCode());
		result = prime * result
				+ ((notifFisrtSym == null) ? 0 : notifFisrtSym.hashCode());
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime * result
				+ ((occupation == null) ? 0 : occupation.hashCode());
		result = prime
				* result
				+ ((persistentPainDys == null) ? 0 : persistentPainDys
						.hashCode());
		result = prime * result
				+ ((progDementia == null) ? 0 : progDementia.hashCode());
		result = prime
				* result
				+ ((psychiatricDisorders == null) ? 0 : psychiatricDisorders
						.hashCode());
		result = prime * result
				+ ((pyramidalSigns == null) ? 0 : pyramidalSigns.hashCode());
		result = prime * result
				+ ((sleepDisorders == null) ? 0 : sleepDisorders.hashCode());
		result = prime * result
				+ ((visualDisorder == null) ? 0 : visualDisorder.hashCode());
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
		ClinData other = (ClinData) obj;
		if (akineticMutism == null) {
			if (other.akineticMutism != null)
				return false;
		} else if (!akineticMutism.equals(other.akineticMutism))
			return false;
		if (ataxy == null) {
			if (other.ataxy != null)
				return false;
		} else if (!ataxy.equals(other.ataxy))
			return false;
		if (cerebellarDisorders == null) {
			if (other.cerebellarDisorders != null)
				return false;
		} else if (!cerebellarDisorders.equals(other.cerebellarDisorders))
			return false;
		if (extrapyramidalSigns == null) {
			if (other.extrapyramidalSigns != null)
				return false;
		} else if (!extrapyramidalSigns.equals(other.extrapyramidalSigns))
			return false;
		if (myoclonus == null) {
			if (other.myoclonus != null)
				return false;
		} else if (!myoclonus.equals(other.myoclonus))
			return false;
		if (notifFisrtSym == null) {
			if (other.notifFisrtSym != null)
				return false;
		} else if (!notifFisrtSym.equals(other.notifFisrtSym))
			return false;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (occupation == null) {
			if (other.occupation != null)
				return false;
		} else if (!occupation.equals(other.occupation))
			return false;
		if (persistentPainDys == null) {
			if (other.persistentPainDys != null)
				return false;
		} else if (!persistentPainDys.equals(other.persistentPainDys))
			return false;
		if (progDementia == null) {
			if (other.progDementia != null)
				return false;
		} else if (!progDementia.equals(other.progDementia))
			return false;
		if (psychiatricDisorders == null) {
			if (other.psychiatricDisorders != null)
				return false;
		} else if (!psychiatricDisorders.equals(other.psychiatricDisorders))
			return false;
		if (pyramidalSigns == null) {
			if (other.pyramidalSigns != null)
				return false;
		} else if (!pyramidalSigns.equals(other.pyramidalSigns))
			return false;
		if (sleepDisorders == null) {
			if (other.sleepDisorders != null)
				return false;
		} else if (!sleepDisorders.equals(other.sleepDisorders))
			return false;
		if (visualDisorder == null) {
			if (other.visualDisorder != null)
				return false;
		} else if (!visualDisorder.equals(other.visualDisorder))
			return false;
		return true;
	}
	
	
	
}
