package struts.acoes;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Endereco;
import model.paciente.Paciente;
import model.paciente.prontuario.Prontuario;
import model.paciente.prontuario.atendimento.Admissao;
import model.paciente.prontuario.atendimento.Atendimento;
import model.paciente.prontuario.atendimento.Evolucao;
import model.paciente.prontuario.atendimento.TipoAtendimento;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import fachada.Fachada;

public class PacienteAcoes extends DispatchAction  {
	
	private static final String fPACIENTEADD = "fPacienteAdd";
	private static final String fPACIENTEBUSCA = "fPacienteBusca";
	private static final String fPACIENTEEDITAR = "fPacienteEditar";
	private static final String fPACIENTEATENDIMENTOS = "fPacienteAtendimentos";

	private Fachada fachada;
	
	public PacienteAcoes(){
		fachada = Fachada.getInstancia();
	}
	
	public ActionForward pacienteAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = null;
		
		String nome = ((DynaActionForm)form).getString("nome");
		String cpf = ((DynaActionForm)form).getString("cpf");
		String numeroProntuario = ((DynaActionForm)form).getString("numeroProntuario");
		String filiacao = ((DynaActionForm)form).getString("filiacao");
		String inputDate = ((DynaActionForm)form).getString("inputDate");
		String idade = ((DynaActionForm)form).getString("idade");
		String sexo = ((DynaActionForm)form).getString("sexo");
		String raca = ((DynaActionForm)form).getString("raca");
		String telefone = ((DynaActionForm)form).getString("telefone");
		String endereco = ((DynaActionForm)form).getString("endereco");
		String numero = ((DynaActionForm)form).getString("numero");
		String bairro = ((DynaActionForm)form).getString("bairro");
		String cep = ((DynaActionForm)form).getString("cep");
		String cidade = ((DynaActionForm)form).getString("cidade");
		String federacao = ((DynaActionForm)form).getString("federacao");
		String pto_referencia = ((DynaActionForm)form).getString("pto_referencia");
		String estado_civil = ((DynaActionForm)form).getString("estado_civil");
		String religiao = ((DynaActionForm)form).getString("religiao");
		String profissao = ((DynaActionForm)form).getString("profissao");

		String num_filhos = ((DynaActionForm)form).getString("num_filhos");
		String escolaridade = ((DynaActionForm)form).getString("escolaridade");
		String acao = ((DynaActionForm)form).getString("acao");
		
		String erro = validarCampos(nome, numeroProntuario, inputDate, cpf, idade, endereco, numero, cep, bairro, cidade, num_filhos, profissao, escolaridade, acao);
		
