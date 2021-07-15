package repositorio;

import java.util.Collection;

public class FachadaChat {
    private static FachadaChat fachada;
    private RepositorioChat repositorio;

    static {
        fachada = new FachadaChat();
    }

    private FachadaChat() {
        repositorio = new RepositorioChatCollection();
    }

    public static FachadaChat getInstance() {
        return fachada;
    }

    public void inserir(Dialog dialog) {
        repositorio.inserir(dialog);
    }
    
    public Collection<Dialog> exibirDialogo() {
        return repositorio.exibirDialogo();
    }
	
}
