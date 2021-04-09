package clin.handler;

import java.util.List;
import java.util.Map;

import javax.faces.component.UIComponent;
import javax.faces.event.ActionEvent;

import clin.dao.PacienteDaoImpl;
import clin.model.Paciente;
import clin.model.Usuario;

public class PacienteHandler {

	private Usuario usuario;
	private Paciente paciente = new Paciente();
	private PacienteDaoImpl pacienteDao;

	public PacienteDaoImpl getPacienteDao() {
		return pacienteDao;
	}

	public void setPacienteDao(PacienteDaoImpl pacienteDao) {
		this.pacienteDao = pacienteDao;
	}

	public void salvarPaciente(ActionEvent event) {
		UIComponent comp = event.getComponent();
		Map<String, Object> attrs = comp.getAttributes();
		Usuario usr = (Usuario) attrs.get("salvoPor");
		System.out.println(usr);
		System.out.println("NOMEEEEEEE " + usr);
		this.paciente.setSalvoPor(usuario);
		// this.paciente.setSalvoPor(this.usuario);
		pacienteDao.save(this.paciente);
		// DaoFactory factory = new DaoFactory();
		// Session session = HibernateUtil.getCurrentSession();
		// factory.beginTransaction();
		// DaoPaciente dao = new DaoPaciente(session);
		// try {
		// dao.adiciona(this.paciente);
		// factory.getDaoPaciente().adiciona(this.paciente);
		// factory.commit();
		// } catch (ExcecaoDoSistema e) {
		// factory.rollback();
		// return "falha";
		// } finally {
		// factory.close();
		// }
		

	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public List<Paciente> getPacientes() {
		// DaoFactory factory = new DaoFactory();
		System.out.println(pacienteDao == null);
		// new ArrayList<Paciente>();

		return this.pacienteDao.listarTudo();
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

}
