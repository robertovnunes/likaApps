package struts.acoes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Endereco;
import model.usuario.Aluno;
import model.usuario.Enfermeiro;
import model.usuario.Professor;
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

public class UsuarioAcoes extends DispatchAction {
	
	private static final String fUSUARIOADD = "fUsuarioAdd";
	private static final String fUSUARIOALUNOADD = "fUsuarioAlunoAdd";
	private static final String fUSUARIOEDIT = "fUsuarioEdit";
	private static final String fUSUARIOBUSCA = "fUsuarioBusca";
	private static final String fUSUARIOALTERARSENHA = "fUsuarioAlterarSenha";
	
	
	private Fachada fachada;
	
	public UsuarioAcoes(){
		fachada = Fachada.getInstancia();
	}
	
	public ActionForward mostrarTelaUsuarioAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOADD);
		return retorno;
	}
	
	public ActionForward mostrarTelaUsuarioAlunoAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOALUNOADD);
		return retorno;
	}
	
	public ActionForward mostrarTelaUsuarioEdit(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOEDIT);
		String id = ((DynaActionForm)form).getString("id");
		Usuario usuarioEdit = fachada.getPorId(Integer.parseInt(id));
		
		if(usuarioEdit instanceof Professor){
			Professor professor = (Professor) usuarioEdit;
			professor.setTipoUsuario(TipoUsuario.PROFESSOR);
			request.getSession().setAttribute("usuarioEdit", professor);
		}else if(usuarioEdit instanceof Enfermeiro){
			Enfermeiro enfermeiro = (Enfermeiro) usuarioEdit;
			enfermeiro.setTipoUsuario(TipoUsuario.ENFERMEIRO);
			request.getSession().setAttribute("usuarioEdit", enfermeiro);
		}else if(usuarioEdit instanceof Aluno){
			Aluno aluno = (Aluno) usuarioEdit;
			if(aluno.getTipo().equals(TipoUsuario.ALUNOENFERMARIA.toString())){
				aluno.setTipoUsuario(TipoUsuario.ALUNOENFERMARIA);
			}else{
				aluno.setTipoUsuario(TipoUsuario.ALUNOLABORATORIO);
			}
			request.getSession().setAttribute("usuarioEdit", aluno);
		}
		
		return retorno;
	}
	
	public ActionForward mostrarTelaUsuarioBuscar(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOBUSCA);
		ActionMessages errors = new ActionMessages();
		try{
			List<Usuario> usuarios = fachada.getTodosUsuarios();
			for (Usuario usuario : usuarios) {
				if(usuario instanceof Professor){
					usuario.setTipoUsuario(TipoUsuario.PROFESSOR);
				}else if(usuario instanceof Enfermeiro){
					usuario.setTipoUsuario(TipoUsuario.ENFERMEIRO);
				}else if(usuario instanceof Aluno){
					Aluno aluno = (Aluno) usuario;
					if(aluno.getTipo().equals(TipoUsuario.ALUNOENFERMARIA.toString())){
						usuario.setTipoUsuario(TipoUsuario.ALUNOENFERMARIA);
					}else{
						usuario.setTipoUsuario(TipoUsuario.ALUNOLABORATORIO);
					}
				}
			}
			
			request.getSession().setAttribute("usuarios", usuarios);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	public ActionForward buscarUsuarios(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOBUSCA);
		ActionMessages errors = new ActionMessages();
		try{
			String tipo = ((DynaActionForm)form).getString("tipoDeBusca");
			String valor = ((DynaActionForm)form).getString("tfBusca");
		
			List<Usuario> usuarios = fachada.getUsuariosPorConsulta(tipo, valor);
			request.getSession().setAttribute("usuarios", usuarios);
		}catch (Exception e) {
			e.printStackTrace();
			errors.add("ConexaoBDException", new ActionMessage("erro.sistema"));
			this.saveErrors(request, errors);
		}
		return retorno;
	}
	
	public ActionForward usuarioAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = null;
		
		String nome = ((DynaActionForm)form).getString("nome");
		String cpf = ((DynaActionForm)form).getString("cpf");
		String endereco = ((DynaActionForm)form).getString("endereco");
		String numero = ((DynaActionForm)form).getString("numero");
		String bairro = ((DynaActionForm)form).getString("bairro");
		String telefone = ((DynaActionForm)form).getString("telefone");
		String cep = ((DynaActionForm)form).getString("cep");
		String cidade = ((DynaActionForm)form).getString("cidade");
		String federacao = ((DynaActionForm)form).getString("federacao");
		String conselho = ((DynaActionForm)form).getString("conselho");
		String sexo = ((DynaActionForm)form).getString("sexo");
		String pto_referencia = ((DynaActionForm)form).getString("pto_referencia");
		String tipoUsuario = ((DynaActionForm)form).getString("restricaoAcesso");
		String login = ((DynaActionForm)form).getString("login");
		String senha = ((DynaActionForm)form).getString("senha");
		String confirmasenha = ((DynaActionForm)form).getString("confirmasenha");
		String acao = ((DynaActionForm)form).getString("acao");
		
		String erro = validarCampos(endereco, numero, bairro, cep, cidade, federacao, pto_referencia, nome, cpf, conselho, tipoUsuario, login, senha, confirmasenha, acao);
		
		if(erro.equals("")){
			if(acao.equals("usuarioAdd")){
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				try{
					if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString()) || tipoUsuario.equals(TipoUsuario.ALUNOLABORATORIO.toString())){
						Aluno aluno = new Aluno();
						aluno.setEndereco(end);
						aluno.setNome(nome);
						aluno.setCpf(cpf);
						aluno.setLogin(login);
						aluno.setSenha(senha);
						aluno.setTelefone(telefone);
						aluno.setSexo(sexo);
						if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString())){
							aluno.setTipo(TipoUsuario.ALUNOENFERMARIA.toString());
						}else{
							aluno.setTipo(TipoUsuario.ALUNOLABORATORIO.toString());
						}
						aluno = fachada.criarUsuarioAluno(aluno);
						request.getSession().setAttribute("usuarioRet", aluno);
					}else if(tipoUsuario.equals(TipoUsuario.ENFERMEIRO.toString())){
						Enfermeiro enfermeiro = new Enfermeiro();
						enfermeiro.setEndereco(end);
						enfermeiro.setCpf(cpf);
						enfermeiro.setNome(nome);
						enfermeiro.setLogin(login);
						enfermeiro.setSenha(senha);
						enfermeiro.setTelefone(telefone);
						enfermeiro.setConselho(conselho);
						enfermeiro.setSexo(sexo);
						enfermeiro = fachada.criarUsuarioEnfermeiro(enfermeiro);
						request.getSession().setAttribute("usuarioRet", enfermeiro);
					}else if(tipoUsuario.equals(TipoUsuario.PROFESSOR.toString())){
						Professor professor = new Professor();
						professor.setEndereco(end);
						professor.setCpf(cpf);
						professor.setNome(nome);
						professor.setLogin(login);
						professor.setSenha(senha);
						professor.setTelefone(telefone);
						professor.setConselho(conselho);
						professor.setSexo(sexo);
						professor = fachada.criarUsuarioProfessor(professor);
						request.getSession().setAttribute("usuarioRet", professor);
					}
					request.setAttribute("mensagem", "Usuário adicionado com sucesso!");
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}else{
				Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEdit");
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				end.setId(usuario.getEndereco().getId());
				
				if(usuario.getClass() == Professor.class){
					Professor professor = (Professor) usuario;
					professor.setEndereco(end);
					professor.setCpf(cpf);
					professor.setNome(nome);
					professor.setConselho(conselho);
					professor.setTelefone(telefone);
					professor.setSexo(sexo);
					fachada.criarUsuarioProfessor(professor);
					request.getSession().setAttribute("usuarioEdit", professor);
				}else if(usuario.getClass() == Enfermeiro.class){
					Enfermeiro enfermeiro = (Enfermeiro) usuario;
					enfermeiro.setEndereco(end);
					enfermeiro.setCpf(cpf);
					enfermeiro.setNome(nome);
					enfermeiro.setConselho(conselho);
					enfermeiro.setTelefone(telefone);
					enfermeiro.setSexo(sexo);
					fachada.criarUsuarioEnfermeiro(enfermeiro);
					request.getSession().setAttribute("usuarioEdit", enfermeiro);
				}else if(usuario.getClass() == Aluno.class){
					Aluno aluno = (Aluno) usuario;
					aluno.setEndereco(end);
					aluno.setNome(nome);
					aluno.setCpf(cpf);
					aluno.setTelefone(telefone);
					aluno.setSexo(sexo);
					fachada.criarUsuarioAluno(aluno);
					request.getSession().setAttribute("usuarioEdit", aluno);
				}
				
				request.setAttribute("mensagem", "Usuário editado com sucesso!");
			}
			
		}else{
			request.setAttribute("mensagem", erro);
			
			/*if(acao.equals("usuarioAdd")){
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				try{
					if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString()) || tipoUsuario.equals(TipoUsuario.ALUNOLABORATORIO.toString())){
						Aluno aluno = new Aluno();
						aluno.setEndereco(end);
						aluno.setNome(nome);
						aluno.setCpf(cpf);
						aluno.setLogin(login);
						aluno.setSenha(senha);
						aluno.setTelefone(telefone);
						aluno.setSexo(sexo);
						if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString())){
							aluno.setTipo(TipoUsuario.ALUNOENFERMARIA.toString());
						}else{
							aluno.setTipo(TipoUsuario.ALUNOLABORATORIO.toString());
						}
						request.getSession().setAttribute("usuarioRet", aluno);
					}else if(tipoUsuario.equals(TipoUsuario.ENFERMEIRO.toString())){
						Enfermeiro enfermeiro = new Enfermeiro();
						enfermeiro.setEndereco(end);
						enfermeiro.setCpf(cpf);
						enfermeiro.setNome(nome);
						enfermeiro.setLogin(login);
						enfermeiro.setSenha(senha);
						enfermeiro.setTelefone(telefone);
						enfermeiro.setConselho(conselho);
						enfermeiro.setSexo(sexo);
						request.getSession().setAttribute("usuarioRet", enfermeiro);
					}else if(tipoUsuario.equals(TipoUsuario.PROFESSOR.toString())){
						Professor professor = new Professor();
						professor.setEndereco(end);
						professor.setCpf(cpf);
						professor.setNome(nome);
						professor.setLogin(login);
						professor.setSenha(senha);
						professor.setTelefone(telefone);
						professor.setConselho(conselho);
						professor.setSexo(sexo);
						request.getSession().setAttribute("usuarioRet", professor);
					}
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}else{
				Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEdit");
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				end.setId(usuario.getEndereco().getId());
				
				if(usuario.getClass() == Professor.class){
					Professor professor = (Professor) usuario;
					professor.setEndereco(end);
					professor.setCpf(cpf);
					professor.setNome(nome);
					professor.setConselho(conselho);
					professor.setTelefone(telefone);
					professor.setSexo(sexo);
					request.getSession().setAttribute("usuarioEdit", professor);
				}else if(usuario.getClass() == Enfermeiro.class){
					Enfermeiro enfermeiro = (Enfermeiro) usuario;
					enfermeiro.setEndereco(end);
					enfermeiro.setCpf(cpf);
					enfermeiro.setNome(nome);
					enfermeiro.setConselho(conselho);
					enfermeiro.setTelefone(telefone);
					enfermeiro.setSexo(sexo);
					request.getSession().setAttribute("usuarioEdit", enfermeiro);
				}else if(usuario.getClass() == Aluno.class){
					Aluno aluno = (Aluno) usuario;
					aluno.setEndereco(end);
					aluno.setNome(nome);
					aluno.setCpf(cpf);
					aluno.setTelefone(telefone);
					aluno.setSexo(sexo);
					request.getSession().setAttribute("usuarioEdit", aluno);
				}
				
				request.setAttribute("mensagem", "Usuário editado com sucesso!"); 
			}*/
		}

		if(acao.equals("usuarioAdd")){
			retorno = map.findForward(fUSUARIOADD);
		}else{
			retorno = map.findForward(fUSUARIOEDIT);
		}
		
		return retorno;
	}
	
	public ActionForward usuarioAlunoAdd(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = null;
		
		String nome = ((DynaActionForm)form).getString("nome");
		String cpf = ((DynaActionForm)form).getString("cpf");
		String endereco = ((DynaActionForm)form).getString("endereco");
		String numero = ((DynaActionForm)form).getString("numero");
		String bairro = ((DynaActionForm)form).getString("bairro");
		String telefone = ((DynaActionForm)form).getString("telefone");
		String cep = ((DynaActionForm)form).getString("cep");
		String cidade = ((DynaActionForm)form).getString("cidade");
		String federacao = ((DynaActionForm)form).getString("federacao");
		String sexo = ((DynaActionForm)form).getString("sexo");
		String pto_referencia = ((DynaActionForm)form).getString("pto_referencia");
		String tipoUsuario = ((DynaActionForm)form).getString("restricaoAcesso");
		String login = ((DynaActionForm)form).getString("login");
		String senha = ((DynaActionForm)form).getString("senha");
		String confirmasenha = ((DynaActionForm)form).getString("confirmasenha");
		String acao = ((DynaActionForm)form).getString("acao");
		
		String erro = validarCampos(endereco, numero, bairro, cep, cidade, federacao, pto_referencia, nome, cpf, "", tipoUsuario, login, senha, confirmasenha, acao);
		
		if(erro.equals("")){
			if(acao.equals("usuarioAlunoAdd")){
				Endereco end = new Endereco(endereco, numero, bairro, cep, cidade, federacao, pto_referencia);
				try{
					if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString()) || tipoUsuario.equals(TipoUsuario.ALUNOLABORATORIO.toString())){
						Aluno aluno = new Aluno();
						aluno.setEndereco(end);
						aluno.setNome(nome);
						aluno.setCpf(cpf);
						aluno.setLogin(login);
						aluno.setSenha(senha);
						aluno.setTelefone(telefone);
						aluno.setSexo(sexo);
						if(tipoUsuario.equals(TipoUsuario.ALUNOENFERMARIA.toString())){
							aluno.setTipo(TipoUsuario.ALUNOENFERMARIA.toString());
						}else{
							aluno.setTipo(TipoUsuario.ALUNOLABORATORIO.toString());
						}
						aluno = fachada.criarUsuarioAluno(aluno);
						request.getSession().setAttribute("usuarioRet", aluno);
					}
					request.setAttribute("mensagem", "Usuário adicionado com sucesso!");
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}
			
		}else{
			request.setAttribute("mensagem", erro);
		}

		if(acao.equals("usuarioAlunoAdd")){
			retorno = map.findForward(fUSUARIOALUNOADD);
		}
		
		return retorno;
	}
	
	public ActionForward mostrarUsuarioAlterarSenha(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno =  map.findForward(fUSUARIOALTERARSENHA);
		return retorno;
	}
	
	public ActionForward usuarioAlterarSenha(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String senhaAntiga = ((DynaActionForm)form).getString("senhaAntiga");
		String senhaNova = ((DynaActionForm)form).getString("senhaNova");
		String senhaConfirmar = ((DynaActionForm)form).getString("senhaConfirmar");
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEdit");
		String erro = validarAlterarSenhaCampos(usuario.getSenha(), senhaAntiga, senhaNova, senhaConfirmar);
		
		if(erro.equals("")){
			usuario.setSenha(senhaNova);
			fachada.saveOrUpdateUsuario(usuario);
			request.getSession().setAttribute("usuarioEdit", usuario);
			request.setAttribute("mensagem", "Senha alterada com sucesso!");
		}else{
			request.setAttribute("mensagem", erro);
		}
		
		ActionForward retorno =  map.findForward(fUSUARIOALTERARSENHA);
		return retorno;
	}
	
	/**Métodos Privados*/
	private String validarAlterarSenhaCampos(String senhaUsuario, String senhaAntiga, String senhaNova, String senhaConfirmar){
		String erro = "";
		
		if(!senhaAntiga.equals(senhaUsuario)){
			erro += "Senha antiga do usuário inválida, ";
		}
		if(!senhaNova.equals(senhaConfirmar)){
			erro += "Confirmar Senha não confere com Senha Nova!";
		}
		
		return erro;
	}
	
	
	private String validarCampos(String endereco, String numero, String bairro,
			String cep, String cidade, String federacao, String pto_referencia,
			String nome, String cpf, String conselho, String tipoUsuario,
			String login, String senha, String confirmasenha, String acao) {
		String erro = "";
		
		if(endereco.equals("")){
			erro += " Endereço inválido ";
		}if(numero.equals("")){
			erro += " Número inválido ";
		}if(bairro.equals("")){
			erro += " Bairro inválido ";
		}if(cep.equals("")){
			erro += " CEP inválido ";
		}if(cidade.equals("")){
			erro += " Cidade inválida ";
		}if(federacao.equals("")){
			erro += " Estado inválido ";
		}if(nome.equals("")){
			erro += " Nome inválido ";
		}if(cpf.equals("")  && !acao.equals("usuarioAlunoAdd")){
			erro += " CPF inválido ";
		}if(conselho.equals("") && (tipoUsuario.equals(TipoUsuario.PROFESSOR.toString()) || tipoUsuario.equals(TipoUsuario.ENFERMEIRO.toString()))){
			erro += " Conselho inválido ";
		}if(login.equals("") && acao.equals("usuarioAdd")){
			erro += " Login inválido ";
		}if(numero.equals("")){
			erro += " Número inválido ";
		}if(senha.equals("") && acao.equals("usuarioAdd")){
			erro += " Senha inválida ";
		}if(!senha.equals(confirmasenha) && acao.equals("usuarioAdd")){
			erro += " Senhas não conferem ";
		}if(!senha.equals(confirmasenha) && acao.equals("usuarioAlunoAdd")){
			erro += " Senhas não conferem ";
		}
		
		return erro;
	}

}
