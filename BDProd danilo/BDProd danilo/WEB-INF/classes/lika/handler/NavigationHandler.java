/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lika.handler;

import lika.util.TipoPublicacao;

/**
 * 
 * @author Marcio
 */
public class NavigationHandler {

	public enum AcaoAtual {
		Editar_Pesquisador, Listar_Pesquisadores, Visualizar_Pesquisador, Editar_Funcionario, Listar_Funcionarios, Visualizar_Funcionario, Editar_Aluno, Listar_Alunos, Visualizar_Aluno, Editar_Bolsista, Listar_Bolsista, Visualizar_Bolsista, Editar_Area, Listar_Area, Visualizar_Area, Editar_Sub_Area, Listar_Sub_Area, Visualizar_Sub_Area, Editar_Equipamento, Listar_Equipamento, Visualizar_Equipamento, Editar_Lab, Listar_Lab, Visualizar_Lab, Editar_Projeto, Listar_Projeto, Visualizar_Projeto, Editar_Periodico, Listar_Periodico, Visualizar_Periodico, Editar_Livro, Listar_Livro, Visualizar_Livro, Editar_Anais, Listar_Anais, Visualizar_Anais, Editar_Grupo, Listar_Grupo, Visualizar_Grupo, Editar_Usuario, Listar_Usuario, Visualizar_Usuario, Editar_Funcao, Listar_Funcao, Visualizar_Funcao, Editar_Departamento, Listar_Departamento, Visualizar_Departamento, Listar_Email

	}

	private String localizacao = "Listar Pesquisador";

	private boolean admin;
	

