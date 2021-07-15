package dados.basicas.atendimento.queixa;

import java.util.List;

import model.paciente.prontuario.atendimento.queixa.Cid;
import model.paciente.prontuario.atendimento.queixa.Queixa;
import dados.DAOGenerico;

public interface QueixaDAO extends DAOGenerico<Queixa, Integer> {
	List<Cid> getCids(int idQueixa);
	Cid getCidPorId(int idCid);
	Cid getCidPorIdentificador(String cid);
	List<Cid> pesquisarCid(String valor);
}
