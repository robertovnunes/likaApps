package converters;

import genericos.implementacao.FabricaJPADAO;

import javax.faces.bean.ManagedBean;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import model.EstudoCaso;
import dao.EstudocasoDAO;

/**
 * 
 * @author Jesus
 */
@ManagedBean(name = "estudoCasoConverterBean") 
@FacesConverter(value = "estudoCasoConverter")
public class EstudoCasoConverter implements Converter {

	private static EstudocasoDAO dao;

	/**
	 * @param ctx FacesContext
	 * @param component o componente que solicitou o objeto
	 * @param value o valor do toString do objeto solicitado
	 * @return retorno o objeto solicitado
	 */
	@Override
	public Object getAsObject(FacesContext ctx, UIComponent component, String value) {
		
		Object retorno = null;
		if(dao == null){
			dao = FabricaJPADAO.getInstancia().getEstudocasoDAO();
		}
		
		retorno = dao.getPorId(Integer.parseInt(value));
		
		return retorno;
	}

	/**
	 * @param ctx FacesContext
	 * @param component o componente que solicitou o objeto
	 * @param o - o objeto a ser transformado em string
	 * @return retorno a string solicitada
	 */
	@Override
	public String getAsString(FacesContext fc, UIComponent uic, Object o) {
		
		String retorno = "0";
		if(o != null){
			retorno = ((EstudoCaso) o).toString();
		}
		return retorno; 
	}
}
