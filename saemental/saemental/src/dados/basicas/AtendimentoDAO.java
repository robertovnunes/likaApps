package dados.basicas;

import java.util.List;

import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Atendimento;
import dados.DAOGenerico;

public interface AtendimentoDAO extends DAOGenerico<Atendimento, Integer>{

	public List<Atendimento> getTodosAtendimentos(int idProntuario);
	public List<Atendimento> getAtendimentosPacientePorConsulta(String tipo, String valor, int idPront);
	public Atendimento getUltimoAtendimento(int idProntuario);
	public Admissao getultimoAtendimentoAdmissao(int idProntuario);
}
