package negocios;

import genericos.FabricaDAO;
import genericos.implementacao.FabricaJPADAO;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import model.Aluno;
import model.Professor;
import model.Usuario;
import model.UsuarioHasIdioma;
import dao.AlunoDAO;
import dao.UsuarioDAO;
import dao.UsuarioHasIdiomaDAO;


public class AlunoNegocios {

	private static AlunoNegocios instancia;
	public static AlunoNegocios getInstancia(){
		if(AlunoNegocios.instancia == null){
			AlunoNegocios.instancia = new AlunoNegocios();
		}
		return AlunoNegocios.instancia;
	}

	private FabricaDAO fabrica;

	private AlunoNegocios() {

		fabrica = FabricaJPADAO.getInstancia();
	}

	public void editarAluno(Aluno a, List<UsuarioHasIdioma> phiRecebidos){

		Aluno alunoEditar = null;
		Usuario pessoaEditar = null;
		List <UsuarioHasIdioma> phiOriginais = null;

		AlunoDAO alunoDao = fabrica.getAlunoDAO();
		UsuarioDAO pessoaDao = fabrica.getUsuarioDAO();
		UsuarioHasIdiomaDAO phiDao = fabrica.getUsuarioHasIdiomaDAO();

		List<UsuarioHasIdioma> phiFinal = new ArrayList<UsuarioHasIdioma>();

		try{
			phiOriginais = phiDao.getPessoaHasIdiomasPorUsuario(a.getUsuario().getId());

			if(phiOriginais.size() == 0){

				for(int i = 0; i < phiRecebidos.size(); i++){
					phiFinal.add(phiRecebidos.get(i));
					phiDao.persistir(phiRecebidos.get(i));
				}

			}else{

				
				boolean achouIdioma = false;

				for (Iterator<UsuarioHasIdioma> iteratorRecebidos = phiRecebidos.iterator(); 
						iteratorRecebidos.hasNext();) {
					UsuarioHasIdioma pessoaHasIdioma = (UsuarioHasIdioma) iteratorRecebidos
							.next();

					for (Iterator<UsuarioHasIdioma> iteratorOriginais = phiOriginais.iterator(); 
							(iteratorOriginais.hasNext() && !achouIdioma);) {

						UsuarioHasIdioma pessoaHasIdiomaUpdate = (UsuarioHasIdioma) iteratorOriginais
								.next();

						if(pessoaHasIdioma.getId() == pessoaHasIdiomaUpdate.getId()){

							phiOriginais.remove(pessoaHasIdiomaUpdate);

							//pessoaHasIdiomaUpdate.setScore(pessoaHasIdioma.getScore());
							
							//Salvando modificao
							phiDao.persistir(pessoaHasIdiomaUpdate);
							
							phiFinal.add(pessoaHasIdiomaUpdate);
							achouIdioma = true;
						}
					}

					if(!achouIdioma){
						phiFinal.add(pessoaHasIdioma);
						//Salvando uma modificao em cima de um que ja existia, mas foi modificado o idioma
						phiDao.persistir(pessoaHasIdioma);
					}
					
					achouIdioma = false;

				}

				for (Iterator<UsuarioHasIdioma> iteratorDeletados = phiOriginais.iterator(); 
						iteratorDeletados.hasNext();) {

					UsuarioHasIdioma pessoaHasIdiomaDelete = (UsuarioHasIdioma) iteratorDeletados
							.next();
					//Deletando o idioma que foi modificado o idioma ou deletado completamente
					phiDao.remover(pessoaHasIdiomaDelete);
				}

			}

			pessoaEditar = pessoaDao.getUsuarioPorLogin(a.getUsuario().getLogin());

			if(pessoaEditar != null){

				pessoaEditar.setSenha(a.getUsuario().getSenha());

				pessoaEditar.setDataNascimento(a.getUsuario().getDataNascimento());
				pessoaEditar.setEstadoCivil(a.getUsuario().getEstadoCivil());
				pessoaEditar.setNumFilhos(a.getUsuario().getNumFilhos());
				pessoaEditar.setRendaFamiliar(a.getUsuario().getRendaFamiliar());
				pessoaEditar.setSexo(a.getUsuario().getSexo());

				pessoaEditar.setUsuarioHasIdiomas(new HashSet<>(phiFinal));
				
				pessoaDao.persistir(pessoaEditar);

			}

			alunoEditar = alunoDao.getAlunoPorUsuario(a.getUsuario());

			if(alunoEditar != null){

				alunoEditar.setPossuiExperiencia(a.getPossuiExperiencia());
				alunoEditar.setExisteReprovacao(a.getExisteReprovacao());
				alunoEditar.setQualReprovacao(a.getQualReprovacao());
				alunoEditar.setAtividadesExtras(a.getAtividadesExtras());
				alunoEditar.setQualAtividadesExtras(a.getQualAtividadesExtras());
				alunoEditar.setQualEstrategiaEstudo(a.getQualEstrategiaEstudo());
				alunoEditar.setQualLocalEstudo(a.getQualLocalEstudo());
				alunoEditar.setQuantasHorasEstudo(a.getQuantasHorasEstudo());
				alunoEditar.setMotivado(a.getMotivado());
				alunoEditar.setTipoEstiloAprendizagem(a.getTipoEstiloAprendizagem());
				alunoEditar.setEstiloAprendizagem(a.getEstiloAprendizagem());

				alunoDao.persistir(alunoEditar);

			}


		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public List<Usuario> getAlunoPorProfessor(Professor professor) {
		List<Usuario> retorno = null;
		
		AlunoDAO dao = fabrica.getAlunoDAO();
		retorno = dao.getAlunoPorProfessor(professor);
	
		return retorno;
	}

	public Aluno getAlunoPorUsuario(Usuario u){

		Aluno retorno = null;

		AlunoDAO dao = fabrica.getAlunoDAO();

		retorno = dao.getAlunoPorUsuario(u);

		return retorno;
	}

	public void salvarAluno(Aluno a){

		AlunoDAO alunoDao = fabrica.getAlunoDAO();

		alunoDao.persistir(a);
	}

}
