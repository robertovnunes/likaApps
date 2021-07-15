package dados.hibernate.conteudo;

import java.util.List;

import model.fichainvestigativa.NotificacaoInvestigativa;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import dados.basicas.NotificacaoInvestigativaDAO;
import dados.hibernate.DAOGenericoHibernate;

public class NotificacaoInvestigativaHibernateDAO extends
		DAOGenericoHibernate<NotificacaoInvestigativa, Integer> implements NotificacaoInvestigativaDAO {

	
	@Override
	public List<NotificacaoInvestigativa> getNotificacaoInvestigativaPorConsulta(String tipo, String valor) {
		Criteria crit = getSession().createCriteria(NotificacaoInvestigativa.class);
		
		if(tipo != null && !valor.equals("")){
				if(tipo.equals("id")){
					crit.add(Restrictions.idEq(Integer.parseInt(valor)));
				}else if(tipo.equals("investigador")){
					crit.createAlias("investigador", "investigador");
					crit.add(Restrictions.ilike("investigador.nome", "%"+valor+"%"));
  				}else if(tipo.equals("cidade")){
  					crit.createAlias("dadosGerais", "dadosGerais");
  					crit.createAlias("dadosGerais.cidade", "cidade");
					crit.add(Restrictions.ilike("cidade.descricao",  "%"+valor+"%"));
				}else if(tipo.equals("unidadeSaude")){
					crit.createAlias("dadosGerais", "dadosGerais");
					crit.createAlias("dadosGerais.unidadeSaude", "unidadeSaude");
					crit.add(Restrictions.ilike("unidadeSaude.nome_fantasia", "%"+valor+"%"));
				}  
		}
		return crit.list();
	}

	@Override
	public List<NotificacaoInvestigativa> pesquisarNotificacaoInvestigativa(
			String cep, String pais, String estado, String cidade,
			String bairro, String dataInicial, String dataFinal,
			String autocomplete, String classico, String complicacoes,
			String fhd, String scd, String descartado) {
		
		String hql = "SELECT notificacao FROM NotificacaoInvestigativa notificacao inner join notificacao.conclusao as conclusao WHERE conclusao.latitude is not null and conclusao.longitude is not null ";
		
		
		if(classico == null || classico.equals("") || classico.equals("off")){
			hql  += " and conclusao.classificacao <> 1 ";
		}
		
		if(complicacoes == null || complicacoes.equals("") || complicacoes.equals("off")){
			hql  += " and conclusao.classificacao <> 2 ";
		}
		
		if(fhd == null || fhd.equals("")|| fhd.equals("off")){
			hql  += " and conclusao.classificacao <> 3 ";
		}
		
		if(scd == null || scd.equals("")|| scd.equals("off")){
			hql  += " and conclusao.classificacao <> 4 ";
		}
		
		if(descartado == null || descartado.equals("")|| descartado.equals("off")){
			hql  += " and conclusao.classificacao <> 5 ";
		}
		
	/*	if(cep != null && !cep.equals("")){
			hql += " and conclusao.logradouro.cep = " + cep;
		}*/
		Query query = getSession().createQuery(hql);
		
		return query.list();
	}
}
