package managedBeans.aluno;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import model.Aluno;
import model.Idioma;
import model.Usuario;
import model.UsuarioHasIdioma;
import model.UsuarioHasIdiomaPK;
import define.Define;
import fachada.Fachada;

/**
 * @author Tiago e Jesus
 *
 */
@ManagedBean(name="perfilAluno")
@ViewScoped
public class PerfilAlunoBean {

	private static Fachada fachada;

	private Aluno aluno;
	public List<String> atividadesSelecionadas;
	private Date dataNascimento;
	private boolean edicaoIdioma = false;
	private String estadoCivil; 
	public String estiloSelecionado;
	public List<String> estrategiasSelecionadas;
	private String existeReprovacao;
	private String experienciaEnfermagem;
	//variaveis auxiliares
	public String experienciaSelecionada;
	private String idadeAnos; 
	private UsuarioHasIdioma idioma = new UsuarioHasIdioma();
	private List<UsuarioHasIdioma> idiomasAluno;
	private List<Idioma> idiomasDisponiveis;
	private String motivado; 
	private String nomeIdioma;
	private String numeroFilhos; 
	private boolean ocultarAtividadesExtra;
	private boolean ocultarEstrategiaEstudo;
	//controle do textArea
	private boolean ocultarExperiencia;
	private boolean ocultarLocalEstudo;
	private boolean ocultarReprovacao;
	private ArrayList<String> opcoesAtividadesExtra = new ArrayList<String>();
	//opcoes
	private ArrayList<String> opcoesEstadoCivil = new ArrayList<String>();

	private ArrayList<String> opcoesEstilosAprendizagem = new ArrayList<String>();
	private ArrayList<String> opcoesEstrategiaEstudo = new ArrayList<String>();
	private ArrayList<String> opcoesexisteReprovacao = new ArrayList<String>();
	private ArrayList<String> opcoesExperienciaEnfermagem = new ArrayList<String>();
	private ArrayList<String> opcoesLocalEstudo = new ArrayList<String>();
	private ArrayList<String> opcoesRendaFamiliar = new ArrayList<String>();
	private ArrayList<String> opcoesSexo = new ArrayList<String>();
	private ArrayList<String> opcoesTipoEstilosAprendizagem = new ArrayList<String>();
	private boolean primeiraVez;
	private String qualAtividadeExtra;

	private String qualEstrategiaEstudar;
	private String qualLocalEstudar;
	private String qualReprovacao;
	private String quantasHorasEstudar;

	private String rendaFamiliar;
	public String reprovacaoSelecionada;
	//respostas checkbox
	private List<String> respostasAtividadesExtra;
	private List<String> respostasEstilosAprendizagem;
	private List<String> respostasEstrategiaEstudo;

	private String respostasLocalEstudo;
	private String senhaAntiga;
	private String senha;
	private String senhaNovamente;
	private String sexo;
	private String tipoEstiloAprendizagem;

	/*
	 * variavel de controle do carregamento das informaçoes do aluno
	 * para garantir que o getAluno só aconteca uma vez
	 */

	private Usuario usuario;

	public PerfilAlunoBean(){

		fachada = Fachada.getInstance();

		primeiraVez = true;

		for (String x : Define.opcoes_estado_civil) {

			opcoesEstadoCivil.add(x);

		}

		for (String x : Define.OPCOES_RENDA_FAMILIA) {

			opcoesRendaFamiliar.add(x);

		}

		for (String x : Define.OPCOES_SEXO) {

			opcoesSexo.add(x);

		}

		for (String x : Define.OPCOES_EXPERIENCIA_ENFERMAGEM) {

			opcoesExperienciaEnfermagem.add(x);

		}

		for (String x : Define.opcoes_experiencia_reprovacao) {

			opcoesexisteReprovacao.add(x);

		}


		for (String x : Define.OPCOES_ATIVIDADE_EXTRA) {

			opcoesAtividadesExtra.add(x);

		}

		for (String x : Define.OPCOES_ESTRATEGIA_ESTUDO) {

			opcoesEstrategiaEstudo.add(x);

		}

		for (String x : Define.OPCOES_LOCAL_ESTUDO) {

			opcoesLocalEstudo.add(x);

		}

		for (String x : Define.OPCOES_TIPO_ESTILOS_APRENDIZAGEM) {

			opcoesTipoEstilosAprendizagem.add(x);

		}

		for (String x : Define.OPCOES_ESTILOS_APRENDIZAGEM) {

			opcoesEstilosAprendizagem.add(x);

		}
	}

