package managedBeans.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import javax.persistence.ManyToOne;
import javax.servlet.http.HttpServletRequest;

import fachada.Fachada;


@FacesValidator("cadastroValidator")
public class CadastroValidator implements Validator{

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\." +
			"[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*" +
			"(\\.[A-Za-z]{2,})$";

	@ManyToOne
	private Fachada fachada;
	private Matcher matcher;
	private Pattern pattern;

	public CadastroValidator(){
		pattern = Pattern.compile(EMAIL_PATTERN);
		
		fachada = Fachada.getInstance();
	}

	@Override
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {
		
		Object request = FacesContext.getCurrentInstance().getExternalContext().getRequest();
		String requestString;
		if(request instanceof HttpServletRequest){
			
			requestString = ((HttpServletRequest) request).getRequestURL().toString();
			System.out.println(requestString);
		}

		if(component.getId().equalsIgnoreCase("inputText_Email")){
			
			validateEmail(value);
			
		}else if(component.getId().equalsIgnoreCase("inputText_Login")){
			
			validateLogin(value);
		}
	}
	
	private void validateEmail(Object value){
		
		matcher = pattern.matcher(value.toString());
		
		if(!matcher.matches()){

			FacesMessage msg = 
					new FacesMessage("Validação de email falhou.", 
							"Email Inválido");
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(msg);

		}
	}
	
	private void validateLogin(Object value){
		
		if(!fachada.verificarSeLoginJaExiste((String)value)){
			FacesMessage msg = 
					new FacesMessage("Validação de login falhou.", 
							"Login já está sendo usado");
			msg.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(msg);
		}
		
	}
}
