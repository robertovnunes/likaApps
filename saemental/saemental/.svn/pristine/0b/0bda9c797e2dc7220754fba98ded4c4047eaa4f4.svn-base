package dados.basicas.atendimento;

import java.util.List;

import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.AvaliacaoProfessor;
import dados.DAOGenerico;

public interface AvaliacaoProfessorDAO extends DAOGenerico<AvaliacaoProfessor, Integer> {

	public List<AvaliacaoProfessor> getAvaliacaoProfessorAtendimento(Atendimento atendimento);
	public List<AvaliacaoProfessor> getAvaliacaoProfessorPorConsulta(String tipo, String valor, Atendimento atendimento);
	public AvaliacaoProfessor getAvaliacaoProfessorPorId(String id);
}
