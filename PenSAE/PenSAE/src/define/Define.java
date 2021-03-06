/**
 * 
 */
package define;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 * @author Jesus
 *
 */

@ManagedBean(name="define")
@SessionScoped
public class Define {

	//Os tipos de arquivos
	public static int ARQUIVO_TIPO_PROGRAMACAO_CURSO = 1;
	public static int ARQUIVO_TIPO_IMAGEM_ESTUDO_CASO = 2;
	public static int ARQUIVO_TIPO_REFERENCIAS_ESTUDO_CASO = 3;
	//Mensagens de Erro de Cadastro
	public static String CADASTRO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO = "Preencha todos os campos do cadastro. Se não for apresentado nenhum curso, aguarde";
	public static String CADASTRO_MENSAGEM_ERRO_CADASTRO_LOGIN = "Seu cadastro não foi aceito, escolha outro login.";
	public static String CRIAR_CASO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO = "Preencha todos os campos do caso";
	//Mensagens de Erro de Cadastro
	public static String CRIAR_CURSO_MENSAGEM_ERRO_CADASTRO_INCOMPLETO = "Preencha todos os campos do curso";
	public static String CRIAR_CURSO_MENSAGEM_ERRO_CADASTRO_NOME = "Já existe um curso cadastrado com mesmo nome, escolha outro";
	public static int EDICAO_PONTOS_CHAVE_PROFESSOR = 1;
	//Mensagens de Erro de Arquivo
	public static String MENSAGEM_ERRO_ARQUIVO_EXTENSAO = "Extensão não aceita. Insira um arquivo com uma das extensões especificadas";
	public static String MENSAGEM_ERRO_ARQUIVO_FALHA_DOWNLOAD = "Falha no download do arquivo. Tente novamente";
	public static String MENSAGEM_ERRO_ARQUIVO_FALHA_UPLOAD = "Falha no upload do arquivo. Tente novamente";
	public static String MENSAGEM_ERRO_ARQUIVO_TAMANHO_EXCEDIDO = "Tamanho máximo excedido";
	//todos os eixos da CIPE
	public static String EIXO_ACAO = "A";
	public static String EIXO_CLIENTE = "C";
	public static String EIXO_FOCO = "F";
	public static String EIXO_JULGAMENTO = "J";
	public static String EIXO_LOCALIZACAO = "L";
	public static String EIXO_MEIO = "M";
	public static String EIXO_TEMPO = "T";
	//Esperando uma resposta de Roseane sobre o que são esses eixos
	//public static String eixo_ = "IC";
	//public static String eixo_ = "DC";
	//Status do avanço na mediação dos pontos chave
	public static int ESCOLHA_PONTOS_CHAVE_ALUNO = 0;
	public static String ESTADO_CIVIL_INVALIDO = "estado_civil_invalido";
	//Status do avanco do aluno no estudo de caso
	public static String ESTUDO_CASO_STATUS_FINALIZADO = "Finalizado";
	public static String ESTUDO_CASO_STATUS_NAO_FINALIZADO = "Não finalizado";

	public static String ESTUDO_CASO_STATUS_NAO_INICIADO = "Não iniciado";
	public static String EXPERIENCIA_INVALIDA = "experiencia_invalida";
	//Numeros equivalentes as fases do arco
	public static int FASE_ARCO_OBSERVACAO = 0;
	public static int FASE_ARCO_PLANO = 2;
	public static int FASE_ARCO_TEORIZACAO = 1;
	//dados invalidos
	public static short INVALIDO = -1;
	//Página inicial para redirecionar quando for verificado que não está logado
	public static String LOGON_FAIL_REDIRECT_PAGE = "/PenSAE/pages/logon.jsf";
	//Mensagens de Erro de Logon
	public static String LOGON_MENSAGEM_ERRO_LOGON_ERRADO = "Login e/ou Senha incorreto(s)! Tente novamente";
	public static String LOGON_MENSAGEM_ERRO_LOGON_LIBERACAO = "Seu cadastro ainda não foi liberado. Aguarde a liberação do administrador";
	//Mensagem de Erro de BD
	public static String MENSAGEM_ERRO_FALHA_BD = "Falha no Banco de dados. Avise um administrador";
	public static String OBSERVACAO_REALIDADE_MENSAGEM_ERRO_DETERMINANTE_BD = "Ocorreu um erro imprevisto. Contate o administrador";
	//Mensagens de Erro de Observação estudo
	public static String OBSERVACAO_REALIDADE_MENSAGEM_ERRO_DETERMINANTE_INCOMPLETO = "Preencha todos os campos do determinante";

