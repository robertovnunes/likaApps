package fachada;

import java.util.List;

import model.endereco.Bairro;
import model.endereco.Cidade;
import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.Residencia;
import model.endereco.UF;
import model.fichainvestigativa.Conclusao;
import model.fichainvestigativa.DadosClinicosComplicacoes;
import model.fichainvestigativa.DadosGerais;
import model.fichainvestigativa.DadosLaboratoriais;
import model.fichainvestigativa.NotificacaoInvestigativa;
import model.fichainvestigativa.Paciente;
import model.sistema.Arquivo;
import model.sistema.CNES;
import model.usuario.Usuario;
import negocios.LocalizacaoNeg;
import negocios.NotificacaoInvestigativaNeg;
import negocios.SistemaNeg;
import negocios.UsuarioNeg;
import dados.hibernate.HibernateUtil;


public class Fachada {
	
	private static Fachada instancia;
	private final UsuarioNeg usuarioNeg;
	private final LocalizacaoNeg localizacaoNeg;
	private final SistemaNeg sistemaNeg;
	private final NotificacaoInvestigativaNeg notificacaoNeg;
	
	public Fachada() {
		usuarioNeg = UsuarioNeg.getInstancia();
		localizacaoNeg = LocalizacaoNeg.getInstancia();
		sistemaNeg = SistemaNeg.getInstancia();
		notificacaoNeg = NotificacaoInvestigativaNeg.getInstancia();
	}
	
	public static Fachada getInstancia(){
 		if(Fachada.instancia == null){
 			Fachada.instancia = new Fachada();
		}
		return Fachada.instancia;
	}
	
	public Arquivo getArquivoPorId(int id){
		return this.sistemaNeg.getArquivoPorId(id);
	}
	
	public void atualizar(){
		HibernateUtil.getFabricaDeSessao().getCurrentSession().flush();
	}
	
	public void limparSessaoHibernate(){
		HibernateUtil.getFabricaDeSessao().getCurrentSession().clear();
	}
	
	/** Métodos UsuarioNeg	 */
	public Object autenticar(String login){
		return this.usuarioNeg.getUsuario(login);
	}
	
	public List<Usuario> getTodosUsuarios(){
		return this.usuarioNeg.getTodos();
	}
	
	public List<Usuario> getUsuariosPorConsulta(String tipo, String valor){
		return this.usuarioNeg.getPorConsulta(tipo, valor);
	}
	
	public Usuario getPorId(int id){
		return this.usuarioNeg.getPorId(id);
	}
	
	public void saveOrUpdateUsuario(Usuario usuario){
		this.usuarioNeg.saveOrUpdateUsuario(usuario);
	}
	
	public Usuario insertUsuario(Usuario usuario){
		return this.usuarioNeg.insertUsuario(usuario);
	}
	
	
	/** Métodos LocalizacaoNeg	 */
	public List<Pais> getTodosPaises(){
		return this.localizacaoNeg.getTodosPaises();
	}
	
	public List<UF> getTodosEstados(){
		return this.localizacaoNeg.getTodosEstados();
	}
	
	public List<Logradouro> getTodosLogradouro(){
		return this.localizacaoNeg.getTodosLogradouro();
	}
	
	public List<Cidade> getTodosCidade(){
		return this.localizacaoNeg.getTodosCidade();
	}
	
	public List<Bairro> getTodosBairros(){
		return this.localizacaoNeg.getTodosBairros();
	}
	
	public List<Cidade> getCidadesPorUF(String idUF){
		return this.localizacaoNeg.getCidadePorUF(idUF);
	}
	
	public List<Bairro> getBairroPorCidade(String idCidade){
		return this.localizacaoNeg.getBairroPorCidade(idCidade);
	}
	
	public Logradouro getLogradouroPorCep(String cep) {
		return this.localizacaoNeg.getLogradouroPorCep(cep);
	}
	
	public Logradouro inserirLogradouro(Logradouro logradouro){
		return this.localizacaoNeg.inserirLogradouro(logradouro);
	}
	
	public Cidade getCidadePorID(Integer id){
		return this.localizacaoNeg.getCidadePorID(id);
	}
	
	public UF getUFPorID(Integer id){
		return this.localizacaoNeg.getUFPorID(id);
	}
	
