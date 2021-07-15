package dados.basicas.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Intervencoes;
import dados.DAOGenerico;

public interface IntervencoesDAO extends DAOGenerico<Intervencoes, Integer> {

	public List<Intervencoes> listarIntervencoesDiagnostico(Diagnostico diagnostico);
}