	//OPCAO OUTROS
	private static String OPCAO_OUTROS = "Outros";
	//SELECIONE SEMPRE SERA 0
	private static String SELECIONE = "Selecione";
	//OPCOES EXPERIENCIA/REPROVACAO
	private static String OPCAO_NAO = "Não";
	@SuppressWarnings("unused")
	private static short OPCAO_NAO_SHORT = 1;
	private static String OPCAO_SIM = "Sim";
	@SuppressWarnings("unused")
	private static short OPCAO_SIM_SHORT = 2;
	public static String[] opcoes_experiencia_reprovacao = {SELECIONE, OPCAO_NAO, OPCAO_SIM};

	//OPCOES ATIVIDADES EXTRAS
	private static String OPCAO_ATIVIDADE_EXTRA_NAO = "Não realizo atividades extra-curriculares";
	private static String OPCAO_ATIVIDADE_EXTRA_CLUBE = "Clube de Revista";
	private static String OPCAO_ATIVIDADE_EXTRA_CONGRESSO = "Congresso/Seminário/Encontro";
	private static String OPCAO_ATIVIDADE_EXTRA_ESTAGIO = "Estágio Prático";
	private static String OPCAO_ATIVIDADE_EXTRA_EXTENSAO = "Projeto de Extensão";
	private static String OPCAO_ATIVIDADE_EXTRA_INICIACAO = "Iniciação Cientifica";
	private static String OPCAO_ATIVIDADE_EXTRA_INTERCAMBIO = "Intercâmbio Universitário";
	private static String OPCAO_ATIVIDADE_EXTRA_MONITORIA = "Monitoria";
	public static String ATIVIDADE_INVALIDA = "atividade_invalida";
	public static String[] OPCOES_ATIVIDADE_EXTRA = {OPCAO_ATIVIDADE_EXTRA_NAO, 
		OPCAO_ATIVIDADE_EXTRA_MONITORIA, OPCAO_ATIVIDADE_EXTRA_EXTENSAO,
		OPCAO_ATIVIDADE_EXTRA_INICIACAO, OPCAO_ATIVIDADE_EXTRA_CLUBE,
		OPCAO_ATIVIDADE_EXTRA_ESTAGIO, OPCAO_ATIVIDADE_EXTRA_CONGRESSO,
		OPCAO_ATIVIDADE_EXTRA_INTERCAMBIO, OPCAO_OUTROS};

	//OPCOES ESTADO CIVIL
	private static String OPCAO_ESTADO_CIVIL_CASADA = "Casada(o)";
	private static short OPCAO_ESTADO_CIVIL_CASADA_SHORT = 1;
	private static String OPCAO_ESTADO_CIVIL_DIVORCIADA = "Divorciada(o)";
	private static short OPCAO_ESTADO_CIVIL_DIVORCIADA_SHORT = 2;
	private static String OPCAO_ESTADO_CIVIL_SOLTEIRA = "Solteira(o)";
	private static short OPCAO_ESTADO_CIVIL_SOLTEIRA_SHORT = 3;
	private static String OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL = "União Estável";
	private static short OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL_SHORT = 4;
	private static String OPCAO_ESTADO_CIVIL_VIUVA = "Viuva(o)";
	private static short OPCAO_ESTADO_CIVIL_VIUVA_SHORT = 5;
	public static String[] opcoes_estado_civil = {SELECIONE, OPCAO_ESTADO_CIVIL_CASADA,
		OPCAO_ESTADO_CIVIL_DIVORCIADA, OPCAO_ESTADO_CIVIL_SOLTEIRA, OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL,
		OPCAO_ESTADO_CIVIL_VIUVA};

	//OPCOES ESTILOS DE APRENDIZAGEM
	private static String OPCAO_ESTILO_ACOMODADOR = "Estilo acomodador";
	private static String OPCAO_ESTILO_ASSIMILADOR = "Estilo assimilador";
	private static String OPCAO_ESTILO_CONVERGENTE = "Estilo convergente";
	private static String OPCAO_ESTILO_DIVERGENTE = "Estilo divergente";
	public static String[] OPCOES_ESTILOS_APRENDIZAGEM = {OPCAO_ESTILO_DIVERGENTE, 
		OPCAO_ESTILO_ASSIMILADOR, OPCAO_ESTILO_CONVERGENTE, OPCAO_ESTILO_ACOMODADOR};
	public static String TIPO_ESTILO_APRENDIZAGEM_INVALIDO = "Tipo de estilo de aprendizagem invalido";

