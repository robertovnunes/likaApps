package dados.basicas.atendimento.antecedentes;

import java.util.List;

import model.paciente.prontuario.atendimento.antecedentes.AntecedenteFamiliar;
import dados.DAOGenerico;

public interface AntecedenteFamiliarDAO extends DAOGenerico<AntecedenteFamiliar, Integer> {
	
	List<AntecedenteFamiliar> getAntecedentesFamiliarPorIdAntFamiliarPaciente(int idAntFamiliar);
	void removerAntecedenteFamiliarPorIdAntFamiliarPaciente(int idAntFamiliar);
}