	public void adicionarIdioma(){

		Idioma idioma = null;

		if(!this.nomeIdioma.equals("Selecione")){

			boolean achou = false;

			//localizando o idioma correto
			for (Iterator<Idioma> iterator = this.idiomasDisponiveis.iterator(); 

					(iterator.hasNext() && !achou);) {

				Idioma idiomaIterado = (Idioma) iterator.next();

				if(idiomaIterado.getIdioma().equalsIgnoreCase(this.nomeIdioma)){

					idioma = idiomaIterado;
					this.idiomasDisponiveis.remove(idioma);
					achou = true;
				}
			}

			//se localizou entra
			if(idioma != null){

				UsuarioHasIdioma phi = null;
				UsuarioHasIdiomaPK phiId = new UsuarioHasIdiomaPK(this.usuario.getId(), idioma.getId());

				//se for uma edicao ja usa o objeto idioma
				if(this.edicaoIdioma){

					if(this.idioma.getIdioma().getId() != idioma.getId()){
						this.idioma.setIdioma(idioma);
						this.idioma.setId(phiId);
					}
					phi = this.idioma;
					this.edicaoIdioma = false;

				}else{

					phi = new UsuarioHasIdioma(phiId, this.usuario, idioma, this.idioma.getScore());
				}

				if(this.idiomasAluno == null){

					this.idiomasAluno = new ArrayList<UsuarioHasIdioma>();
				}

				this.idiomasAluno.add(phi);

				this.nomeIdioma = "";
				this.idioma = new UsuarioHasIdioma();
			}
		}
	}


	public void decriptAtividades(String atividades){

		int i;
		List<String> lista = new ArrayList<String>();

		if(atividades != null){

			String checkbox[] = atividades.split("\\|");

			if(checkbox[0].equalsIgnoreCase("Não realizo atividades extra-curriculares")){

				lista.add(checkbox[0]);
				this.qualAtividadeExtra = null;

			}else{

				for(i = 0; i < checkbox.length; i++){
					lista.add(checkbox[i]);
				}

				if(checkbox[i-1].startsWith("Outros")){

					lista.remove(i-1);

					String outros[] = checkbox[i-1].split("@");

					lista.add(outros[0]);


					if(outros.length <= 1){
						this.qualAtividadeExtra = null;
					}else{
						this.qualAtividadeExtra = outros[1];
					}
				}
			}
		}

		setRespostasAtividadesExtra(lista);

	}

	public void decriptEstiloAprendizagem(String estiloApredizagem){

		List<String> listaEstilos = new ArrayList<String>();

		if(estiloApredizagem != null){

			String arrayEstilos[] = estiloApredizagem.split(";");

			for(String x : arrayEstilos){

				listaEstilos.add(x);

			}
		}
		setRespostasEstilosAprendizagem(listaEstilos);

	}

	public void decriptEstrategias(String estrategia){

		int i;
		List<String> lista = new ArrayList<String>();

		if(estrategia != null){
			String checkbox[] = estrategia.split("\\|");


			for(i = 0; i < checkbox.length; i++){
				lista.add(checkbox[i]);
			}

			if(checkbox[i-1].startsWith("Outros")){

				lista.remove(i-1);

				String outros[] = checkbox[i-1].split("@");

				lista.add(outros[0]);


				if(outros.length <= 1){
					this.qualEstrategiaEstudar = null;
				}else{
					this.qualEstrategiaEstudar = outros[1];
				}
			}
		}

		setRespostasEstrategiaEstudo(lista);

	}

