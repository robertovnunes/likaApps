/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lika.relatorio;

import java.text.DateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import lika.model.Aluno;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioAlunosAtivosDS implements JRDataSource {

	public List<Aluno> dados;
	public Iterator<Aluno> iterator;
	public boolean proximo = false;
	public Aluno alunoAtual;

	public RelatorioAlunosAtivosDS(List<Aluno> dados) {

		this.dados = dados;
		this.iterator = this.dados.iterator();

	}

	public boolean next() throws JRException {
		this.alunoAtual = this.iterator.hasNext() ? this.iterator.next() : null;
		this.proximo = (this.alunoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Aluno aluno = this.alunoAtual;
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM,
				new Locale("pt", "BR"));

		if ("nome".equals(campo.getName())) {
			valor = aluno.getNome();
		} else if ("tipoAluno".equals(campo.getName())) {
			valor = aluno.getTipoAluno();
		}else if ("orientador".equals(campo.getName())) {

			valor = aluno.getOrientador() != null ? aluno.getOrientador()
					.getNome() : " - ";
		}

		return valor;
	}
}