	//OPCOES ESTRATEGIA ESTUDO
	private static String OPCAO_ESTRATEGIA_ESTUDO_ANOTACOES = "Revê anotações após a aula";
	private static String OPCAO_ESTRATEGIA_ESTUDO_ASSOCIA = "Associa os conteúdos ministrados com experiências anteriores";
	private static String OPCAO_ESTRATEGIA_ESTUDO_DISCUSSAO = "Realiza discussão de grupo sobre o conteúdo ministrado";
	private static String OPCAO_ESTRATEGIA_ESTUDO_EXERCICIOS = "Resolve exercícios";
	private static String OPCAO_ESTRATEGIA_ESTUDO_GRAFICOS = "Faz gráficos, diagramas, desenhos";
	private static String OPCAO_ESTRATEGIA_ESTUDO_INTERNET = "Utiliza internet e softwares educativos";
	private static String OPCAO_ESTRATEGIA_ESTUDO_MAPA = "Constrói mapas conceituais";
	private static String OPCAO_ESTRATEGIA_ESTUDO_PROFESSOR = "Procura o professor/tutor para esclarecer as dúvidas";
	private static String OPCAO_ESTRATEGIA_ESTUDO_RESUMO = "Faz resumo dos assuntos";
	private static String OPCAO_ESTRATEGIA_ESTUDO_VIDEOS = "Asiste a vídeos educativos";
	public static String[] OPCOES_ESTRATEGIA_ESTUDO = {OPCAO_ESTRATEGIA_ESTUDO_RESUMO,
		OPCAO_ESTRATEGIA_ESTUDO_MAPA, OPCAO_ESTRATEGIA_ESTUDO_ANOTACOES,
		OPCAO_ESTRATEGIA_ESTUDO_EXERCICIOS, OPCAO_ESTRATEGIA_ESTUDO_GRAFICOS,
		OPCAO_ESTRATEGIA_ESTUDO_VIDEOS, OPCAO_ESTRATEGIA_ESTUDO_INTERNET,
		OPCAO_ESTRATEGIA_ESTUDO_DISCUSSAO, OPCAO_ESTRATEGIA_ESTUDO_PROFESSOR,
		OPCAO_ESTRATEGIA_ESTUDO_ASSOCIA, OPCAO_OUTROS};

	//OPCOES EXPERIENCIA ENFERMAGEM
	private static String OPCAO_EXPERIENCIA_NAO = "Não tenho experiência";
	private static short OPCAO_EXPERIENCIA_NAO_SHORT = 1;
	private static String OPCAO_EXPERIENCIA_ATENDENTE = "Atendente de Enfermagem";
	private static short OPCAO_EXPERIENCIA_ATENDENTE_SHORT = 2;
	private static String OPCAO_EXPERIENCIA_AUXILIAR = "Auxiliar de Enfermagem";
	private static short OPCAO_EXPERIENCIA_AUXILIAR_SHORT = 3;
	private static String OPCAO_EXPERIENCIA_TECNICO = "Técnico de Enfermagem";
	private static short OPCAO_EXPERIENCIA_TECNICO_SHORT = 4;
	public static String[] OPCOES_EXPERIENCIA_ENFERMAGEM = {SELECIONE, 
		OPCAO_EXPERIENCIA_NAO, OPCAO_EXPERIENCIA_ATENDENTE, 
		OPCAO_EXPERIENCIA_AUXILIAR, OPCAO_EXPERIENCIA_TECNICO};

	private static String OPCAO_IDIOMA_ESPANHOL = "Espanhol";
	@SuppressWarnings("unused")
	private static short OPCAO_IDIOMA_ESPANHOL_SHORT = 2;
	//OPCOES SEXO
	private static String OPCAO_IDIOMA_INGLES = "Inglês";
	@SuppressWarnings("unused")
	private static short OPCAO_IDIOMA_INGLES_SHORT = 1;
	private static String OPCAO_IDIOMA_MANDARIM = "Mandarim";
	@SuppressWarnings("unused")
	private static short OPCAO_IDIOMA_MANDARIM_SHORT = 3;
	private static String[] OPCOES_IDIOMA = {OPCAO_IDIOMA_INGLES,OPCAO_IDIOMA_ESPANHOL, OPCAO_IDIOMA_MANDARIM};

