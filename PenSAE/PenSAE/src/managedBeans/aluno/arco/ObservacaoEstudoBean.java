package managedBeans.aluno.arco;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import model.AlunoEstudoCaso;
import model.Arquivo;
import model.EstudoCaso;
import model.PontoChaveAluno;
import model.Usuario;
import fachada.Fachada;

/**
 * @author Jesus
 *
 */
@ManagedBean(name="ObservacaoEstudo")
@ViewScoped
public class ObservacaoEstudoBean {

	private static Fachada fachada;

	private String determinante;
	private PontoChaveAluno determinanteEditado;
	private List<PontoChaveAluno> determinantes = new ArrayList<PontoChaveAluno>();
	private Arquivo imagem;
	private String justificativa;
	private boolean mostrarLink = false;
	private boolean mostrarMensagem = false;


	public ObservacaoEstudoBean(){
		determinantes = new ArrayList<PontoChaveAluno>();
		fachada = Fachada.getInstance();
	}


	public void downloadImagem(){
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();

		response.reset();

		String nomeArquivo = this.imagem.getNomeArquivo();

		if(nomeArquivo.endsWith(".png")){
			response.setContentType("application/png");
		}else if(nomeArquivo.endsWith(".jpeg")){
			response.setContentType("application/jpeg");
		}else if(nomeArquivo.endsWith(".jpg")){
			response.setContentType("application/jpg");
		}else if(nomeArquivo.endsWith(".bmp")){
			response.setContentType("application/bmp");
		}else if(nomeArquivo.endsWith(".gif")){
			response.setContentType("application/gif");
		}

		response.setHeader("Content-disposition", "attachment; filename=" + this.imagem.getNomeArquivo());

		try {
			OutputStream output = response.getOutputStream();
			output.write(this.imagem.getArquivo());
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		context.responseComplete();
	}

	public void editarDeterminante(PontoChaveAluno determinanteRecebido){

		Iterator<PontoChaveAluno> iterador = this.determinantes.iterator();
		PontoChaveAluno determinanteTemp = new PontoChaveAluno();
		int contador = 0;
		boolean achou = false;

		while(iterador.hasNext() && !achou){

			determinanteTemp = iterador.next();

			if(determinanteTemp.getId() == determinanteRecebido.getId()){

				determinantes.remove(contador);

				this.setDeterminanteEditado(determinanteTemp);

				this.determinante = determinanteTemp.getNome();
				this.justificativa = determinanteTemp.getJustificativa();
				achou = true;

			}else{

				contador += 1;
			}
		}
	}

	public void excluirDeterminante(PontoChaveAluno determinanteRecebido){

		fachada.excluirPontoChaveAluno(determinanteRecebido);
	}

	/**
	 * @return the determinante
	 */
	public String getDeterminante() {
		return determinante;
	}

	public PontoChaveAluno getDeterminanteEditado() {
		return determinanteEditado;
	}


	/**
	 * @return the determinantes
	 */
	public List<PontoChaveAluno> getDeterminantes() {

		if(this.determinantes == null){

			this.determinantes = new ArrayList<PontoChaveAluno>();
		}
		return determinantes;
	}


	/**
	 * @return the imagem
	 */
	public Arquivo getImagem() {
		return imagem;
	}


	/**
	 * @return the imagem
	 */
	public Arquivo getImagem(EstudoCaso ec) {

		this.imagem = fachada.getArquivoPorEstudoCaso(ec);

		return imagem;
	}


	public String getImagemURL(EstudoCaso ec){

		String retorno = "";

		this.imagem = fachada.getArquivoPorEstudoCaso(ec);

		if(this.imagem != null)
		{
			ServletContext sc = (ServletContext) FacesContext.getCurrentInstance()
		            .getExternalContext().getContext();
			
			String nomeArquivo =  this.imagem.getNomeArquivo().replace(" ", "_");

			File file;
			FileOutputStream fos = null;
			try {
				String url = sc.getRealPath("/resources/") + "\\temporario\\"+ ec.getNome().replace(" ", "_") +"\\ImagensObservacao";
				url = url.replace("\\", File.separator);
				file = new File(url); 
				
				if(!file.exists()){
					file.mkdirs();
				}
				
				file = new File(url + File.separator + nomeArquivo);
				
				file.createNewFile();
				
				fos = new FileOutputStream(file); 

				fos.write(this.imagem.getArquivo());

				retorno = "/resources/temporario/"+ ec.getNome().replace(" ", "_") + "/ImagensObservacao/" + this.imagem.getNomeArquivo();
				
				mostrarLink = false;

			} catch (Exception ex) { 

				ex.printStackTrace();
				retorno = "/resources/imagens/imagemCasoDefault.png";
				
				mostrarLink = true;
				
			}finally{
				if(fos != null){
					try {
						fos.close();
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
			}

		}else{
			retorno = "/resources/imagens/imagemCasoDefault.png";
			mostrarLink = true;
		}


		return retorno;
	}


	/**
	 * @return the justificativa
	 */
	public String getJustificativa() {
		return justificativa;
	}

	/**
	 * @param u usuario
	 * @param ec estudo caso
	 */
	public boolean inserirDeterminante(Usuario u, EstudoCaso ec) {

		boolean retorno = false;
		
		if(this.determinante!=null && this.justificativa != null 
				&& !this.determinante.equalsIgnoreCase("") && !this.justificativa.equalsIgnoreCase("")){

			if(this.determinanteEditado == null){
				PontoChaveAluno determinanteLocal = new PontoChaveAluno();
				determinanteLocal.setNome(this.determinante);
				determinanteLocal.setJustificativa(this.justificativa);

				if(this.determinantes == null){

					this.determinantes = new ArrayList<PontoChaveAluno>();
				}
				this.determinantes.add(determinanteLocal);

				this.mostrarMensagem = false;

			}else{

				this.determinanteEditado.setNome(this.determinante);
				this.determinanteEditado.setJustificativa(this.justificativa);

				Iterator<PontoChaveAluno> iterador = this.determinantes.iterator();
				PontoChaveAluno determinanteTemp = new PontoChaveAluno();
				int contador = 0;
				boolean achou = false;

				while(iterador.hasNext() && !achou){

					determinanteTemp = iterador.next();

					if(determinanteTemp.getId() == determinanteEditado.getId()){

						determinantes.remove(contador);

						this.determinantes.add(determinanteEditado);
						achou = true;

					}else{

						contador += 1;
					}
				}
			}

			fachada.salvarPontoChaveAluno(determinantes, u, ec);

			this.determinante = "";
			this.justificativa = "";

			this.determinanteEditado = null;

			this.mostrarMensagem = false;
			retorno = true;

		}else{
			this.mostrarMensagem = true; 
		}
		
		return retorno;

	}

	public boolean isMostrarLink() {
		return mostrarLink;
	}
	
	public boolean isMostrarMensagem() {
		return mostrarMensagem;
	}

	public void limparCampos(){
		this.determinante = "";
		this.justificativa = "";
	}

	public void listarDeterminantes(AlunoEstudoCaso aec){

		if(aec != null){

			this.determinantes = fachada.listarPontoChaveAlunoPorAlunoEstudoCaso(aec);

		}
	}

	/**
	 * @param determinante the determinante to set
	 */
	public void setDeterminante(String determinante) {
		this.determinante = determinante;
	}


	public void setDeterminanteEditado(PontoChaveAluno determinanteEditado) {
		this.determinanteEditado = determinanteEditado;
	}


	/**
	 * @param determinantes the determinantes to set
	 */
	public void setDeterminantes(ArrayList<PontoChaveAluno> determinantes) {

		if(determinantes != null){

			this.determinantes = determinantes;
		}
	}


	/**
	 * @param imagem the imagem to set
	 */
	public void setImagem(Arquivo imagem) {
		this.imagem = imagem;
	}


	/**
	 * @param justificativa the justificativa to set
	 */
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}


	public void setMostrarLink(boolean mostrarLink) {
		this.mostrarLink = mostrarLink;
	}


	public void setMostrarMensagem(boolean mostrarMensagem) {
		this.mostrarMensagem = mostrarMensagem;
	}

}
