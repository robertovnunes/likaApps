package negocios;

import java.util.List;

import model.endereco.Bairro;
import model.endereco.Cidade;
import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.Residencia;
import model.endereco.UF;
import dados.FabricaDAO;
import dados.basicas.BairroDAO;
import dados.basicas.CidadeDAO;
import dados.basicas.LogradouroDAO;
import dados.basicas.PaisDAO;
import dados.basicas.ResidenciaDAO;
import dados.basicas.UFDAO;
import dados.hibernate.FabricaHibernateDAO;

public class LocalizacaoNeg {
	
	private static LocalizacaoNeg instancia;
	private FabricaDAO fabrica;
	
	private LocalizacaoNeg() {
		fabrica = FabricaHibernateDAO.getInstancia();
	}
	
	public static LocalizacaoNeg getInstancia(){
		if(LocalizacaoNeg.instancia == null){
			LocalizacaoNeg.instancia = new LocalizacaoNeg();
		}
		return LocalizacaoNeg.instancia;
	}
	
	
	public List<Pais> getTodosPaises(){
		PaisDAO dao = fabrica.getPaisDAO();
		return dao.getTodos();
	}
	
	public List<UF> getTodosEstados(){
		UFDAO dao = fabrica.getUFDAO();
		return dao.getTodos();
	}
	
	public List<Logradouro> getTodosLogradouro(){
		LogradouroDAO dao = fabrica.getLogradouroDAO();
		return dao.getTodos();
	}
	
	public List<Cidade> getTodosCidade(){
		CidadeDAO dao = fabrica.getCidadeDAO();
		return dao.getTodos();
	}
	
	public List<Bairro> getTodosBairros(){
		BairroDAO dao = fabrica.getBairroDAO();
		return dao.getTodos();
	}
	
	public List<Cidade> getCidadePorUF(String idUF){
		CidadeDAO dao = fabrica.getCidadeDAO();
		return dao.getCidadePorUF(idUF);
	}
	
	public List<Bairro> getBairroPorCidade(String idCidade){
		BairroDAO dao = fabrica.getBairroDAO();
		return dao.getBairroPorCidade(idCidade);
	}
	
	public Logradouro getLogradouroPorCep(String cep) {
		LogradouroDAO dao = fabrica.getLogradouroDAO();
		return dao.getLogradouroPorCep(cep);
	}
	
	public Logradouro inserirLogradouro(Logradouro logradouro) {
		LogradouroDAO dao = fabrica.getLogradouroDAO();
		return dao.persistir(logradouro);
	}
	
	public Cidade getCidadePorID(Integer id){
		CidadeDAO dao = fabrica.getCidadeDAO();
		return dao.getPorId(id, false);
	}
	
	public UF getUFPorID(Integer id){
		UFDAO dao = fabrica.getUFDAO();
		return dao.getPorId(id, false);
	}
	
	public Residencia inserirResidencia(Residencia residencia){
		ResidenciaDAO dao = fabrica.getResidenciaDAO();
		return dao.persistir(residencia);
	}
	
	public List<Cidade> getCidadePorUFSigla(String siglaUF) {
		CidadeDAO dao = fabrica.getCidadeDAO();
		return dao.getCidadePorUFSigla(siglaUF);
	}
	
	public List<Object[]> getTodosBairrosDaCidadeDoBairroSelecionado(String codigoBairro){
		BairroDAO dao = fabrica.getBairroDAO();
		return dao.getTodosBairrosDaCidadeDoBairroSelecionado(codigoBairro);
	}
	
	public List<Object[]> getTodasCidadesDoBairroSelecionado(String codigoBairro) {
		CidadeDAO dao = fabrica.getCidadeDAO();
		return dao.getTodasCidadesDoBairroSelecionado(codigoBairro);
	}
	
	public Object[] getCidadeEstadoDoBairroSelecionado(String codigoBairro) {
		BairroDAO dao = fabrica.getBairroDAO();
		return dao.getCidadeEstadoDoBairroSelecionado(codigoBairro);
	}
}
