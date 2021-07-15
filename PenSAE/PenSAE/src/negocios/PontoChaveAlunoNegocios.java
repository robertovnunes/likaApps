package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import model.AlunoEstudoCaso;
import model.EstudoCaso;
import model.PontoChaveAluno;
import model.Usuario;
import dao.AlunoEstudoCasoDAO;
import dao.PontoChaveAlunoDAO;



public class PontoChaveAlunoNegocios {

	private static FabricaDAO fabrica;

	static PontoChaveAlunoNegocios instancia;

	public static PontoChaveAlunoNegocios getInstancia(){

		if(PontoChaveAlunoNegocios.instancia == null){

			PontoChaveAlunoNegocios.instancia = new PontoChaveAlunoNegocios();

		}

		return PontoChaveAlunoNegocios.instancia;
	}

	public static List<PontoChaveAluno> listaPontoChaveAlunoPorEstudoCaso(
			EstudoCaso estudoSelecionado) {
		
		List<PontoChaveAluno> retorno = null;
		
		PontoChaveAlunoDAO pontoChaveAlunoDAO = fabrica.getPontoChaveAlunoDAO();
		
		retorno = pontoChaveAlunoDAO.listarPontoChaveAlunoPorEstudoCaso(estudoSelecionado);
		
		return retorno;
	}

	private PontoChaveAlunoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();

	}

	public boolean excluirPontoChaveAluno(PontoChaveAluno determinante){
		boolean retorno = false;

		try{

			PontoChaveAlunoDAO dao = fabrica.getPontoChaveAlunoDAO();

			determinante = dao.getPorId(determinante.getId());

			dao.remover(determinante);

			retorno = true;

		}catch(Exception e){
			e.printStackTrace();
		}

		return retorno;
	}

	public List<PontoChaveAluno> getPontoChaveAluno(Usuario p, EstudoCaso ec){

		List<PontoChaveAluno> retorno = null;
		AlunoEstudoCaso instancia = null;
		try {

			AlunoEstudoCasoDAO daoAlunoEstudoCaso = fabrica.getAlunoEstudoCasoDAO();

			instancia = daoAlunoEstudoCaso.getAlunoEstudoCaso(p, ec);

			if(instancia != null){
				PontoChaveAlunoDAO dao = fabrica.getPontoChaveAlunoDAO();

				retorno = (List<PontoChaveAluno>) dao.listarPontoChaveAlunoPorAlunoEstudoCaso(instancia);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return retorno;
	}

	public List<PontoChaveAluno> listarPontoChaveAlunoAlunoEstudoCaso(AlunoEstudoCaso aec){

		List<PontoChaveAluno> retorno = null;
		try {
			PontoChaveAlunoDAO dao = fabrica.getPontoChaveAlunoDAO();

			retorno = (List<PontoChaveAluno>) dao.listarPontoChaveAlunoPorAlunoEstudoCaso(aec);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return retorno;
	}

	public boolean salvarPontoChaveAluno(List<PontoChaveAluno> determinantes, Usuario u, EstudoCaso ec){

		boolean retorno = false;
		AlunoEstudoCaso instancia = null;
		try {

			AlunoEstudoCasoDAO dao = fabrica.getAlunoEstudoCasoDAO();

			instancia = dao.getAlunoEstudoCaso(u, ec);

			if(instancia != null){

				Set<PontoChaveAluno> respostas = instancia.getPontochavealunos();

				Iterator<PontoChaveAluno> iteradorDeterminantes = determinantes.iterator();

				boolean achouNoBanco = false;

				PontoChaveAlunoDAO daoRespostas = fabrica.getPontoChaveAlunoDAO();

				while(iteradorDeterminantes.hasNext()){

					Iterator<PontoChaveAluno> iteradorRespostas= respostas.iterator();

					PontoChaveAluno determinante = (PontoChaveAluno) iteradorDeterminantes.next();

					determinante.setAlunoestudocaso(instancia);
					achouNoBanco = false;

					while(iteradorRespostas.hasNext() && !achouNoBanco){

						PontoChaveAluno resposta = (PontoChaveAluno) iteradorRespostas.next();

						if(resposta.getId() == determinante.getId()){

							respostas.remove(resposta);

							resposta.setNome(determinante.getNome());
							resposta.setJustificativa(determinante.getJustificativa());

							respostas.add(resposta);

							achouNoBanco = true;
						}
					};

					respostas.add(determinante);

					daoRespostas.persistir(determinante);
				}

			}else{

				instancia = new AlunoEstudoCaso();

				instancia.setAluno(u.getAlunos().iterator().next());
				instancia.setEstudocaso(ec);

				dao.persistir(instancia);

				Iterator<PontoChaveAluno> iterador = determinantes.iterator();

				while(iterador.hasNext()){
					iterador.next().setAlunoestudocaso(instancia);
				}

				instancia.setPontochavealunos(new HashSet<>(determinantes));

				dao.persistir(instancia);
			}

			retorno = true;

		} catch (Exception e) {

			e.printStackTrace();
			retorno = false;
		}

		return retorno;
	}

}
