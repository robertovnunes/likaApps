package managedBeans;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import fachada.Fachada;

@ManagedBean(eager=true)
@ApplicationScoped
public class InicializacaoBean {
	
	public InicializacaoBean(){
		
		Fachada fachada = Fachada.getInstance();
		fachada.inicializacaoBanco();
	}
}