	//OPCOES LOCAL ESTUDO
	private static String OPCAO_LOCAL_ESTUDO_BIBLIOTECA = "Biblioteca";
	private static String OPCAO_LOCAL_ESTUDO_CASA = "Casa";
	private static String OPCAO_LOCAL_ESTUDO_ESPACOS = "Espaços públicos de lazer (praça, parque urbano...)";
	private static String OPCAO_LOCAL_ESTUDO_TRABALHO = "Trabalho";
	public static String[] OPCOES_LOCAL_ESTUDO = {OPCAO_LOCAL_ESTUDO_BIBLIOTECA, OPCAO_LOCAL_ESTUDO_CASA,
		OPCAO_LOCAL_ESTUDO_TRABALHO, OPCAO_LOCAL_ESTUDO_ESPACOS, OPCAO_OUTROS};

	//OPCOES RENDA FAMILIA
	private static String OPCAO_RENDA_MENOS = "Menos de 1 Salário";
	private static short OPCAO_RENDA_MENOS_SHORT = 1;
	private static String OPCAO_RENDA_UM_SALARIO = "1 à 3 Salários";
	private static short OPCAO_RENDA_UM_SALARIO_SHORT = 2;
	private static String OPCAO_RENDA_QUATRO_SALARIOS = "4 à 6 Salários";
	private static short OPCAO_RENDA_QUATRO_SALARIOS_SHORT = 3;
	private static String OPCAO_RENDA_SEIS_SALARIOS = "6 à 10 Salários";
	private static short OPCAO_RENDA_SEIS_SALARIOS_SHORT = 4;
	private static String OPCAO_RENDA_MAIS_DEZ_SALARIOS = "Mais de 10 Salários";
	private static short OPCAO_RENDA_MAIS_DEZ_SALARIOS_SHORT = 5;
	public static String[] OPCOES_RENDA_FAMILIA = {SELECIONE, OPCAO_RENDA_MENOS,
		OPCAO_RENDA_UM_SALARIO, OPCAO_RENDA_QUATRO_SALARIOS, OPCAO_RENDA_SEIS_SALARIOS,
		OPCAO_RENDA_MAIS_DEZ_SALARIOS};

	//OPCOES SEXO
	private static String OPCAO_SEXO_MASCULINO = "Masculino";
	private static short OPCAO_SEXO_MASCULINO_SHORT = 1;
	private static String OPCAO_SEXO_FEMININO = "Feminino";
	private static short OPCAO_SEXO_FEMININO_SHORT = 2;
	public static String[] OPCOES_SEXO = {SELECIONE, OPCAO_SEXO_MASCULINO, OPCAO_SEXO_FEMININO};

	//OPCOES TIPOS ESTILOS DE APRENDIZAGEM
	private static String OPCAO_TIPO_ESTILO_UNICO = "Único";
	private static short OPCAO_TIPO_ESTILO_UNICO_SHORT = 1;
	private static String OPCAO_TIPO_ESTILO_MISTO = "Misto";
	private static short OPCAO_TIPO_ESTILO_MISTO_SHORT = 2;
	private static String OPCAO_TIPO_ESTILO_BALANCEADO = "Balanceado";
	private static short OPCAO_TIPO_ESTILO_BALANCEADO_SHORT = 3;
	public static String[] OPCOES_TIPO_ESTILOS_APRENDIZAGEM = {SELECIONE, OPCAO_TIPO_ESTILO_UNICO, 
		OPCAO_TIPO_ESTILO_MISTO, OPCAO_TIPO_ESTILO_BALANCEADO};



	public static String OUTCOME_CADASTRO_BD_FALHA = "cadastrobdfalha";
	public static String OUTCOME_CADASTRO_INFO_FALHA = "cadastroinfofalha";
	//Possible outcomes for cadastro
	public static String OUTCOME_CADASTRO_SUCESSO = "cadastrosucesso";
	public static String OUTCOME_CRIAR_CURSO_BD_FALHA = "criarcursobdfalha";
	public static String OUTCOME_CRIAR_CURSO_INFO_FALHA = "criarcursoinfofalha";
	//Possible outcomes for cadastro
	public static String OUTCOME_CRIAR_CURSO_SUCESSO = "criarcursosucesso";
	public static String OUTCOME_LOGON_BD_FALHA = "logonbdfalha";
	public static String OUTCOME_LOGON_CADASTRO = "cadastro";
	public static String OUTCOME_LOGON_INFO_FALHA = "logoninfofalha";
	public static String OUTCOME_LOGON_SUCESSO_ADMIN = "logonsucessoadmin";
	//Possible outcomes for logon
	public static String OUTCOME_LOGON_SUCESSO_ALUNO = "logonsucessoaluno";
	public static String OUTCOME_LOGON_SUCESSO_PROFESSOR = "logonsucessoprofessor";
	//outcome Logout
	public static String OUTCOME_LOGOUT = "logout";
	//USER PROFILE
	public static int PERFIL_ADMINISTRADOR = 0;
	public static int PERFIL_ALUNO = 1;
	public static int PERFIL_PROFESSOR = 2;
	public static String RENDA_INVALIDA = "renda_invalida";