		if(erro.equals("")){
			if(acao.equals("pacienteAdd")){
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				try{
					Paciente paciente = new Paciente();
					paciente.setEndereco(end);
					paciente.setNome(nome);
					paciente.setCpf(cpf);
					paciente.setEscolaridade(escolaridade);
					
					if(num_filhos != null && !num_filhos.equals("")){
						paciente.setQtdFilhos(Integer.parseInt(num_filhos));
					}else{
						paciente.setQtdFilhos(0);
					}
					
					paciente.setNascimento(inputDate);
					paciente.setTelefone(telefone);
					paciente.setSexo(sexo);
					paciente.setNomeMae(filiacao);
					Prontuario prontuario = new Prontuario();
					prontuario.setNumero(numeroProntuario);
					paciente.setProntuario(prontuario);
					paciente.setIdade(idade);
					paciente.setReligiao(religiao);
					paciente.setEstadoCivil(estado_civil);
					paciente.setRaca(raca);
					paciente.setProfissao(profissao);
					paciente.setDataCriacao(new Date());
					Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
					paciente.setUsuario(usuario);
					paciente = fachada.inserirPaciente(paciente);
					request.setAttribute("pacienteRet", paciente);
					request.setAttribute("mensagem", "Paciente adicionado com sucesso!");
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}else if(acao.equals("pacienteEditar")){
				try{
					Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
					
					Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
					end.setId(paciente.getEndereco().getId());

					paciente.setEndereco(end);
					paciente.setNome(nome);
					paciente.setCpf(cpf);
					paciente.setEscolaridade(escolaridade);
					
					if(num_filhos != null && !num_filhos.equals("")){
						paciente.setQtdFilhos(Integer.parseInt(num_filhos));
					}else{
						paciente.setQtdFilhos(0);
					}
					
					paciente.setNascimento(inputDate);
					paciente.setTelefone(telefone);
					paciente.setSexo(sexo);
					paciente.setNomeMae(filiacao);
					paciente.setIdade(idade);
					paciente.setReligiao(religiao);
					paciente.setEstadoCivil(estado_civil);
					paciente.setRaca(raca);
					paciente.setProfissao(profissao);
					paciente.setDataCriacao(new Date());
					paciente = fachada.inserirPaciente(paciente);
					request.setAttribute("mensagem", "Paciente editado com sucesso!");
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}
			
		}else{
			request.setAttribute("mensagem", erro);
			
			if(acao.equals("pacienteAdd")){
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
					Paciente paciente = new Paciente();
					paciente.setEndereco(end);
					paciente.setNome(nome);
					paciente.setCpf(cpf);
					paciente.setEscolaridade(escolaridade);
					paciente.setNascimento(inputDate);
					paciente.setTelefone(telefone);
					paciente.setSexo(sexo);
					paciente.setNomeMae(filiacao);
					Prontuario prontuario = new Prontuario();
					prontuario.setNumero(numeroProntuario);
					paciente.setProntuario(prontuario);
					paciente.setIdade(idade);
					paciente.setReligiao(religiao);
					paciente.setEstadoCivil(estado_civil);
					paciente.setRaca(raca);
					paciente.setProfissao(profissao);
					paciente.setDataCriacao(new Date());
					Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
					paciente.setUsuario(usuario);
					request.setAttribute("pacienteRet", paciente);
					
			}else if(acao.equals("pacienteEditar")){
					Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
					
					Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
					end.setId(paciente.getEndereco().getId());

					paciente.setEndereco(end);
					paciente.setNome(nome);
					paciente.setCpf(cpf);
					paciente.setEscolaridade(escolaridade);
					paciente.setNascimento(inputDate);
					paciente.setTelefone(telefone);
					paciente.setSexo(sexo);
					paciente.setNomeMae(filiacao);
					paciente.setIdade(idade);
					paciente.setReligiao(religiao);
					paciente.setEstadoCivil(estado_civil);
					paciente.setRaca(raca);
					paciente.setProfissao(profissao);
					paciente.setDataCriacao(new Date());
					request.setAttribute("pacienteRet", paciente);
					
			}
		}
		
		if(acao.equals("pacienteEditar")){
			retorno = map.findForward(fPACIENTEEDITAR);
		}else{
			retorno = map.findForward(fPACIENTEADD);
		}
		
		return retorno;
	}
	
	public ActionForward mostrarTelaPacienteAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fPACIENTEADD);
		return retorno;
	}
	
	public ActionForward pacienteBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fPACIENTEBUSCA);
		ActionMessages errors = new ActionMessages();
		try{
			String tipo = ((DynaActionForm)form).getString("tipoDeBusca");
			String valor = ((DynaActionForm)form).getString("tfBusca");
		
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			if(!usuario.getTipoUsuario().equals(TipoUsuario.ALUNOLABORATORIO)){
				List<Paciente> pacientes = fachada.getPacientesPorConsulta(tipo, valor);
				request.getSession().setAttribute("pacientes", pacientes);
			}else{
				List<Paciente> pacientes = fachada.getPacientesDoUsuarioPorConsulta(tipo, valor, usuario);
				request.getSession().setAttribute("pacientes", pacientes);
			}
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	public ActionForward mostrarTelaPacienteBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = map.findForward(fPACIENTEBUSCA);
		ActionMessages errors = new ActionMessages();
		try{
			Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
			if(!usuario.getTipoUsuario().equals(TipoUsuario.ALUNOLABORATORIO)){
				List<Paciente> pacientes = fachada.getTodosPacientes();
				request.getSession().setAttribute("pacientes", pacientes);
			}else {
				List<Paciente> pacientes = fachada.getPacientesDoUsuario(usuario);
				request.getSession().setAttribute("pacientes", pacientes);
			}
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	public ActionForward mostrarTelaPacienteEditar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fPACIENTEEDITAR);
		String id = ((DynaActionForm)form).getString("id");
		Paciente paciente = fachada.buscarPacientePorId(new Integer(id), true);
		request.getSession().setAttribute("paciente", paciente);
		
		return retorno;
	}
	
	public ActionForward antedimentosPaciente(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = ((DynaActionForm)form).getString("id");
		Paciente paciente = fachada.buscarPacientePorId(new Integer(id), true);
		request.getSession().setAttribute("paciente", paciente);
		List<Atendimento> atendimentos = fachada.getTodosAtendimentos(paciente.getProntuario().getId());
		for (Atendimento atendimento : atendimentos) {
			if(atendimento.getClass() == Admissao.class){
				Admissao admissao = (Admissao) atendimento;
				if(admissao.getEhReadmissao()){
					atendimento.setTipo(TipoAtendimento.READMISSAO);
				}else{
					atendimento.setTipo(TipoAtendimento.ADMISSAO);
				}
			}else if(atendimento.getClass() == Evolucao.class){
				atendimento.setTipo(TipoAtendimento.EVOLUCAO);
			}
			
			int qtdAdendo = fachada.getAdendosAtendimento(atendimento).size();
			int qtdAvaliacao = fachada.getAvaliacaoProfessorAtendimento(atendimento).size();
			
			if(qtdAvaliacao != 0){
				atendimento.setPossuiAvaliacao(true);
			}
			
			if(qtdAdendo != 0){
				atendimento.setPossuiAdendo(true);
			}
		}
		request.getSession().setAttribute("atendimentos", atendimentos);
		ActionForward retorno = map.findForward(fPACIENTEATENDIMENTOS);
		return retorno;
	}
	
	public ActionForward atendimentoBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fPACIENTEATENDIMENTOS);
		ActionMessages errors = new ActionMessages();
		try{
			String tipo = ((DynaActionForm)form).getString("tipoDeBusca");
			String valor = ((DynaActionForm)form).getString("tfBusca");
			
			Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
			int idPront = paciente.getProntuario().getId();
		
			List<Atendimento> atendimentos = fachada.getAtendimentosPacientePorConsulta(tipo, valor, idPront);
			for (Atendimento atendimento : atendimentos) {
				if(atendimento.getClass() == Admissao.class){
					Admissao admissao = (Admissao) atendimento;
					if(admissao.getEhReadmissao()){
						atendimento.setTipo(TipoAtendimento.READMISSAO);
					}else{
						atendimento.setTipo(TipoAtendimento.ADMISSAO);
					}
				}else if(atendimento.getClass() == Evolucao.class){
					atendimento.setTipo(TipoAtendimento.EVOLUCAO);
				}
			}
			request.getSession().setAttribute("atendimentos", atendimentos);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	/**Métodos Privados*/
	private String validarCampos(String nome,String numeroProntuario, String inputDate, String cpf,String idade, String endereco, 
			String numero, String cep, String bairro, String cidade, String num_filhos, String profissao, String escolaridade, String acao) {
		String erro = "";
		
		if(endereco.equals("")){
			erro += " Endereço inválido, ";
		}if(numero.equals("")){
			erro += " Número inválido, ";
		}if(bairro.equals("")){
			erro += " Bairro inválido, ";
		}if(cep.equals("")){
			erro += " CEP inválido, ";
		}if(cidade.equals("")){
			erro += " Cidade inválida, ";
		}if(num_filhos.equals("")){
			erro += " Número de filhos inválido, ";
		}if(nome.equals("")){
			erro += " Nome inválido, ";
		}if(numeroProntuario.equals("") && acao.equals("pacienteAdd")){
			erro += " Número do Prontuário inválido, ";
		}if(inputDate.equals("")){
			erro += " Data de nasimento inválida, ";
		}if(idade.equals("")){
			erro += " Idade inválido, ";
		}if(numero.equals("")){
			erro += " Número inválido, ";
		}if(profissao.equals("")){
			erro += " Profissão inválida, ";
		}if(escolaridade.equals("")){
			erro += " Escolaridade inválida, ";
		}
		
		return erro;
	}
	
}
