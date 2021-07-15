package lika.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class EmailValidator implements Validator {

	public void validate(FacesContext facesContext, UIComponent uIComponent,
			Object object) throws ValidatorException {

		String enteredEmail = (String) object;
		if (enteredEmail == null || enteredEmail == "") {
			return;
		}

		Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
		Matcher m = p.matcher(enteredEmail);

		boolean matchFound = m.matches();

		if (!matchFound) {
			FacesMessage message = new FacesMessage();
			message.setDetail("O campo Email não é um email válido!");
			message.setSummary("O campo Email não é um email válido!");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}
	}
}