	private AcaoAtual acaoAtual = AcaoAtual.Listar_Pesquisadores;

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public boolean isMostrarVisualizarPesquisador() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Pesquisador);
	}

	public boolean isMostrarEditarPesquisador() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Pesquisador);
	}

	public boolean isMostrarVisualizarFuncionario() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Funcionario);
	}

	public boolean isMostrarEditarFuncionario() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Funcionario);
	}

	public boolean isMostrarVisualizarAluno() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Aluno);
	}

	public boolean isMostrarEditarAluno() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Aluno);
	}

	public String visualizarAluno() {
		this.acaoAtual = AcaoAtual.Visualizar_Aluno;
		this.localizacao = "Perfil do Aluno";
		return "visualizarAluno";
	}

	public String editarAluno() {
		this.acaoAtual = AcaoAtual.Editar_Aluno;
		this.localizacao = "Editar Aluno";
		return "editarAluno";
	}

	public String novoAluno() {
		this.acaoAtual = AcaoAtual.Editar_Aluno;
		this.localizacao = "Novo Aluno";

		return "novoAluno";

	}

	public String inicioAluno() {
		this.acaoAtual = AcaoAtual.Listar_Alunos;
		this.localizacao = "Listar Alunos";

		return "pesquisarAluno";
	}

	public boolean isMostrarVisualizarBolsista() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Bolsista);
	}

	public boolean isMostrarEditarBolsista() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Bolsista);
	}

	public String visualizarBolsista() {
		this.acaoAtual = AcaoAtual.Visualizar_Bolsista;
		this.localizacao = "Perfil do Bolsista";
		return "visualizarBolsista";
	}

	public String editarBolsista() {
		this.acaoAtual = AcaoAtual.Editar_Bolsista;
		this.localizacao = "Editar Bolsista";
		return "editarBolsista";
	}

	public String novoBolsista() {
		this.acaoAtual = AcaoAtual.Editar_Bolsista;
		this.localizacao = "Novo Bolsista";

		return "novoBolsista";

	}

	public String inicioBolsista() {
		this.acaoAtual = AcaoAtual.Listar_Bolsista;
		this.localizacao = "Listar Bolsista";

		return "pesquisarBolsista";
	}

	public boolean isMostrarVisualizarSubArea() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Sub_Area);
	}

	public boolean isMostrarEditarSubArea() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Sub_Area);
	}

	public String visualizarSubArea() {
		this.acaoAtual = AcaoAtual.Visualizar_Sub_Area;
		this.localizacao = "Visualizar Sub Área de Pesquisa";
		return "visualizarSubArea";
	}

	public String editarSubArea() {
		this.acaoAtual = AcaoAtual.Editar_Sub_Area;
		this.localizacao = "Editar Sub Área de Pesquisa";
		return "editarSubArea";
	}

	public String novoSubArea() {
		this.acaoAtual = AcaoAtual.Editar_Sub_Area;
		this.localizacao = "Nova Sub Área de Pesquisa";

		return "novoSubArea";

	}

	public String inicioSubArea() {
		this.acaoAtual = AcaoAtual.Listar_Sub_Area;
		this.localizacao = "Listar Sub Área de Pesquisa";

		return "pesquisarSubArea";
	}

	public boolean isMostrarVisualizarArea() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Area);
	}

	public boolean isMostrarEditarArea() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Area);
	}

	public String visualizarArea() {
		this.acaoAtual = AcaoAtual.Visualizar_Area;
		this.localizacao = "Visualizar Área de Pesquisa";
		return "visualizarArea";
	}

	public String editarArea() {
		this.acaoAtual = AcaoAtual.Editar_Area;
		this.localizacao = "Editar Área de Pesquisa";
		return "editarArea";
	}

	public String novoArea() {
		this.acaoAtual = AcaoAtual.Editar_Area;
		this.localizacao = "Nova Área de Pesquisa";

		return "novoArea";

	}

	public String inicioArea() {
		this.acaoAtual = AcaoAtual.Listar_Area;
		this.localizacao = "Listar Área de Pesquisa";

		return "pesquisarArea";
	}

	public String visualizarFuncionario() {
		this.acaoAtual = AcaoAtual.Visualizar_Funcionario;
		this.localizacao = "Perfil do Funcionário";
		return "visualizarFuncionario";
	}

	public String editarFuncionario() {
		this.acaoAtual = AcaoAtual.Editar_Funcionario;
		this.localizacao = "Editar Funcionário";
		return "editarFuncionario";
	}

	public String novoFuncionario() {
		this.acaoAtual = AcaoAtual.Editar_Funcionario;
		this.localizacao = "Novo Funcionário";

		return "novoFuncionario";

	}

	public String inicioFuncionario() {
		this.acaoAtual = AcaoAtual.Listar_Funcionarios;
		this.localizacao = "Listar Funcionário";

		return "pesquisarFuncionario";
	}

	public String visualizarPesquisador() {
		this.acaoAtual = AcaoAtual.Visualizar_Pesquisador;
		this.localizacao = "Perfil do Pesquisador";
		return "visualizarPesquisador";
	}

	public String editarPesquisador() {
		this.acaoAtual = AcaoAtual.Editar_Pesquisador;
		this.localizacao = "Editar Pesquisador";
		return "editarPesquisador";
	}

	public String novoPesquisador() {
		this.acaoAtual = AcaoAtual.Editar_Pesquisador;
		this.localizacao = "Novo Pesquisador";

		return "novoPesquisador";
	}

	public String inicioPesquisador() {
		this.acaoAtual = AcaoAtual.Listar_Pesquisadores;
		this.localizacao = "Listar Pesquisador";

		return "pesquisarPesquisador";
	}

	public boolean isMostrarVisualizarEquipamento() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Equipamento);
	}

	public boolean isMostrarEditarEquipamento() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Equipamento);
	}

	public String visualizarEquipamento() {
		this.acaoAtual = AcaoAtual.Visualizar_Equipamento;
		this.localizacao = "Equipamento";
		return "visualizarEquipamento";
	}

	public String editarEquipamento() {
		this.acaoAtual = AcaoAtual.Editar_Equipamento;
		this.localizacao = "Editar Equipamento";
		return "editarEquipamento";
	}

	public String novoEquipamento() {
		this.acaoAtual = AcaoAtual.Editar_Equipamento;
		this.localizacao = "Novo Equipamento";

		return "novoEquipamento";
	}

	public String inicioEquipamento() {
		this.acaoAtual = AcaoAtual.Listar_Equipamento;
		this.localizacao = "Listar Equipamentos";

		return "pesquisarEquipamentos";
	}

	public boolean isMostrarVisualizarLab() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Lab);
	}

	public boolean isMostrarEditarLab() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Lab);
	}

	public String visualizarLab() {
		this.acaoAtual = AcaoAtual.Visualizar_Lab;
		this.localizacao = "LaboratÃ³rio";
		return "visualizarLaboratorio";
	}

	public String editarLab() {
		this.acaoAtual = AcaoAtual.Editar_Lab;
		this.localizacao = "Editar LaboratÃ³rio";
		return "editarLaboratorio";
	}

	public String novoLab() {
		this.acaoAtual = AcaoAtual.Editar_Lab;
		this.localizacao = "Novo LaboratÃ³rio";

		return "novoLaboratorio";
	}

	public String inicioLab() {
		this.acaoAtual = AcaoAtual.Listar_Lab;
		this.localizacao = "Listar LaboratÃ³rios";

		return "pesquisarLaboratorio";
	}

	public boolean isMostrarVisualizarProjeto() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Projeto);
	}

	public boolean isMostrarEditarProjeto() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Projeto);
	}

	public String visualizarProjeto() {
		this.acaoAtual = AcaoAtual.Visualizar_Projeto;
		this.localizacao = "Projeto";
		return "visualizarProjeto";
	}

	public String editarProjeto() {
		this.acaoAtual = AcaoAtual.Editar_Projeto;
		this.localizacao = "Editar Projeto";
		return "editarProjeto";
	}

	public String novoProjeto() {
		this.acaoAtual = AcaoAtual.Editar_Projeto;
		this.localizacao = "Novo Projeto";

		return "novoProjeto";
	}

	public String inicioProjeto() {
		this.acaoAtual = AcaoAtual.Listar_Projeto;
		this.localizacao = "Listar Projetos";

		return "pesquisarProjeto";
	}

	public boolean isMostrarVisualizarPeriodico() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Periodico);
	}

	public boolean isMostrarEditarPeriodico() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Periodico);
	}

	public String visualizarPeriodico() {
		this.acaoAtual = AcaoAtual.Visualizar_Periodico;
		this.localizacao = "PeriÃ³dico";
		return "visualizarPeriodico";
	}

	public String editarPeriodico() {
		this.acaoAtual = AcaoAtual.Editar_Periodico;
		this.localizacao = "Editar PeriÃ³dico";
		return "editarPeriodico";
	}

	public String novoPeriodico() {
		this.acaoAtual = AcaoAtual.Editar_Periodico;
		this.localizacao = "Novo Periï¿½dico";

		return "novoPeriodico";
	}

	public String inicioPeriodico() {
		this.acaoAtual = AcaoAtual.Listar_Periodico;
		this.localizacao = "Listar Periï¿½dicos";

		return "pesquisarPeriodico";
	}

	public boolean isMostrarVisualizarLivro() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Livro);
	}

	public boolean isMostrarEditarLivro() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Livro);
	}

	public String visualizarLivro() {
		this.acaoAtual = AcaoAtual.Visualizar_Livro;
		this.localizacao = "Livro";
		return "visualizarLivro";
	}

	public String editarLivro() {
		this.acaoAtual = AcaoAtual.Editar_Livro;
		this.localizacao = "Editar Livro";
		return "editarLivro";
	}

	public String novoLivro() {
		this.acaoAtual = AcaoAtual.Editar_Livro;
		this.localizacao = "Novo Livro";

		return "novoLivro";
	}

	public String inicioLivro() {
		this.acaoAtual = AcaoAtual.Listar_Livro;
		this.localizacao = "Listar Livros";

		return "pesquisarLivro";
	}

	public boolean isMostrarVisualizarAnais() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Anais);
	}

	public boolean isMostrarEditarAnais() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Anais);
	}

	public String visualizarAnais() {
		this.acaoAtual = AcaoAtual.Visualizar_Anais;
		this.localizacao = "Anais de Evento";
		return "visualizarAnais";
	}

	public String editarAnais() {
		this.acaoAtual = AcaoAtual.Editar_Anais;
		this.localizacao = "Editar Anais de Evento";
		return "editarAnais";
	}

	public String novoAnais() {
		this.acaoAtual = AcaoAtual.Editar_Anais;
		this.localizacao = "Novo Anais de Evento";

		return "novoAnais";
	}

	public String inicioAnais() {
		this.acaoAtual = AcaoAtual.Listar_Anais;
		this.localizacao = "Listar Anais de Evento";

		return "pesquisarAnais";
	}

	public String inicioPublicacao(String tipo) {
		if (tipo.equalsIgnoreCase(TipoPublicacao.ANAIS)) {
			this.acaoAtual = AcaoAtual.Listar_Anais;
			this.localizacao = "Listar Anais de Evento";
			return "pesquisarAnais";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.LIVRO)) {
			this.acaoAtual = AcaoAtual.Listar_Livro;
			this.localizacao = "Listar Livros";
			return "pesquisarLivro";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.PERIODICO)) {
			this.acaoAtual = AcaoAtual.Listar_Periodico;
			this.localizacao = "Listar Periï¿½dicos";
			return "pesquisarPeriodico";
		}
		return null;
	}

	public String visualizarPublicacao(String tipo) {
		if (tipo.equalsIgnoreCase(TipoPublicacao.ANAIS)) {
			this.acaoAtual = AcaoAtual.Visualizar_Anais;
			this.localizacao = "Anais de Evento";
			return "visualizarAnais";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.LIVRO)) {
			this.acaoAtual = AcaoAtual.Visualizar_Livro;
			this.localizacao = "Livro";
			return "visualizarLivro";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.PERIODICO)) {
			this.acaoAtual = AcaoAtual.Visualizar_Periodico;
			this.localizacao = "Periï¿½dico";
			return "visualizarPeriodico";
		}
		return null;
	}

	public String editarPublicacao(String tipo) {
		System.out.println("TIPOOOOOOOOOOO     " + tipo);

		if (tipo.equalsIgnoreCase(TipoPublicacao.ANAIS)) {
			this.acaoAtual = AcaoAtual.Editar_Anais;
			this.localizacao = "Editar Anais de Evento";
			return "editarAnais";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.LIVRO)) {
			this.acaoAtual = AcaoAtual.Editar_Livro;
			this.localizacao = "Editar Livro";
			return "editarLivro";
		} else if (tipo.equalsIgnoreCase(TipoPublicacao.PERIODICO)) {
			this.acaoAtual = AcaoAtual.Editar_Periodico;
			this.localizacao = "Editar Periï¿½dico";
			return "editarPeriodico";
		}
		return null;
	}

	public boolean isMostrarVisualizarGrupo() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Grupo);
	}

	public boolean isMostrarEditarGrupo() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Grupo);
	}

	public String visualizarGrupo() {
		this.acaoAtual = AcaoAtual.Visualizar_Grupo;
		this.localizacao = "Grupo de Pesquisa";
		return "visualizarGrupo";
	}

	public String editarGrupo() {
		this.acaoAtual = AcaoAtual.Editar_Grupo;
		this.localizacao = "Editar Grupo de Pesquisa";
		return "editarGrupo";
	}

	public String novoGrupo() {
		this.acaoAtual = AcaoAtual.Editar_Grupo;
		this.localizacao = "Novo Grupo de Pesquisa";

		return "novoGrupo";
	}

	public String inicioGrupo() {
		this.acaoAtual = AcaoAtual.Listar_Grupo;
		this.localizacao = "Listar Grupos de Pesquisa";

		return "pesquisarGrupo";
	}

	public String inicioRelatoriosPublicacao() {
		this.localizacao = "Relatï¿½rios das Publicaï¿½ï¿½es";
		return "relatorioPublicacoes";
	}

	public String inicioRelatoriosProjeto() {
		this.localizacao = "Relatï¿½rios dos Projetos";
		return "relatorioProjetos";
	}

	public String inicioRelatoriosAluno() {
		this.localizacao = "Relatï¿½rios dos Alunos";
		return "relatorioAlunos";
	}

	public boolean isMostrarVisualizarUsuario() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Usuario);
	}

	public boolean isMostrarEditarUsuario() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Usuario);
	}

	public String visualizarUsuario() {
		this.acaoAtual = AcaoAtual.Visualizar_Usuario;
		this.localizacao = "Usuï¿½rio";
		return "visualizarUsuario";
	}

	public String editarUsuario() {
		this.acaoAtual = AcaoAtual.Editar_Usuario;
		this.localizacao = "Editar Usuï¿½rio";
		return "editarUsuario";
	}

	public String novoUsuario() {
		this.acaoAtual = AcaoAtual.Editar_Usuario;
		this.localizacao = "Novo Usuï¿½rio";

		return "novoUsuario";
	}

	public String inicioUsuario() {
		this.acaoAtual = AcaoAtual.Listar_Usuario;
		this.localizacao = "Listar Usuï¿½rios";

		return "pesquisarUsuario";
	}

	public boolean isMostrarVisualizarFuncao() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Funcao);
	}

	public boolean isMostrarEditarFuncao() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Funcao);
	}

	public String visualizarFuncao() {
		this.acaoAtual = AcaoAtual.Visualizar_Funcao;
		this.localizacao = "Funï¿½ï¿½o";
		return "visualizarFuncao";
	}

	public String editarFuncao() {
		this.acaoAtual = AcaoAtual.Editar_Funcao;
		this.localizacao = "Editar Funï¿½ï¿½o";
		return "editarFuncao";
	}

	public String novoFuncao() {
		this.acaoAtual = AcaoAtual.Editar_Funcao;
		this.localizacao = "Novo Funï¿½ï¿½o";

		return "novoFuncao";
	}

	public String inicioFuncao() {
		this.acaoAtual = AcaoAtual.Listar_Funcao;
		this.localizacao = "Listar Funï¿½ï¿½o";

		return "pesquisarFuncao";
	}

	public boolean isMostrarVisualizarDepartamento() {
		return this.acaoAtual.equals(AcaoAtual.Visualizar_Departamento);
	}

	public boolean isMostrarEditarDepartamento() {
		return this.acaoAtual.equals(AcaoAtual.Editar_Departamento);
	}

	public String visualizarDepartamento() {
		this.acaoAtual = AcaoAtual.Visualizar_Departamento;
		this.localizacao = "Departamento";
		return "visualizarDepartamento";
	}

	public String editarDepartamento() {
		this.acaoAtual = AcaoAtual.Editar_Departamento;
		this.localizacao = "Editar Departamento";
		return "editarDepartamento";
	}

	public String novoDepartamento() {
		this.acaoAtual = AcaoAtual.Editar_Departamento;
		this.localizacao = "Novo Departamento";

		return "novoDepartamento";
	}

	public String inicioDepartamento() {
		this.acaoAtual = AcaoAtual.Listar_Departamento;
		this.localizacao = "Listar Departamento";

		return "pesquisarDepartamento";
	}
	
	public String relatorioEmail(){
		
		this.acaoAtual = AcaoAtual.Listar_Email;
		this.localizacao = "Relatorio Email";
		
		return "relatorioEmail";
		
	}

}
