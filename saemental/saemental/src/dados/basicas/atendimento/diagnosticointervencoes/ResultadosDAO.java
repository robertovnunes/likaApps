package dados.basicas.atendimento.diagnosticointervencoes;

import java.util.List;

import model.paciente.prontuario.atendimento.diagnosticointervencoes.Diagnostico;
import model.paciente.prontuario.atendimento.diagnosticointervencoes.Resultados;
import dados.DAOGenerico;

public interface ResultadosDAO extends DAOGenerico<Resultados, Integer> {

	public List<Resultados> listarResultadosDiagnostico(Diagnostico diagnostico);
}