	public void decriptLocalEstudo(String local){
		
		if(local != null){
			String checkbox[] = local.split("@");

			this.respostasLocalEstudo = checkbox[0];

			if(checkbox.length <= 1){
				this.qualLocalEstudar = null;
			}else{
				this.qualLocalEstudar = checkbox[1];
			}
		}

	}

	public void editarIdioma(UsuarioHasIdioma editar){

		this.nomeIdioma = editar.getIdioma().getIdioma();

		if(this.idiomasAluno != null){

			this.idioma = editar;
			this.idiomasDisponiveis.add(editar.getIdioma());
			this.idiomasAluno.remove(editar);
			this.edicaoIdioma = true;
		}

	}

	public String encriptAtividades(){

		String atividades = "";

		if(this.respostasAtividadesExtra != null){
			if(this.respostasAtividadesExtra.contains(Define.OPCOES_ATIVIDADE_EXTRA[0])){
				this.aluno.setAtividadesExtras(false);
			}else{
				this.aluno.setAtividadesExtras(true);
			}

			Iterator<String> iterator = this.respostasAtividadesExtra.iterator();

			while(iterator.hasNext()){

				String atual = iterator.next();

				if(atual.equalsIgnoreCase("Outros")){
					atividades = atividades + atual + "@" + this.qualAtividadeExtra;
				}else{
					atividades = atividades + atual + "|";
				}
			}

		}

		return atividades;

	}

	public String encriptEstiloAprendizagem(){

		String estiloAprendizagem = "";

		if(this.respostasEstilosAprendizagem != null){

			Iterator<String> iterator = this.respostasEstilosAprendizagem.iterator();

			while(iterator.hasNext()){

				estiloAprendizagem = estiloAprendizagem + iterator.next() + ";";

			}
		}

		return estiloAprendizagem;

	}

	public String encriptEstrategias(){

		String estrategia = "";

		if(this.respostasEstrategiaEstudo != null){

			Iterator<String> iterator = this.respostasEstrategiaEstudo.iterator();

			while(iterator.hasNext()){

				String atual = iterator.next();

				if(atual.equalsIgnoreCase("Outros")){
					estrategia = estrategia + atual + "@" + this.qualEstrategiaEstudar;
				}else{
					estrategia = estrategia + atual + "|";
				}
			}

		}

		return estrategia;

	}

	public String encriptLocalEstudo(){

		String local = "";

		if(this.respostasLocalEstudo != null){

			if(this.respostasLocalEstudo.equalsIgnoreCase("Outros")){

				local = this.respostasLocalEstudo + "@" + this.qualLocalEstudar;

			}else{

				local = this.respostasLocalEstudo;
			}

		}

		return local;

	}

	public void excuirIdioma(UsuarioHasIdioma remover){

		if(this.idiomasAluno != null){
			this.idiomasDisponiveis.add(remover.getIdioma());
			this.idiomasAluno.remove(remover);
		}

	}

	public Aluno getAluno() {
		return aluno;
	}