	public static String SEXO_INVALIDO = "sexo_invalido";
	public static String STRING_FASE_ARCO_HIPOTESES_SOLUCAO = "Hipóteses de Solução";
	//String equivalente as fases do arco
	public static String STRING_FASE_ARCO_OBSERVACAO = "Observação da Realidade e Pontos Chave";
	public static String STRING_FASE_ARCO_TEORIZACAO = "Teorização";
	public static String STRING_STATUS_FASE_ESTUDO_CASO_STATUS_EM_ANDAMENTO = "Em andamento";
	//Status da fase do aluno no estudo de caso
	public static String STRING_STATUS_FASE_ESTUDO_CASO_STATUS_FINALIZADO = "Finalizada";
	public static String STRING_STATUS_FASE_ESTUDO_CASO_STATUS_NAO_INICIADO = "Não iniciada";

	//URL do admin
	public static String URL_CONTEUDO_ADMIN_PRINCIPAL = "";
	public static String URL_CONTEUDO_ADMIN_LISTA_CADASTRAR_CIPE = "/pages/admin/cadastrarCipe.xhtml";
	public static String URL_CONTEUDO_ADMIN_LISTA_FEEDACKS = "/pages/admin/lerFeedbacks.xhtml";
	//URL do conteúdo de aluno
	public static String URL_CONTEUDO_ALUNO_AMBULATORIO ="/pages/aluno/ambulatorio/ambulatorio.xhtml";
	public static String URL_CONTEUDO_ALUNO_ARCO_PRINCIPAL = "/pages/aluno/arco/arcoPrincipal.xhtml";
	public static String URL_CONTEUDO_ALUNO_AVALIACAO ="/pages/aluno/avaliacao/autoAvaliacao.xhtml";
	public static String URL_CONTEUDO_ALUNO_INFORMACOES_CURSO_ALUNO = "/pages/aluno/curso/informacoesCurso.xhtml";
	public static String URL_CONTEUDO_ALUNO_GLOSSARIO ="/pages/aluno/glossario/glossarioPrincipalAluno.xhtml";
	public static String URL_CONTEUDO_ALUNO_LISTA_CURSOS_ALUNO = "/pages/aluno/curso/listaCursosAluno.xhtml";
	public static String URL_CONTEUDO_ALUNO_MODIFICA_CADASTRO = "/pages/aluno/perfilAluno.xhtml";
	public static String URL_CONTEUDO_ALUNO_OBSERVACAO = "/pages/aluno/arco/observacaoEstudo.xhtml";
	public static String URL_CONTEUDO_ALUNO_PLANO_CUIDADOS = "/pages/aluno/arco/planoCuidadosEstudo.xhtml";
	public static String URL_CONTEUDO_ALUNO_PRINCIPAL = "";
	public static String URL_CONTEUDO_ALUNO_PRINCIPAL_AVALIACAO = "/pages/aluno/avaliacao/principalAvaliacao.xhtml";
	public static String URL_CONTEUDO_ALUNO_TEORIZACAO = "/pages/aluno/arco/teorizacaoEstudo.xhtml";
	
	//URL do conteúdo de professor
	public static String URL_CONTEUDO_PROFESSOR_ACOMPANHAMENTO_ESTUDANTE = "/pages/professor/acompanhamento/acompanhamentoEstudante.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_ACOMPANHAMENTO_ESTUDO_CASO = "/pages/professor/acompanhamento/acompanhamentoEstudoCaso.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_CRIAR_EDITAR_CURSOS = "/pages/professor/curso/criarEditarCurso.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_CRIAR_EDITAR_ESTUDOS = "/pages/professor/estudo/criarEditarEstudo.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_GLOSSARIO ="/pages/professor/glossario/glossarioPrincipalProfessor.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_LISTA_CURSOS = "/pages/professor/curso/listaCursos.xhtml";
	public static String URL_CONTEUDO_PROFESSOR_LISTA_ESTUDOS = "/pages/professor/estudo/listaEstudo.xhtml";
	
	//URL principais
	public static String URL_LOGON = "/pages/logon.xhtml";
	public static String URL_CADASTRO = "/pages/cadastro.xhtml";
	public static String URL_ADMIN_PRINCIPAL = "/pages/admin/principalAdmin.xhtml";
	public static String URL_ALUNO_PRINCIPAL = "/pages/aluno/principalAluno.xhtml";
	public static String URL_PROFESSOR_PRINCIPAL = "/pages/professor/principalProfessor.xhtml";
	
