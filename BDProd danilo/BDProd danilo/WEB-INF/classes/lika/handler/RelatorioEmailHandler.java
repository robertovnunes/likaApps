package lika.handler;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import lika.model.Pessoa;
import lika.services.CRUDInterface;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

@Controller("relatorioEmailHandler")
@Scope("session")
public class RelatorioEmailHandler {

	private Object bean;
	private String tipoFiltro;
	private String situacao;

	public String getTipoFiltro() {
		return this.tipoFiltro;

	}

	public Object getBean() {
		return bean;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public void setBean(Object bean) {
		this.bean = bean;
	}

	public void setTipoFiltro(String tipoFiltro) {
		this.tipoFiltro = tipoFiltro;
	}

	public void gerarRelatorio(ActionEvent event) {
		
		CRUDInterface dao = null;

		if (this.tipoFiltro.equals("Todos"))
			dao = DaoHandler.getInstance().getPessoaDao();

		else if (this.tipoFiltro.equals("Pesquisador"))
			dao = DaoHandler.getInstance().getPesquisadorDao();

		else if (this.tipoFiltro.equals("Aluno"))
			dao = DaoHandler.getInstance().getAlunoDao();

		else if (this.tipoFiltro.equals("Funcionário"))
			dao = DaoHandler.getInstance().getFuncionarioDao();

		else if (this.tipoFiltro.equals("Bolsista"))
			dao = DaoHandler.getInstance().getBolsistaProjetoDao();

		StringBuffer list = new StringBuffer(5000);
		for (Pessoa pessoa : (List<Pessoa>)(dao.listar("", ""))) {

			if (this.situacao.equalsIgnoreCase(pessoa.getSituacao()) || this.situacao.equalsIgnoreCase("todos"))
				list.append(pessoa.getEmail() + ";\n");
		}

		FacesContext context = FacesContext.getCurrentInstance();

		ServletContext servletContext = (ServletContext) context.getExternalContext().getContext();

		HttpServletResponse response = (HttpServletResponse) context.getExternalContext().getResponse();

		OutputStream saida = null;



		response.setContentType("application/txt");
		response.addHeader("Content-Disposition", "attachment;filename=Relatorio.txt");

		response.setContentLength(list.length());

		try {
			saida = response.getOutputStream();
			saida.write(list.toString().getBytes());
			saida.flush();
			saida.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Relatório Gerado com Sucesso! ", ""));

		FacesContext.getCurrentInstance().responseComplete();



	}

}