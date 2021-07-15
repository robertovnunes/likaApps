package dao.jpa;

import genericos.implementacao.DAOGenericoJPA;
import model.AlunoEstudoCaso;
import model.Avaliacao;
import dao.AvaliacaoDAO;



public class AvaliacaoJPADAO extends DAOGenericoJPA<Avaliacao,Integer> 
implements AvaliacaoDAO {

	@Override
	public Avaliacao getAvaliacaoPorAlunoEstudoCaso(AlunoEstudoCaso aec) {
		
		Avaliacao retorno = null;
		
		String query = "SELECT a.* FROM avaliacao a WHERE a.alunoestudocaso_id = "+ aec.getId() +";";
		
		retorno = executarQueryObjeto(query);
		
		return retorno;
	}

	@Override
	public Avaliacao getPorId(int id) {
		
		return this.getManager().find(Avaliacao.class, id);
	}

}