	//variaveis de paginacao
	public static int PAGINA_INICIAL = 0;
	public static int TAMANHO_PAGINA_DEFAULT = 5;
	
	public static String decript_opcao_estado(int estado) throws Exception{

		String retorno = "";

		if(estado == OPCAO_ESTADO_CIVIL_CASADA_SHORT){

			retorno = OPCAO_ESTADO_CIVIL_CASADA;

		}else if(estado == OPCAO_ESTADO_CIVIL_DIVORCIADA_SHORT){

			retorno = OPCAO_ESTADO_CIVIL_DIVORCIADA;

		}else if(estado == OPCAO_ESTADO_CIVIL_SOLTEIRA_SHORT){

			retorno = OPCAO_ESTADO_CIVIL_SOLTEIRA;

		}else if(estado == OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL_SHORT){

			retorno = OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL;

		}else if(estado == OPCAO_ESTADO_CIVIL_VIUVA_SHORT){

			retorno = OPCAO_ESTADO_CIVIL_VIUVA;

		}else{

			throw new Exception(ESTADO_CIVIL_INVALIDO);

		}

		return retorno;
	}
	public static String decript_opcao_experiencia_enfermagem(int experiencia) throws Exception{

		String retorno = "";

		if(experiencia == OPCAO_EXPERIENCIA_NAO_SHORT){

			retorno = OPCAO_EXPERIENCIA_NAO;

		}else if(experiencia == OPCAO_EXPERIENCIA_ATENDENTE_SHORT){

			retorno = OPCAO_EXPERIENCIA_ATENDENTE;

		}else if(experiencia == OPCAO_EXPERIENCIA_AUXILIAR_SHORT){

			retorno = OPCAO_EXPERIENCIA_AUXILIAR;

		}else if(experiencia == OPCAO_EXPERIENCIA_TECNICO_SHORT){

			retorno = OPCAO_EXPERIENCIA_TECNICO;

		}else{

			throw new Exception(EXPERIENCIA_INVALIDA);

		}

		return retorno;

	}
	public static String decript_opcao_experiencia_reprovacao(boolean experiencia) throws Exception{

		String retorno = "";

		if(experiencia == false){

			retorno = OPCAO_NAO;

		}else if(experiencia == true){

			retorno = OPCAO_SIM;

		}else{

			throw new Exception(EXPERIENCIA_INVALIDA);

		}

		return retorno;

	}

	public static String decript_opcao_renda(int renda) throws Exception{

		String retorno = "";

		if(renda == OPCAO_RENDA_MENOS_SHORT){

			retorno = OPCAO_RENDA_MENOS;

		}else if(renda == OPCAO_RENDA_UM_SALARIO_SHORT){

			retorno = OPCAO_RENDA_UM_SALARIO;

		}else if(renda == OPCAO_RENDA_QUATRO_SALARIOS_SHORT){

			retorno = OPCAO_RENDA_QUATRO_SALARIOS;

		}else if(renda == OPCAO_RENDA_SEIS_SALARIOS_SHORT){

			retorno = OPCAO_RENDA_SEIS_SALARIOS;

		}else if(renda == OPCAO_RENDA_MAIS_DEZ_SALARIOS_SHORT){

			retorno = OPCAO_RENDA_MAIS_DEZ_SALARIOS;

		}else{

			throw new Exception(RENDA_INVALIDA);

		}

		return retorno;

	}

	public static String decript_opcao_sexo(int sexo) throws Exception{

		String retorno = "";

		if(sexo == OPCAO_SEXO_FEMININO_SHORT){

			retorno = OPCAO_SEXO_FEMININO;

		}else if(sexo == OPCAO_SEXO_MASCULINO_SHORT){

			retorno = OPCAO_SEXO_MASCULINO;

		}else{

			throw new Exception(SEXO_INVALIDO);

		}

		return retorno;

	}

	public static String decript_opcao_tipo_estilo_aprendizagem(int tipoEstilo) throws Exception{

		String retorno = "";

		if(tipoEstilo == OPCAO_TIPO_ESTILO_UNICO_SHORT){

			retorno = OPCAO_TIPO_ESTILO_UNICO;

		}else if(tipoEstilo == OPCAO_TIPO_ESTILO_MISTO_SHORT){

			retorno = OPCAO_TIPO_ESTILO_MISTO;

		}else if(tipoEstilo == OPCAO_TIPO_ESTILO_BALANCEADO_SHORT){

			retorno = OPCAO_TIPO_ESTILO_BALANCEADO;

		}else{

			retorno = SELECIONE;

		}

		return retorno;

	}

