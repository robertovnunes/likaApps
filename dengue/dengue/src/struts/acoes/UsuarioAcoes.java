package struts.acoes;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.endereco.Bairro;
import model.endereco.Cidade;
import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.Residencia;
import model.endereco.UF;
import model.sistema.Arquivo;
import model.usuario.TipoUsuario;
import model.usuario.Usuario;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import util.SigGen;
import fachada.Fachada;

public class UsuarioAcoes extends DispatchAction {
	
	private static final String fUSUARIOADD = "fUsuarioAdd";
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
		
		List<UF> estados = fachada.getTodosEstados();
		List<Pais> paises = fachada.getTodosPaises();
		request.getSession().setAttribute("estados", estados);
		request.getSession().setAttribute("paises", paises);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		
		request.getSession().setAttribute("usuarioRet", null);
		
		return retorno;
	}
	
	public ActionForward mostrarTelaUsuarioEdit(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward retorno = map.findForward(fUSUARIOEDIT);
		
		List<UF> estados = fachada.getTodosEstados();
		List<Pais> paises = fachada.getTodosPaises();
		request.getSession().setAttribute("estados", estados);
		request.getSession().setAttribute("paises", paises);
		
		String id = ((DynaActionForm)form).getString("id");
		Usuario usuarioEdit = fachada.getPorId(Integer.parseInt(id));
		Usuario usuario = (Usuario) usuarioEdit;
		request.getSession().setAttribute("usuarioEdit", usuario);
		
		if(usuarioEdit.getResidencia().getLogradouro() != null
				&& usuarioEdit.getResidencia().getLogradouro().getBairro() != null){
			List<Cidade> cidades = fachada.getCidadesPorUF(usuarioEdit.getResidencia().getLogradouro().getBairro().getCidade().getEstado().getCodigo() + "");
			request.getSession().setAttribute("cidades", cidades);
			List<Bairro> bairros = fachada.getBairroPorCidade(usuarioEdit.getResidencia().getLogradouro().getBairro().getCidade().getCodigo_cidade()+ "");
			request.getSession().setAttribute("bairros", bairros);
			usuarioEdit.getResidencia().setCidade(usuarioEdit.getResidencia().getLogradouro().getBairro().getCidade());
			usuarioEdit.getResidencia().setEstado(usuarioEdit.getResidencia().getLogradouro().getBairro().getCidade().getEstado());
		}
		
		if(usuarioEdit.getResidencia().getEstado() != null){
			List<Cidade> cidades = fachada.getCidadesPorUF(usuarioEdit.getResidencia().getEstado().getCodigo() + "");
			request.getSession().setAttribute("cidades", cidades);
		}
		
		if(usuarioEdit.getResidencia().getCidade() != null){
			List<Bairro> bairros = fachada.getBairroPorCidade(usuarioEdit.getResidencia().getCidade().getCodigo_cidade() + "");
			request.getSession().setAttribute("bairros", bairros);
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
					usuario.setTipoUsuario(TipoUsuario.INVESTIGADOR);
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
		
		String acao = ((DynaActionForm)form).getString("acao");

		String nome = ((DynaActionForm)form).getString("nome");
		String sexo = ((DynaActionForm)form).getString("sexo");

		String cpf = ((DynaActionForm)form).getString("cpf");
		String telefone = ((DynaActionForm)form).getString("telefone");
		String celular = ((DynaActionForm)form).getString("celular");
		String email = ((DynaActionForm)form).getString("email");

		String pais = ((DynaActionForm)form).getString("pais");
		String estado = ((DynaActionForm)form).getString("estado");
		String cidade = ((DynaActionForm)form).getString("cidade");
		String bairro = ((DynaActionForm)form).getString("bairro");
		String rua = ((DynaActionForm)form).getString("rua");
		String cep = ((DynaActionForm)form).getString("cep");
		String numero = ((DynaActionForm)form).getString("numero");
		String complemento = ((DynaActionForm)form).getString("complemento");
		String pto_referencia = ((DynaActionForm)form).getString("pto_referencia");
		String assinatura = ((DynaActionForm)form).getString("assinatura");

		String login = ((DynaActionForm)form).getString("login");
		String senha = ((DynaActionForm)form).getString("senha");
		String confirmasenha = ((DynaActionForm)form).getString("confirmasenha");
		
		String erro = validarCampos(nome,sexo, email, pais, login, senha, confirmasenha, acao);
		
		if(erro.equals("")){
			if(acao.equals("usuarioAdd")){
				
				Pais paisTemp = new Pais();
				paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
				
				Logradouro logradouroTemp = null;
				Residencia enderecoUsuario = null;
				Cidade cidadeTemp = null;
				UF estadoTemp = null;
				
				if(cep != null && !cep.equals("")){
					logradouroTemp = fachada.getLogradouroPorCep(cep);
				}else{
					if(bairro != null && !bairro.equals("")){
						Bairro bairroTemp = new Bairro();
						bairroTemp.setCodigo(Integer.parseInt(bairro));
						logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
					}else if(cidade != null && !cidade.equals("")){
						cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
						
						if(estado != null && !estado.equals("")){
							erro = "Estado não selecionado";
							request.setAttribute("mensagem", erro);
							return map.findForward(fUSUARIOADD);
						}else{
							estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
						}
						logradouroTemp = new Logradouro(null,cep,rua,complemento);
					}
					
					fachada.inserirLogradouro(logradouroTemp);
				}
				
				enderecoUsuario = new Residencia(logradouroTemp,numero,complemento,pto_referencia,null,null,paisTemp);

				if(cidadeTemp != null){
					enderecoUsuario.setCidade(cidadeTemp);
				}
				if(estadoTemp != null){
					enderecoUsuario.setEstado(estadoTemp);
				}
				
				try{
					enderecoUsuario =  fachada.inserirResidencia(enderecoUsuario);
						Usuario usuario = new Usuario();
						usuario.setResidencia(enderecoUsuario);
						usuario.setNome(nome);
						usuario.setLogin(login);
						usuario.setEmail(email);
						usuario.setCelular(celular);
						usuario.setCpf(cpf);
						usuario.setSenha(senha);
						usuario.setTelefone(telefone);
						usuario.setSexo(sexo);
						
						byte[] assinaturaBytes = SigGen.redrawSignature(SigGen.extractSignature(assinatura));
						Arquivo assImg = new Arquivo();
						assImg.setDadosArqv(assinaturaBytes);
						assImg.setExtensao("image/png");
						assImg.setNomeArqv(login+".png");
						assImg = fachada.inserirArquivo(assImg);
						usuario.setAssinatura(assImg);
						
						usuario = fachada.insertUsuario(usuario);
						request.getSession().setAttribute("usuarioRet", usuario);
					
					request.setAttribute("mensagem", "Usuário adicionado com sucesso!");
					
					List<Cidade> cidades = fachada.getCidadesPorUF(estado);
					request.getSession().setAttribute("cidades", cidades);
					
					List<Bairro> bairros = fachada.getBairroPorCidade(cidade);
					request.getSession().setAttribute("bairros", bairros);
					
					retorno = map.findForward(fUSUARIOBUSCA);
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
					retorno = map.findForward(fUSUARIOADD);
				}
			}
			
		}else{
			request.setAttribute("mensagem", erro);
			
			
			carregarCamposPreenchidos(map, request, nome, sexo, cpf, telefone,
					celular, email, pais, estado, cidade, bairro, rua, cep,
					numero, complemento, pto_referencia, login, senha);
				
			retorno = map.findForward(fUSUARIOADD);
		}

		
		
		return retorno;
	}
	
	
	public ActionForward usuarioEdit(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward retorno = null;
		
		String acao = ((DynaActionForm)form).getString("acao");

		String nome = ((DynaActionForm)form).getString("nome");
		String sexo = ((DynaActionForm)form).getString("sexo");

		String cpf = ((DynaActionForm)form).getString("cpf");
		String telefone = ((DynaActionForm)form).getString("telefone");
		String celular = ((DynaActionForm)form).getString("celular");
		String email = ((DynaActionForm)form).getString("email");

		String pais = ((DynaActionForm)form).getString("pais");
		String estado = ((DynaActionForm)form).getString("estado");
		String cidade = ((DynaActionForm)form).getString("cidade");
		String bairro = ((DynaActionForm)form).getString("bairro");
		String rua = ((DynaActionForm)form).getString("rua");
		String cep = ((DynaActionForm)form).getString("cep");
		String numero = ((DynaActionForm)form).getString("numero");
		String complemento = ((DynaActionForm)form).getString("complemento");
		String pto_referencia = ((DynaActionForm)form).getString("pto_referencia");

		String erro = validarCampos(nome,sexo, email, pais, "", "","", acao);
		
		if(erro.equals("")){
			if(acao.equals("usuarioEdit")){
				
				Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEdit");
				
				Pais paisTemp = new Pais();
				paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
				
				Logradouro logradouroTemp = null;
				Residencia enderecoUsuario = null;
				Cidade cidadeTemp = null;
				UF estadoTemp = null;
				
				if(cep != null && !cep.equals("")){
					logradouroTemp = fachada.getLogradouroPorCep(cep);
				}else{
					if(bairro != null && !bairro.equals("")){
						Bairro bairroTemp = new Bairro();
						bairroTemp.setCodigo(Integer.parseInt(bairro));
						logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
					}else if(cidade != null && !cidade.equals("")){
						cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
						
						if(estado != null && !estado.equals("")){
							erro = "Estado não selecionado";
							request.setAttribute("mensagem", erro);
							return map.findForward(fUSUARIOADD);
						}else{
							estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
						}
						logradouroTemp = new Logradouro(null,cep,rua,complemento);
					}
					
					fachada.inserirLogradouro(logradouroTemp);
				}
				
				enderecoUsuario = new Residencia(logradouroTemp,numero,complemento,pto_referencia,null,null,paisTemp);
				enderecoUsuario.setId(usuario.getResidencia().getId());

				if(cidadeTemp != null){
					enderecoUsuario.setCidade(cidadeTemp);
				}
				if(estadoTemp != null){
					enderecoUsuario.setEstado(estadoTemp);
				}
				
				try{
					enderecoUsuario =  fachada.inserirResidencia(enderecoUsuario);
						usuario.setResidencia(enderecoUsuario);
						usuario.setNome(nome);
						usuario.setEmail(email);
						usuario.setCelular(celular);
						usuario.setCpf(cpf);
						usuario.setTelefone(telefone);
						usuario.setSexo(sexo);
						usuario = fachada.insertUsuario(usuario);
						request.getSession().setAttribute("usuarioEdit", usuario);
					
					request.setAttribute("mensagem", "Usuário editado com sucesso!");
					
				}catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao conectar com o banco de dados!");
				}
			}
			
		}else{
			request.setAttribute("mensagem", erro);
			
			
			carregarCamposPreenchidosEdit(map, request, nome, sexo, cpf, telefone,
					celular, email, pais, estado, cidade, bairro, rua, cep,
					numero, complemento, pto_referencia, "", "");
				

		}

			retorno = map.findForward(fUSUARIOEDIT);
		
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
	
	
	private String validarCampos(String nome,String sexo,String  email, String pais, String  login, String senha, String confirmasenha, String acao) {
		String erro = "";
		
		
		if(nome.equals("")){
			erro += " Nome inválido ";
		}if(login.equals("") && acao.equals("usuarioAdd")){
			erro += " Login inválido ";
		}if(email.equals("")){
			erro += " Email inválido ";
		}if(pais.equals("")){
			erro += " País inválido ";
		}if(senha.equals("") && acao.equals("usuarioAdd")){
			erro += " Senha inválida ";
		}if(!senha.equals(confirmasenha) && acao.equals("usuarioAdd")){
			erro += " Senhas não conferem ";
		}
		
		return erro;
	}
	
	private void carregarCamposPreenchidos(ActionMapping map,
			HttpServletRequest request, String nome, String sexo, String cpf,
			String telefone, String celular, String email, String pais,
			String estado, String cidade, String bairro, String rua,
			String cep, String numero, String complemento,
			String pto_referencia, String login, String senha) {
		String erro;
		
		Pais paisTemp  = null;
		if(pais != null && !pais.equals("")){
			paisTemp = new Pais();
			paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
		}
		
		Logradouro logradouroTemp = null;
		Residencia enderecoUsuario = null;
		Cidade cidadeTemp = null;
		UF estadoTemp = null;
		Bairro bairroTemp = null;
		
		if(cep != null && !cep.equals("")){
			logradouroTemp = fachada.getLogradouroPorCep(cep);
		}else{
			if(bairro != null && !bairro.equals("")){
				bairroTemp = new Bairro();
				bairroTemp.setCodigo(Integer.parseInt(bairro));
				logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
			}else if(cidade != null && !cidade.equals("")){
				cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
				
				if(estado != null && !estado.equals("")){
					erro = "Estado não selecionado";
					request.setAttribute("mensagem", erro);
				}else{
					estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
				}
				logradouroTemp = new Logradouro(null,cep,rua,complemento);
			}
			
		}
		
		enderecoUsuario = new Residencia(logradouroTemp,numero,complemento,pto_referencia,null,null,paisTemp);

		if(cidadeTemp != null){
			enderecoUsuario.setCidade(cidadeTemp);
		}else{
			if(cidade != null && !cidade.equals("")){
				Cidade cidadeAdd = new Cidade();
				cidadeAdd.setCodigo_cidade(Integer.parseInt(cidade));
				enderecoUsuario.setCidade(cidadeAdd);
			}
		}
		if(estadoTemp != null){
			enderecoUsuario.setEstado(estadoTemp);
		}else{
			if(estado != null && !estado.equals("")){
				UF estadoAdd = new UF();
				estadoAdd.setCodigo(Integer.parseInt(estado));
				enderecoUsuario.setEstado(estadoAdd);
			}
		}
		
				Usuario usuario = new Usuario();
				usuario.setResidencia(enderecoUsuario);
				usuario.setNome(nome);
				usuario.setLogin(login);
				usuario.setEmail(email);
				usuario.setCelular(celular);
				usuario.setCpf(cpf);
				usuario.setSenha(senha);
				usuario.setTelefone(telefone);
				usuario.setSexo(sexo);
				request.getSession().setAttribute("usuarioRet", usuario);
	}
	
	private void carregarCamposPreenchidosEdit(ActionMapping map,
			HttpServletRequest request, String nome, String sexo, String cpf,
			String telefone, String celular, String email, String pais,
			String estado, String cidade, String bairro, String rua,
			String cep, String numero, String complemento,
			String pto_referencia, String login, String senha) {
		String erro;
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioEdit");
		
		Pais paisTemp = new Pais();
		paisTemp.setNumeroCodificacao(Integer.parseInt(pais));
		
		Logradouro logradouroTemp = null;
		Residencia enderecoUsuario = null;
		Cidade cidadeTemp = null;
		UF estadoTemp = null;
		
		if(cep != null && !cep.equals("")){
			logradouroTemp = fachada.getLogradouroPorCep(cep);
		}else{
			if(bairro != null && !bairro.equals("")){
				Bairro bairroTemp = new Bairro();
				bairroTemp.setCodigo(Integer.parseInt(bairro));
				logradouroTemp = new Logradouro(bairroTemp,cep,rua,complemento);
			}else if(cidade != null && !cidade.equals("")){
				cidadeTemp = fachada.getCidadePorID(Integer.parseInt(cidade));
				
				if(estado != null && !estado.equals("")){
					erro = "Estado não selecionado";
					request.setAttribute("mensagem", erro);
				}else{
					estadoTemp = fachada.getUFPorID(Integer.parseInt(estado));
				}
				logradouroTemp = new Logradouro(null,cep,rua,complemento);
			}
			
		}
		
		enderecoUsuario = new Residencia(logradouroTemp,numero,complemento,pto_referencia,null,null,paisTemp);
		enderecoUsuario.setId(usuario.getResidencia().getId());

		if(cidadeTemp != null){
			enderecoUsuario.setCidade(cidadeTemp);
		}else{
			if(cidade != null && !cidade.equals("")){
				Cidade cidadeAdd = new Cidade();
				cidadeAdd.setCodigo_cidade(Integer.parseInt(cidade));
				enderecoUsuario.setCidade(cidadeAdd);
			}
		}
		if(estadoTemp != null){
			enderecoUsuario.setEstado(estadoTemp);
		}else{
			if(estado != null && !estado.equals("")){
				UF estadoAdd = new UF();
				estadoAdd.setCodigo(Integer.parseInt(estado));
				enderecoUsuario.setEstado(estadoAdd);
			}
		}
		
				usuario.setResidencia(enderecoUsuario);
				usuario.setNome(nome);
				usuario.setEmail(email);
				usuario.setCelular(celular);
				usuario.setCpf(cpf);
				usuario.setTelefone(telefone);
				usuario.setSexo(sexo);
				request.getSession().setAttribute("usuarioEdit", usuario);
			
			
	}
	
	
	public static void main(String[] args) {
		int x = 13,y =5;
		 x %= y;
		System.out.println(x);
		int a = 13,b = 5;
		a = a % b;
		System.out.println(a);
		
	}

}
