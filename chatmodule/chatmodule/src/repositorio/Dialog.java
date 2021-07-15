package repositorio;

public class Dialog {

	public String textUser;
	public String textPatient;
	
	public Dialog(String textUser, String textPatient) {
		this.setTextUser(textUser);
		this.setTextPatient(textPatient);
	}
	
	public void setTextUser(String textUser) {
		this.textUser = textUser;
	}

	public void setTextPatient(String textPatient) {
		this.textPatient = textPatient;
	}

	public String getTextUser() {
		return textUser;
	}
	
	public String getTextPatient() {
		return textPatient;
	}
	
	
}