	public void getAluno(Usuario u){

		if(this.primeiraVez){

			this.usuario = u;

			this.aluno = fachada.getAlunoPorUsuario(this.usuario);

			this.dataNascimento = this.usuario.getDataNascimento();

			try {

				if(this.usuario.getEstadoCivil() > 0){
					this.estadoCivil = Define.decript_opcao_estado(this.usuario.getEstadoCivil());
				}

				if(this.usuario.getNumFilhos() > 0){
					this.numeroFilhos = this.usuario.getNumFilhos() + "";
				}

				if(this.usuario.getRendaFamiliar() > 0){
					this.rendaFamiliar = Define.decript_opcao_renda(this.usuario.getRendaFamiliar());
				}
				if(this.usuario.getSexo() > 0){
					this.sexo = Define.decript_opcao_sexo(this.usuario.getSexo());
				}

				if(this.idiomasDisponiveis == null){
					this.idiomasDisponiveis = fachada.listarIdiomas();
				}

				this.idiomasAluno = fachada.getPessoaHasIdiomaPorPessoa(this.usuario.getId());

				//laco para remover idiomas que o aluno ja possui
				if(this.idiomasAluno != null){
					boolean achouIdioma = false;
					for (Iterator<UsuarioHasIdioma> iterator = this.idiomasAluno.iterator(); iterator
							.hasNext();) {

						UsuarioHasIdioma idiomaAluno = (UsuarioHasIdioma) iterator.next();

						for (Iterator<Idioma> iterator2 = this.idiomasDisponiveis.iterator(); 
								(iterator2.hasNext()&&!achouIdioma);) {

							Idioma idioma = (Idioma) iterator2.next();

							if(idioma.getId() == idiomaAluno.getIdioma().getId()){
								this.idiomasDisponiveis.remove(idioma);
								achouIdioma = true;
							}
						}
						achouIdioma = false;
					}
				}

				if(this.aluno.getPossuiExperiencia() > 0){

					this.experienciaEnfermagem = Define.decript_opcao_experiencia_enfermagem(this.aluno.getPossuiExperiencia());
				}

				if(this.aluno.getExisteReprovacao() != null){

					this.existeReprovacao = Define.decript_opcao_experiencia_reprovacao(this.aluno.getExisteReprovacao());
				}

				decriptAtividades(this.aluno.getQualAtividadesExtras());
				decriptEstrategias(this.aluno.getQualEstrategiaEstudo());
				decriptLocalEstudo(this.aluno.getQualLocalEstudo());

				if(this.aluno.getQuantasHorasEstudo() > 0){
					this.quantasHorasEstudar = this.aluno.getQuantasHorasEstudo() + "";
				}

				this.motivado = this.aluno.getMotivado();

				if(this.aluno.getTipoEstiloAprendizagem() > 0){
					this.tipoEstiloAprendizagem = Define.decript_opcao_tipo_estilo_aprendizagem(this.aluno.getTipoEstiloAprendizagem());
				}

				decriptEstiloAprendizagem(this.aluno.getEstiloAprendizagem());

			}catch (Exception e) {
				e.printStackTrace();
			}

			ocultarQualReprovacao();
			ocultarAtividadesExtra();
			ocultarEstrategiaEstudo();
			ocultarLocalEstudo();

			this.primeiraVez = false;
		}
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public String getExisteReprovacao() {
		return existeReprovacao;
	}

	public String getExperienciaEnfermagem() {
		return experienciaEnfermagem;
	}

	public String getIdadeAnos() {
		return idadeAnos;
	}

	public UsuarioHasIdioma getIdioma() {
		return idioma;
	}

	public List<UsuarioHasIdioma> getIdiomasAluno() {
		return idiomasAluno;
	}

	public List<Idioma> getIdiomasDisponiveis() {
		return idiomasDisponiveis;
	}

	public String getMotivado() {
		return motivado;
	}

	public String getNomeIdioma() {
		return nomeIdioma;
	}

	public String getNumeroFilhos() {
		return numeroFilhos;
	}

	public ArrayList<String> getOpcoesAtividadesExtra() {
		return opcoesAtividadesExtra;
	}

	public ArrayList<String> getOpcoesEstadoCivil() {
		return opcoesEstadoCivil;
	}

	public ArrayList<String> getOpcoesEstilosAprendizagem() {
		return opcoesEstilosAprendizagem;
	}

	public ArrayList<String> getOpcoesEstrategiaEstudo() {
		return opcoesEstrategiaEstudo;
	}

	public ArrayList<String> getOpcoesexisteReprovacao() {
		return opcoesexisteReprovacao;
	}

	public ArrayList<String> getOpcoesExperienciaEnfermagem() {
		return opcoesExperienciaEnfermagem;
	}

	public ArrayList<String> getOpcoesLocalEstudo() {
		return opcoesLocalEstudo;
	}

	public ArrayList<String> getOpcoesRendaFamiliar() {
		return opcoesRendaFamiliar;
	}

	public ArrayList<String> getOpcoesSexo() {
		return opcoesSexo;
	}

	public ArrayList<String> getOpcoesTipoEstilosAprendizagem() {
		return opcoesTipoEstilosAprendizagem;
	}

	public String getQualAtividadeExtra() {
		return qualAtividadeExtra;
	}

	public String getQualEstrategiaEstudar() {
		return qualEstrategiaEstudar;
	}

	public String getQualLocalEstudar() {
		return qualLocalEstudar;
	}

	public String getQualReprovacao() {
		return qualReprovacao;
	}

	public String getQuantasHorasEstudar() {
		return quantasHorasEstudar;
	}

	public String getRendaFamiliar() {
		return rendaFamiliar;
	}

	public List<String> getRespostasAtividadesExtra() {
		return respostasAtividadesExtra;
	}

	public List<String> getRespostasEstilosAprendizagem() {
		return respostasEstilosAprendizagem;
	}

	public List<String> getRespostasEstrategiaEstudo() {
		return respostasEstrategiaEstudo;
	}

	public String getRespostasLocalEstudo() {
		return respostasLocalEstudo;
	}

	public String getSenha() {
		return senha;
	}

	/**
	 * @return the senhaAntiga
	 */
	public String getSenhaAntiga() {
		return senhaAntiga;
	}

	public String getSenhaNovamente() {
		return senhaNovamente;
	}

	public String getSexo() {
		return sexo;
	}

	public String getTipoEstiloAprendizagem() {
		return tipoEstiloAprendizagem;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public boolean isOcultarAtividadesExtra() {
		return ocultarAtividadesExtra;
	}

	public boolean isOcultarEstrategiaEstudo() {
		return ocultarEstrategiaEstudo;
	}

	public boolean isOcultarExperiencia() {
		return ocultarExperiencia;
	}

	public boolean isOcultarLocalEstudo() {
		return ocultarLocalEstudo;
	}

	public boolean isOcultarReprovacao() {
		return ocultarReprovacao;
	}

	public void limparAtividades(){

		if(respostasAtividadesExtra != null){

			if(respostasAtividadesExtra.contains("Não realizo atividades extra-curriculares")){

				this.respostasAtividadesExtra.clear();
				this.respostasAtividadesExtra.add(opcoesAtividadesExtra.get(0));
			}
		}
	}

	public void limparCampos(){

		this.dataNascimento = null;
		this.estadoCivil = "";
		this.numeroFilhos = "";
		this.rendaFamiliar = "";
		this.sexo = "";

		this.nomeIdioma = "";
		this.idioma = new UsuarioHasIdioma();
		this.idiomasDisponiveis = null;
		this.idiomasAluno = null;

		this.experienciaEnfermagem = "";
		this.existeReprovacao = "";
		this.qualReprovacao = "";
		this.qualAtividadeExtra = "";
		this.qualEstrategiaEstudar = "";
		this.qualLocalEstudar = "";
		this.quantasHorasEstudar = "";
		this.motivado = "";

		this.tipoEstiloAprendizagem = "";

		this.primeiraVez = true;
	}

	public void listenerAtividadesExtra(){

		if(this.respostasAtividadesExtra != null){

			atividadesSelecionadas = this.respostasAtividadesExtra;

			if(this.respostasAtividadesExtra.contains("Outros")){
				ocultarAtividadesExtra = false;

			}else{
				this.qualAtividadeExtra = "";
				ocultarAtividadesExtra = true;
			}
		}	
	}

	public void listenerEstiloAprendizagem(){

		List<String> listaEstilos = new ArrayList<String>(this.respostasEstilosAprendizagem);

		int tamanho = this.respostasEstilosAprendizagem.size();

		if(this.estiloSelecionado.equalsIgnoreCase("Único") && tamanho > 1){
			this.respostasEstilosAprendizagem.clear();
			this.respostasEstilosAprendizagem.add(listaEstilos.get(0));

		}else if(this.estiloSelecionado.equalsIgnoreCase("Misto") && tamanho > 2){
			this.respostasEstilosAprendizagem.clear();
			this.respostasEstilosAprendizagem.add(listaEstilos.get(0));
			this.respostasEstilosAprendizagem.add(listaEstilos.get(1));

		}else if(this.estiloSelecionado.equalsIgnoreCase("Balanceado")){
			this.respostasEstilosAprendizagem.clear();
			for (String x : Define.OPCOES_ESTILOS_APRENDIZAGEM) {
				this.respostasEstilosAprendizagem.add(x);
			}
		}

	}

	public void listenerEstrategiaEstudo(){

		if(this.respostasEstrategiaEstudo != null){

			estrategiasSelecionadas = this.respostasEstrategiaEstudo;

			if(this.respostasEstrategiaEstudo.contains("Outros")){
				ocultarEstrategiaEstudo = false;

			}else{
				this.qualEstrategiaEstudar = "";
				ocultarEstrategiaEstudo = true;
			}
		}	
	}

	public void listenerLocalEstudo(){

		if(this.respostasLocalEstudo != null){

			if(this.respostasLocalEstudo.equalsIgnoreCase("Outros")){
				ocultarLocalEstudo = false;

			}else{
				this.qualLocalEstudar = "";
				ocultarLocalEstudo = true;
			}
		}	
	}

	public void listenerReprovacao(){

		if(this.existeReprovacao != null){

			reprovacaoSelecionada = this.existeReprovacao;

			if(this.existeReprovacao.equalsIgnoreCase("Sim")){
				ocultarReprovacao = false;

			}else{

				this.qualReprovacao = "";
				ocultarReprovacao = true;
			}
		}
	}

	public void listenerTipoEstiloAprendizagem(){

		estiloSelecionado = tipoEstiloAprendizagem;

		if(this.tipoEstiloAprendizagem.equalsIgnoreCase("Balanceado")){

			if(respostasEstilosAprendizagem == null){
				respostasEstilosAprendizagem = new ArrayList<String>();
			}

			for (String x : opcoesEstilosAprendizagem) {
				respostasEstilosAprendizagem.add(x);
			}

		}else{

			if(respostasEstilosAprendizagem != null){
				respostasEstilosAprendizagem.clear();
			}
		}
	}

	public void ocultarAtividadesExtra(){

		if(atividadesSelecionadas == null){

			if(this.respostasAtividadesExtra != null){

				if(this.respostasAtividadesExtra.contains("Outros")){
					ocultarAtividadesExtra = false;

				}else{
					this.qualAtividadeExtra = "";
					ocultarAtividadesExtra = true;
				}
			}
		}
	}

	public void ocultarEstrategiaEstudo(){

		if(estrategiasSelecionadas == null){

			if(this.respostasEstrategiaEstudo != null){

				if(this.respostasEstrategiaEstudo.contains("Outros")){
					ocultarEstrategiaEstudo = false;

				}else{
					this.qualEstrategiaEstudar = "";
					ocultarEstrategiaEstudo = true;
				}
			}
		}
	}

	public void ocultarLocalEstudo(){

		if(this.respostasLocalEstudo != null){

			if(this.respostasLocalEstudo.contains("Outros")){
				ocultarLocalEstudo = false;

			}else{
				this.qualLocalEstudar = "";
				ocultarLocalEstudo = true;
			}
		}
	}

	public void ocultarQualReprovacao(){

		if(reprovacaoSelecionada == null){

			if(this.existeReprovacao != null){

				if(this.existeReprovacao.equalsIgnoreCase("Sim")){
					ocultarReprovacao = false;
				}else{
					this.qualReprovacao = "";
					ocultarReprovacao = true;
				}
			}
		}
	}

	public void salvar(){

		if((this.senhaAntiga.equalsIgnoreCase(usuario.getSenha())) &&
				(this.senha != null && this.senhaNovamente != null && !this.senha.equals("") && !this.senhaNovamente.equals("")) &&
				this.senha.equals(this.senhaNovamente))
		{
			usuario.setSenha(senha);
		}

		if(this.dataNascimento != null){
			usuario.setDataNascimento(this.dataNascimento);
		}

		try {

			usuario.setEstadoCivil(Define.encript_opcao_estado_civil(this.estadoCivil));

			usuario.setNumFilhos(Integer.parseInt(this.numeroFilhos));

			usuario.setRendaFamiliar(Define.encript_opcao_renda(this.rendaFamiliar));

			usuario.setSexo(Define.encript_opcao_sexo(this.sexo));

		} catch (Exception e) {
			e.printStackTrace();
		}

		aluno.setUsuario(usuario);

		try {

			aluno.setPossuiExperiencia(Define.encript_opcao_experiencia_enfermagem(this.experienciaEnfermagem));

			aluno.setExisteReprovacao(Define.encript_opcao_experiencia_reprovacao(this.existeReprovacao));

			aluno.setTipoEstiloAprendizagem(Define.encript_opcao_tipo_estilo_aprendizagem(this.tipoEstiloAprendizagem));

		} catch (Exception e) {
			e.printStackTrace();
		}

		aluno.setQualAtividadesExtras(encriptAtividades());
		aluno.setQualEstrategiaEstudo(encriptEstrategias());
		aluno.setQualLocalEstudo(encriptLocalEstudo());
		aluno.setQuantasHorasEstudo(Integer.parseInt(this.quantasHorasEstudar));
		aluno.setEstiloAprendizagem(encriptEstiloAprendizagem());

		fachada.salvarAluno(aluno, idiomasAluno);

		limparCampos();
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public void setExisteReprovacao(String existeReprovacao) {
		this.existeReprovacao = existeReprovacao;
	}

	public void setExperienciaEnfermagem(String experienciaEnfermagem) {
		this.experienciaEnfermagem = experienciaEnfermagem;
	}

	public void setIdadeAnos(String idadeAnos) {
		this.idadeAnos = idadeAnos;
	}


	public void setIdioma(UsuarioHasIdioma idioma) {
		this.idioma = idioma;
	}

	public void setIdiomasAluno(List<UsuarioHasIdioma> idiomasAluno) {
		this.idiomasAluno = idiomasAluno;
	}

	public void setIdiomasDisponiveis(List<Idioma> idiomasDisponiveis) {
		this.idiomasDisponiveis = idiomasDisponiveis;
	}

	public void setMotivado(String motivado) {
		this.motivado = motivado;
	}

	public void setNomeIdioma(String nomeIdioma) {
		this.nomeIdioma = nomeIdioma;
	}

	public void setNumeroFilhos(String numeroFilhos) {
		this.numeroFilhos = numeroFilhos;
	}

	public void setOcultarAtividadesExtra(boolean ocultarAtividadesExtra) {
		this.ocultarAtividadesExtra = ocultarAtividadesExtra;
	}

	public void setOcultarEstrategiaEstudo(boolean ocultarEstrategiaEstudo) {
		this.ocultarEstrategiaEstudo = ocultarEstrategiaEstudo;
	}

	public void setOcultarExperiencia(boolean ocultarExperiencia) {
		this.ocultarExperiencia = ocultarExperiencia;
	}

	public void setOcultarLocalEstudo(boolean ocultarLocalEstudo) {
		this.ocultarLocalEstudo = ocultarLocalEstudo;
	}

	public void setOcultarReprovacao(boolean ocultarReprovacao) {
		this.ocultarReprovacao = ocultarReprovacao;
	}

	public void setOpcoesAtividadesExtra(ArrayList<String> opcoesAtividadesExtra) {
		this.opcoesAtividadesExtra = opcoesAtividadesExtra;
	}

	public void setOpcoesEstadoCivil(ArrayList<String> opcoesEstadoCivil) {
		this.opcoesEstadoCivil = opcoesEstadoCivil;
	}

	public void setOpcoesEstilosAprendizagem(
			ArrayList<String> opcoesEstilosAprendizagem) {
		this.opcoesEstilosAprendizagem = opcoesEstilosAprendizagem;
	}

	public void setOpcoesEstrategiaEstudo(ArrayList<String> opcoesEstrategiaEstudo) {
		this.opcoesEstrategiaEstudo = opcoesEstrategiaEstudo;
	}

	public void setOpcoesexisteReprovacao(ArrayList<String> opcoesexisteReprovacao) {
		this.opcoesexisteReprovacao = opcoesexisteReprovacao;
	}

	public void setOpcoesExperienciaEnfermagem(
			ArrayList<String> opcoesExperienciaEnfermagem) {
		this.opcoesExperienciaEnfermagem = opcoesExperienciaEnfermagem;
	}

	public void setOpcoesLocalEstudo(ArrayList<String> opcoesLocalEstudo) {
		this.opcoesLocalEstudo = opcoesLocalEstudo;
	}

	public void setOpcoesRendaFamiliar(ArrayList<String> opcoesRendaFamiliar) {
		this.opcoesRendaFamiliar = opcoesRendaFamiliar;
	}

	public void setOpcoesSexo(ArrayList<String> opcoesSexo) {
		this.opcoesSexo = opcoesSexo;
	}

	public void setOpcoesTipoEstilosAprendizagem(
			ArrayList<String> opcoesTipoEstilosAprendizagem) {
		this.opcoesTipoEstilosAprendizagem = opcoesTipoEstilosAprendizagem;
	}

	public void setQualAtividadeExtra(String qualAtividadeExtra) {
		this.qualAtividadeExtra = qualAtividadeExtra;
	}

	public void setQualEstrategiaEstudar(String qualEstrategiaEstudar) {
		this.qualEstrategiaEstudar = qualEstrategiaEstudar;
	}

	public void setQualLocalEstudar(String qualLocalEstudar) {
		this.qualLocalEstudar = qualLocalEstudar;
	}

	public void setQualReprovacao(String qualReprovacao) {
		this.qualReprovacao = qualReprovacao;
	}

	public void setQuantasHorasEstudar(String quantasHorasEstudar) {
		this.quantasHorasEstudar = quantasHorasEstudar;
	}

	public void setRendaFamiliar(String rendaFamiliar) {
		this.rendaFamiliar = rendaFamiliar;
	}

	public void setRespostasAtividadesExtra(List<String> respostasAtividadesExtra) {
		this.respostasAtividadesExtra = respostasAtividadesExtra;
	}

	public void setRespostasEstilosAprendizagem(
			List<String> respostasEstilosAprendizagem) {
		this.respostasEstilosAprendizagem = respostasEstilosAprendizagem;
	}

	public void setRespostasEstrategiaEstudo(
			List<String> respostasEstrategiaEstudo) {
		this.respostasEstrategiaEstudo = respostasEstrategiaEstudo;
	}

	public void setRespostasLocalEstudo(String respostasLocalEstudo) {
		this.respostasLocalEstudo = respostasLocalEstudo;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	/**
	 * @param senhaAntiga the senhaAntiga to set
	 */
	public void setSenhaAntiga(String senhaAntiga) {
		this.senhaAntiga = senhaAntiga;
	}

	public void setSenhaNovamente(String senhaNovamente) {
		this.senhaNovamente = senhaNovamente;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public void setTipoEstiloAprendizagem(String estiloAprendizagem) {
		this.tipoEstiloAprendizagem = estiloAprendizagem;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