	public static int encript_opcao_estado_civil(String recebida) throws Exception{

		int retorno = 0;

		if(recebida.equalsIgnoreCase(OPCAO_ESTADO_CIVIL_CASADA)){

			retorno = OPCAO_ESTADO_CIVIL_CASADA_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_ESTADO_CIVIL_DIVORCIADA)){

			retorno = OPCAO_ESTADO_CIVIL_DIVORCIADA_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_ESTADO_CIVIL_SOLTEIRA)){

			retorno = OPCAO_ESTADO_CIVIL_SOLTEIRA_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL)){

			retorno = OPCAO_ESTADO_CIVIL_UNIAO_ESTAVEL_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_ESTADO_CIVIL_VIUVA)){

			retorno = OPCAO_ESTADO_CIVIL_VIUVA_SHORT;

		}else if(recebida.equalsIgnoreCase(SELECIONE)){

			throw new Exception(ESTADO_CIVIL_INVALIDO);

		}

		return retorno;
	}

	public static int encript_opcao_experiencia_enfermagem(String recebida) throws Exception{

		int retorno = 0;
		if(recebida.equalsIgnoreCase(OPCAO_EXPERIENCIA_NAO)){

			retorno = OPCAO_EXPERIENCIA_NAO_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_EXPERIENCIA_ATENDENTE)){

			retorno = OPCAO_EXPERIENCIA_ATENDENTE_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_EXPERIENCIA_AUXILIAR)){

			retorno = OPCAO_EXPERIENCIA_AUXILIAR_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_EXPERIENCIA_TECNICO)){

			retorno = OPCAO_EXPERIENCIA_TECNICO_SHORT;

		}

		return retorno;
	}

	public static boolean encript_opcao_experiencia_reprovacao(String recebida) throws Exception{

		boolean retorno = false;
		if(recebida.equalsIgnoreCase(OPCAO_NAO)){

			retorno = false;

		}else if(recebida.equalsIgnoreCase(OPCAO_SIM)){

			retorno = true;

		}

		return retorno;
	}

	public static int encript_opcao_renda(String recebida) throws Exception{

		int retorno = 0;

		if(recebida.equalsIgnoreCase(OPCAO_RENDA_MENOS)){

			retorno = OPCAO_RENDA_MENOS_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_RENDA_UM_SALARIO)){

			retorno = OPCAO_RENDA_UM_SALARIO_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_RENDA_QUATRO_SALARIOS)){

			retorno = OPCAO_RENDA_QUATRO_SALARIOS_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_RENDA_SEIS_SALARIOS)){

			retorno = OPCAO_RENDA_SEIS_SALARIOS_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_RENDA_MAIS_DEZ_SALARIOS)){

			retorno = OPCAO_RENDA_MAIS_DEZ_SALARIOS_SHORT;

		}else if(recebida.equalsIgnoreCase(SELECIONE)){

			throw new Exception(RENDA_INVALIDA);

		}

		return retorno;
	}

	public static int encript_opcao_sexo(String recebida) throws Exception{

		int retorno = 0;

		if(recebida.equalsIgnoreCase(OPCAO_SEXO_FEMININO)){

			retorno = OPCAO_SEXO_FEMININO_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_SEXO_MASCULINO)){

			retorno = OPCAO_SEXO_MASCULINO_SHORT;

		}else if(recebida.equalsIgnoreCase(SELECIONE)){

			throw new Exception(SEXO_INVALIDO);

		}

		return retorno;
	}

	public static int encript_opcao_tipo_estilo_aprendizagem(String recebida) throws Exception{

		int retorno = 0;

		if(recebida.equalsIgnoreCase(OPCAO_TIPO_ESTILO_UNICO)){

			retorno = OPCAO_TIPO_ESTILO_UNICO_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_TIPO_ESTILO_MISTO)){

			retorno = OPCAO_TIPO_ESTILO_MISTO_SHORT;

		}else if(recebida.equalsIgnoreCase(OPCAO_TIPO_ESTILO_BALANCEADO)){

			retorno = OPCAO_TIPO_ESTILO_BALANCEADO_SHORT;

		}

		return retorno;
	}

	public static String getObservacao_realidade_mensagem_erro_determinante_incompleto() {
		return OBSERVACAO_REALIDADE_MENSAGEM_ERRO_DETERMINANTE_INCOMPLETO;
	}

	public static void setObservacao_realidade_mensagem_erro_determinante_incompleto(
			String observacao_realidade_mensagem_erro_determinante_incompleto) {
		Define.OBSERVACAO_REALIDADE_MENSAGEM_ERRO_DETERMINANTE_INCOMPLETO = observacao_realidade_mensagem_erro_determinante_incompleto;
	}

	private String PENSAE_DESCRICAO = "Olá, este é o software PenSAE, um "
			+ "ambiente de aprendizagem interativa, que utiliza a metodologia "
			+ "da problematização para a construção do conhecimento aplicado ao "
			+ "processo de enfermagem no cuidado à saúde da criança. O processo de "
			+ "enfermagem é um conjunto de ações direcionadas à solução de problemas, "
			+ "onde o enfermeiro planeja, implementa e avalia as atividades de enfermagem. "
			+ "Através deste software você terá a oportunidade de desenvolver competências "
			+ "e habilidades essenciais para o exercício prático do processo de enfermagem. "
			+ "Isto lhe auxiliará na tomada de decisão clínica por meio da aquisição de "
			+ "raciocínios mais elaborados, autonomia e confiança.";

	//Teorizacao Screen info
	private String PENSAE_REFERENCIAS_INSTRUCOES = "Depois de realizar uma pesquisa criteriosa, elabore um documento de texto (podendo estar nos formatos: doc, docx e pdf) que contenha todas as referências bibliográficas que você selecionou como mais importantes e insira o mesmo abaixo.";

	//Logon Screen info
	private String PENSAE_TITULO = "PenSAE";

	public Define() {
	}

	public String getCadastro_bd_falha() {
		return OUTCOME_CADASTRO_BD_FALHA;
	}

	public String getCadastro_info_falha() {
		return OUTCOME_CADASTRO_INFO_FALHA;
	}


	public String getCadastro_sucesso() {
		return OUTCOME_CADASTRO_SUCESSO;
	}

	public String getLogon_bd_falha() {
		return OUTCOME_LOGON_BD_FALHA;
	}

	public String getLogon_cadastro() {
		return OUTCOME_LOGON_CADASTRO;
	}

	public String getLogon_info_falha() {
		return OUTCOME_LOGON_INFO_FALHA;
	}

	public String getLogon_sucesso() {
		return OUTCOME_LOGON_SUCESSO_ALUNO;
	}

	public String getLogout() {
		return OUTCOME_LOGOUT;
	}

	public String[] getopcoes_idioma() {
		return OPCOES_IDIOMA;
	}

	@SuppressWarnings("static-access")
	public void getopcoes_idioma(String[] opcoes_idioma) {
		this.OPCOES_IDIOMA = opcoes_idioma;
	}

	public String getPENSAE_DESCRICAO() {
		return PENSAE_DESCRICAO;
	}

	public String getPENSAE_REFERENCIAS_INSTRUCOES() {
		return PENSAE_REFERENCIAS_INSTRUCOES;
	}

	public String getPENSAE_TITULO() {
		return PENSAE_TITULO;
	}

	public void setCadastro_bd_falha(String cadastro_bd_falha) {
		OUTCOME_CADASTRO_BD_FALHA = cadastro_bd_falha;
	}

	public void setCadastro_info_falha(String cadastro_info_falha) {
		OUTCOME_CADASTRO_INFO_FALHA = cadastro_info_falha;
	}

	public void setCadastro_sucesso(String cadastro_sucesso) {
		OUTCOME_CADASTRO_SUCESSO = cadastro_sucesso;
	}

	public void setLogon_bd_falha(String logon_bd_falha) {
		OUTCOME_LOGON_BD_FALHA = logon_bd_falha;
	}

	public void setLogon_cadastro(String logon_cadastro) {
		OUTCOME_LOGON_CADASTRO = logon_cadastro;
	}

	public void setLogon_info_falha(String logon_info_falha) {
		OUTCOME_LOGON_INFO_FALHA = logon_info_falha;
	}

	public void setLogon_sucesso(String logon_sucesso) {
		OUTCOME_LOGON_SUCESSO_ALUNO = logon_sucesso;
	}

	public void setLogout(String logout) {
		OUTCOME_LOGOUT = logout;
	}

	public void setPENSAE_DESCRICAO(String descricao) {
		PENSAE_DESCRICAO = descricao;
	}

	public void setPENSAE_REFERENCIAS_INSTRUCOES(
			String pENSAE_REFERENCIAS_INSTRUCOES) {
		PENSAE_REFERENCIAS_INSTRUCOES = pENSAE_REFERENCIAS_INSTRUCOES;
	}

	public void setPENSAE_TITULO(String PENSAE_TITLE) {
		this.PENSAE_TITULO = PENSAE_TITLE;
	}
}