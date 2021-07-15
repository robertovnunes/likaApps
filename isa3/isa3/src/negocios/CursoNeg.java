package negocios;

import java.util.ArrayList;
import java.util.List;

import model.Nanda;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.sistema.Arquivo;
import dados.basicas.ArquivoDAO;
import dados.basicas.CursoDAO;
import dados.basicas.EstudoDeCasoDAO;
import dados.basicas.NandaDAO;

public class CursoNeg extends GenericNeg<Curso>{

	private static CursoNeg instancia;
	
	private CursoNeg() {
		super(Curso.class);
	}
	
	public static CursoNeg getInstancia(){
		if(CursoNeg.instancia == null){
			CursoNeg.instancia = new CursoNeg();
		}
		return CursoNeg.instancia;
	}
	
	public List<Curso> getTodosCursosPorStatus(int ... status) {
		CursoDAO dao = fabrica.getCursoDAO();
		return dao.getTodosCursosPorStatus(status);
	}
	
	public List<Arquivo> inserirArquivosCurso(List<Arquivo> arquivos){
		ArquivoDAO arqDao = fabrica.getArquivoDAO();
		List<Arquivo> retorno = new ArrayList<Arquivo>();
		for (Arquivo arquivo : arquivos) {
			Arquivo temp = arqDao.persistir(arquivo);
			retorno.add(temp);
		}
		return retorno;
	}
	
	public List<Curso> getTodosCursos() {
		CursoDAO dao = fabrica.getCursoDAO();
		return dao.getTodosCursos();
	}
	
	public Curso inserirEstudoDeCasoNoCurso(EstudoDeCaso estudoDeCaso, Curso curso) {
		CursoDAO dao = fabrica.getCursoDAO();
		return dao.inserirEstudoDeCasoNoCurso(estudoDeCaso, curso);
	}
	
	public Arquivo getArquivoPorId(int id){
		ArquivoDAO dao = fabrica.getArquivoDAO();
		return dao.getPorId(id, true);
	}
	
	public EstudoDeCaso cadastrarEstudoDeCaso(EstudoDeCaso estudoDeCaso){
		EstudoDeCasoDAO dao = fabrica.getEstudoDeCasoDAO();
		return dao.persistir(estudoDeCaso);
	}
	
//	public List<EstudoDeCaso> listarEstudosDeCasosPorCurso(Curso curso){
//		EstudoDeCasoDAO dao = fabrica.getEstudoDeCasoDAO();
//		return dao.listarEstudosDeCasosPorCurso(curso);
//	}
	
	public List<Nanda> pesquisarNanda(String query, String eixo) {
		NandaDAO dao = fabrica.getNandaDAO();
		return dao.pesquisarNanda(query, eixo);
	}
	
	public Nanda cadastrarNanda(Nanda nanda){
		NandaDAO dao = fabrica.getNandaDAO();
		return dao.persistir(nanda);
	}
	
	public void removerNanda(Nanda nanda){
		NandaDAO dao = fabrica.getNandaDAO();
		dao.remover(nanda);
	}
	
	public Nanda editarNanda(Nanda nanda){
		NandaDAO dao = fabrica.getNandaDAO();
		return dao.updateEntidade(nanda);
	}
	
	public Curso getCursoDoEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		CursoDAO dao = fabrica.getCursoDAO();
		return dao.getCursoDoEstudoDeCaso(estudoDeCaso);
	}
	
}
