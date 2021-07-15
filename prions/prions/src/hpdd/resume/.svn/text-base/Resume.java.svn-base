package hpdd.resume;

import java.io.Serializable;

import hpdd.notification.Notification;

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
@Table(name="resume")
public class Resume implements Serializable {
	@Id
	@OneToOne(fetch=FetchType.EAGER)
	@OnDelete(action = OnDeleteAction.CASCADE) //se um paciente for excluido seus caso(general) será excluido.
	@JoinColumn(name = "cod_resume", nullable = false)
	private Notification notification;
	
	private String resume;

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((notification == null) ? 0 : notification.hashCode());
		result = prime * result + ((resume == null) ? 0 : resume.hashCode());
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
		Resume other = (Resume) obj;
		if (notification == null) {
			if (other.notification != null)
				return false;
		} else if (!notification.equals(other.notification))
			return false;
		if (resume == null) {
			if (other.resume != null)
				return false;
		} else if (!resume.equals(other.resume))
			return false;
		return true;
	}
	
}
