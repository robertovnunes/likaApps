package repositorio;

import java.util.ArrayList;
import java.util.Collection;

public class RepositorioChatCollection implements RepositorioChat {
	private Collection<Dialog> repositorio = new ArrayList<Dialog>();
	
	public void inserir(Dialog dialog) {
		repositorio.add(dialog);
	}

	public Collection<Dialog> exibirDialogo() {
		return repositorio;
	}
	
}



