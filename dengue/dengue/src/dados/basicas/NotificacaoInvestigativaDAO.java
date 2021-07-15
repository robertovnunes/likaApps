package dados.basicas;

import java.util.List;

import model.fichainvestigativa.NotificacaoInvestigativa;
import dados.DAOGenerico;

public interface  NotificacaoInvestigativaDAO extends DAOGenerico<NotificacaoInvestigativa, Integer>{

	public List<NotificacaoInvestigativa> getNotificacaoInvestigativaPorConsulta(String tipo, String valor);
	public List<NotificacaoInvestigativa> pesquisarNotificacaoInvestigativa(String cep,	String pais, String estado,	String cidade, 	String bairro,	String dataInicial,	String dataFinal,	String autocomplete, String classico, String complicacoes,	String fhd,	String scd,	String descartado);
		
}
