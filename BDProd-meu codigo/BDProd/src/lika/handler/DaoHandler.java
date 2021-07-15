package lika.handler;

import org.springframework.beans.factory.annotation.Autowired;

import lika.dao.PessoaDao;
import lika.services.AlunoService;
import lika.services.AreaDePesquisaService;
import lika.services.BolsistaProjetoService;
import lika.services.DepartamentoService;
import lika.services.EquipamentoService;
import lika.services.FuncaoService;
import lika.services.GrupoDePesquisaService;
import lika.services.LaboratorioService;
import lika.services.PesquisadorService;
import lika.services.PessoaProjetoService;
import lika.services.FuncionarioService;
import lika.services.PessoaService;
import lika.services.ProjetoService;
import lika.services.PublicacaoService;
import lika.services.SubAreaDePesquisaService;
import lika.services.UsuarioService;

public class DaoHandler {

	private static DaoHandler INSTANCE;

	public static DaoHandler getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new DaoHandler();
		}

		return INSTANCE;
	}

	private DepartamentoService departamentoDao;

	private PessoaProjetoService pessoaProjetoDao;

	private UsuarioService usuarioDao;

	private SubAreaDePesquisaService subAreaDao;

	private ProjetoService projetoDao;

	private PublicacaoService publicacaoDao;

	private PesquisadorService pesquisadorDao;

	private LaboratorioService laboratorioDao;

	private AlunoService alunoDao;

	private FuncaoService funcaoDao;

	private BolsistaProjetoService bolsistaProjetoDao;

	private FuncionarioService funcionarioDao;

	private PessoaService pessoaDao;

	public FuncionarioService getFuncionarioDao() {
		return funcionarioDao;
	}

	@Autowired
	public void setFuncionarioDao(FuncionarioService funcionarioDao) {
		this.funcionarioDao = funcionarioDao;
	}

	public PessoaService getPessoaDao() {
		return pessoaDao;
	}

	@Autowired
	public void setPessoaDao(PessoaService pessoaDao) {
		this.pessoaDao = pessoaDao;
	}

	public BolsistaProjetoService getBolsistaProjetoDao() {
		return bolsistaProjetoDao;
	}

	public AreaDePesquisaService areaDao;

	private EquipamentoService equipamentoDao;

	private GrupoDePesquisaService grupoDao;

	public GrupoDePesquisaService getGrupoDao() {
		return grupoDao;
	}

	@Autowired
	public void setGrupoDao(GrupoDePesquisaService grupoDao) {
		this.grupoDao = grupoDao;
	}

	public EquipamentoService getEquipamentoDao() {
		return equipamentoDao;
	}

	@Autowired
	public void setEquipamentoDao(EquipamentoService equipamentoDao) {
		this.equipamentoDao = equipamentoDao;
	}

	public AreaDePesquisaService getAreaDao() {
		return areaDao;
	}

	@Autowired
	public void setAreaDao(AreaDePesquisaService areaDao) {
		this.areaDao = areaDao;
	}

	@Autowired
	public void setBolsistaProjetoDao(BolsistaProjetoService bolsistaProjetoDao) {
		this.bolsistaProjetoDao = bolsistaProjetoDao;
	}

	public FuncaoService getFuncaoDao() {
		return funcaoDao;
	}

	@Autowired
	public void setFuncaoDao(FuncaoService funcaoDao) {
		this.funcaoDao = funcaoDao;
	}

	public AlunoService getAlunoDao() {
		return alunoDao;
	}

	@Autowired
	public void setAlunoDao(AlunoService alunoDao) {
		this.alunoDao = alunoDao;
	}

	public DepartamentoService getDepartamentoDao() {
		return departamentoDao;
	}

	@Autowired
	public void setDepartamentoDao(DepartamentoService departamentoDao) {
		this.departamentoDao = departamentoDao;
	}

	public LaboratorioService getLaboratorioDao() {
		return laboratorioDao;
	}

	@Autowired
	public void setLaboratorioDao(LaboratorioService laboratorioDao) {
		this.laboratorioDao = laboratorioDao;
	}

	public PessoaProjetoService getPessoaProjetoDao() {
		return pessoaProjetoDao;
	}

	@Autowired
	public void setPessoaProjetoDao(PessoaProjetoService pessoaProjetoDao) {
		this.pessoaProjetoDao = pessoaProjetoDao;
	}

	public SubAreaDePesquisaService getSubAreaDao() {
		return subAreaDao;
	}

	@Autowired
	public void setSubAreaDao(SubAreaDePesquisaService subAreaDao) {
		this.subAreaDao = subAreaDao;
	}

	public ProjetoService getProjetoDao() {
		return projetoDao;
	}

	@Autowired
	public void setProjetoDao(ProjetoService projetoDao) {
		this.projetoDao = projetoDao;
	}

	public PublicacaoService getPublicacaoDao() {
		return publicacaoDao;
	}

	@Autowired
	public void setPublicacaoDao(PublicacaoService publicacaoDao) {
		this.publicacaoDao = publicacaoDao;
	}

	public UsuarioService getUsuarioDao() {
		return usuarioDao;
	}

	@Autowired
	public void setUsuarioDao(UsuarioService usuarioDao) {
		this.usuarioDao = usuarioDao;
	}

	public PesquisadorService getPesquisadorDao() {
		return pesquisadorDao;
	}

	@Autowired
	public void setPesquisadorDao(PesquisadorService pesquisadorDao) {
		this.pesquisadorDao = pesquisadorDao;
	}
}
