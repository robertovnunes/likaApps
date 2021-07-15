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
public class RelatorioAlunosDS implements JRDataSource {

	public List<Aluno> dados;
	public Iterator<Aluno> iterator;
	public boolean proximo = false;
	public Aluno alunoAtual;

	public RelatorioAlunosDS(List<Aluno> dados) {

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
		} else if ("cpf".equals(campo.getName())) {
			valor = aluno.getCPF();
		} else if ("nascimento".equals(campo.getName())) {
			if (aluno.getNascimento() != null) {
				valor = df.format(aluno.getNascimento());
			} else {
				valor = " - ";
			}

		} else if ("data".equals(campo.getName())) {
			if (aluno.getDataAdmissao() != null) {
				valor = df.format(aluno.getDataAdmissao());
			} else {
				valor = " -  ";
			}
		} else if ("tipoAluno".equals(campo.getName())) {
			valor = aluno.getTipoAluno();
		} else if ("rg".equals(campo.getName())) {
			valor = aluno.getRG();
		} else if ("uf".equals(campo.getName())) {
			valor = aluno.getUf();
		} else if ("orgao".equals(campo.getName())) {
			valor = aluno.getOrgaoExpedidor();
		} else if ("email".equals(campo.getName())) {
			valor = aluno.getEmail();
		} else if ("foneRes".equals(campo.getName())) {
			valor = aluno.getTelefone();
		} else if ("celular".equals(campo.getName())) {
			valor = aluno.getCelular();
		} else if ("orientador".equals(campo.getName())) {

			valor = aluno.getOrientador() != null ? aluno.getOrientador()
					.getNome() : " - ";
		} else if ("dataDes".equals(campo.getName())) {
			if (aluno.getDataDesligamento() != null) {
				valor = df.format(aluno.getDataDesligamento());
			} else {
				valor = " -  ";
			}
		}

		return valor;
	}
}
