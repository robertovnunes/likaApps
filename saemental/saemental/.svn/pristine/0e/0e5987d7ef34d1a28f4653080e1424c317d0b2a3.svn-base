package dados.basicas.atendimento;

import java.util.List;

import model.paciente.prontuario.atendimento.Adendo;
import model.paciente.prontuario.atendimento.Atendimento;
import dados.DAOGenerico;

public interface AdendoDAO extends DAOGenerico<Adendo, Integer> {

	public List<Adendo> getAdendosAtendimento(Atendimento atendimento);
	public List<Adendo> getAdendosPorConsulta(String tipo, String valor, Atendimento atendimento);
	public Adendo getAdendoPorId(String id);
}
