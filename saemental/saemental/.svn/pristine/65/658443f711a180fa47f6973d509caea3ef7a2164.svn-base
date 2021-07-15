package dados.basicas;

import java.util.List;

import model.paciente.Paciente;
import model.usuario.Usuario;
import dados.DAOGenerico;

public interface PacienteDAO extends DAOGenerico<Paciente, Integer> {

	public List<Paciente> getPacientesPorConsulta(String tipo, String valor);
	public List<Paciente> getPacientesDoUsuario(Usuario usuario);
	public List<Paciente> getPacientesDoUsuarioPorConsulta(String tipo, String valor, Usuario usuario);
}