	public Residencia inserirResidencia(Residencia residencia){
		return this.localizacaoNeg.inserirResidencia(residencia);
	}
	
	public List<Object[]> getTodosBairrosDaCidadeDoBairroSelecionado(String codigoBairro){
		return this.localizacaoNeg.getTodosBairrosDaCidadeDoBairroSelecionado(codigoBairro);
	}
	
	public List<Object[]> getTodasCidadesDoBairroSelecionado(String codigoBairro) {
		return this.localizacaoNeg.getTodasCidadesDoBairroSelecionado(codigoBairro);
	}
	
	public Object[] getCidadeEstadoDoBairroSelecionado(String codigoBairro) {
		return this.localizacaoNeg.getCidadeEstadoDoBairroSelecionado(codigoBairro);
	}
	
	/** Sistema Negocio Metodos */
	public List<CNES> getTodosCNES(){
		return this.sistemaNeg.getTodosCNES();
	}
	
	public List<CNES> pesquisarCNES(String valor) {
		return this.sistemaNeg.pesquisarCNES(valor);
	}
	
	/** Ficha Investigativa Negocio Metodos */
	public NotificacaoInvestigativa getNotificacaoInvestigativaPorID(Integer id){
		return this.notificacaoNeg.getNotificacaoInvestigativaPorID(id);
	}
	
	public NotificacaoInvestigativa inserirNotificacaoInvestigativa(NotificacaoInvestigativa notificacaoInvestigativa){
		return this.notificacaoNeg.inserirNotificacaoInvestigativa(notificacaoInvestigativa);
	}
	
	public List<NotificacaoInvestigativa> pesquisarNotificacaoInvestigativa(
			String cep, String pais, String estado, String cidade,
			String bairro, String dataInicial, String dataFinal,
			String autocomplete, String classico, String complicacoes,
			String fhd, String scd, String descartado) {
		return this.notificacaoNeg.pesquisarNotificacaoInvestigativa(cep, pais, estado, cidade, bairro, dataInicial, dataFinal, autocomplete, classico, complicacoes, fhd, scd, descartado);
	}
	
	public List<NotificacaoInvestigativa> getTodasNotificacaoInvestigativa(){
		return this.notificacaoNeg.getTodasNotificacaoInvestigativa();
	}
	
	public List<NotificacaoInvestigativa> getNotificacaoInvestigativaPorFiltro(String tipo, String valor){
		return this.notificacaoNeg.getNotificacaoInvestigativaPorFiltro(tipo, valor);
	}
	
	public void removerFichaNotificacao(NotificacaoInvestigativa notificacao){
		this.notificacaoNeg.removerFichaNotificacao(notificacao);
	}
	
	public Conclusao persistirConclusao(Conclusao conclusao){
		return this.notificacaoNeg.persistirConclusao(conclusao);
	}
	
	public DadosGerais persistirDadosGerais(DadosGerais dadosGerais){
		return this.notificacaoNeg.persistirDadosGerais(dadosGerais);
	}
	
	public DadosClinicosComplicacoes persistirDadosClinicosComplicacoes(DadosClinicosComplicacoes dadosClinicosComplicacoes){
		return this.notificacaoNeg.persistirDadosClinicosComplicacoes(dadosClinicosComplicacoes);
	}
	
	public DadosLaboratoriais persistirDadosLaboratoriais(DadosLaboratoriais dadosLaboratoriais){
		return this.notificacaoNeg.persistirDadosLaboratoriais(dadosLaboratoriais);
	}
	
	public Paciente persistirPaciente(Paciente paciente){
		return this.notificacaoNeg.persistirPaciente(paciente);
	}
	
	public Residencia persistirResidencia(Residencia residencia){
		return this.notificacaoNeg.persistirResidencia(residencia);
	}
	
	public CNES buscarUnidadeSaudePorIDCNES(String idCnes){
		return this.notificacaoNeg.buscarUnidadeSaudePorIDCNES(idCnes);
	}
	
	public NotificacaoInvestigativa persistirNotificacaoInvestigativa(NotificacaoInvestigativa notificacaoInvestigativa){
		return this.notificacaoNeg.persistirNotificacaoInvestigativa(notificacaoInvestigativa);
	}
	
	public Arquivo inserirArquivo(Arquivo arquivo){
		return this.notificacaoNeg.inserirArquivo(arquivo);
	}
}
