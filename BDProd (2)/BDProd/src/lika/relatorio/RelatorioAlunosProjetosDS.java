/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import lika.handler.DaoHandler;
import lika.model.Aluno;
import lika.model.Pessoa;
import lika.model.Projeto;
import lika.model.ProjetoSimples;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioAlunosProjetosDS implements JRDataSource {

	public List<Object> dados;
	public Iterator<Object> iterator;
	public boolean proximo = false;
	public Object projetoAtual;

	private int tamanho;
	private int tamanhoAlunos;

	public RelatorioAlunosProjetosDS(List<Object> dados) {

		this.dados = dados;
		this.iterator = this.dados.iterator();

	}

	public boolean next() throws JRException {
		this.projetoAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.projetoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		if (this.projetoAtual instanceof Projeto) {
			Projeto p = (Projeto) this.projetoAtual;
			if ("nome".equals(campo.getName())) {
				valor = p.getNome();
			} else if ("alunosProjeto".equals(campo.getName())) {
				List<Aluno> c = DaoHandler.getInstance().getPessoaProjetoDao()
						.alunoDoProjeto(p);
				c.add(new Aluno(-1, "111111111111111111111111111"));
				tamanhoAlunos += c.size();
				tamanho = c.size();
				if (c.size() == 0) {
					valor = null;
				} else {
					valor = new RelatorioAlunosDS(c);
				}
			} else if ("total".equals(campo.getName())) {
				valor = tamanho + "";
			} else if ("totalProj".equals(campo.getName())) {
				valor = this.dados.size() + "";
			} else if ("totalAlunos".equals(campo.getName())) {
				valor = " - ";
			}

			return valor;
		} else if (this.projetoAtual instanceof ProjetoSimples) {
			ProjetoSimples p = (ProjetoSimples) this.projetoAtual;
			if ("nome".equals(campo.getName())) {
				valor = "PS - " + p.getNome();
			} else if ("alunosProjeto".equals(campo.getName())) {
				List<Aluno> c = new ArrayList<Aluno>();
				c.add(p.getAluno());
				tamanhoAlunos += c.size();
				tamanho = c.size();
				if (c.size() == 0) {
					valor = null;
				} else {
					valor = new RelatorioAlunosDS(c);
				}
			} else if ("total".equals(campo.getName())) {
				valor = tamanho + "";
			} else if ("totalProj".equals(campo.getName())) {
				valor = this.dados.size() + "";
			} else if ("totalAlunos".equals(campo.getName())) {
				valor = " - ";
			}

			return valor;
		} else {
			return null;
		}

	}
}
