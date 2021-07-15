package repositorio;

import java.util.Collection;


public interface RepositorioChat {

	public void inserir(Dialog dialog);
	public Collection<Dialog> exibirDialogo();

}
