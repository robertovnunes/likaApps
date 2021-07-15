package lika.relatorio;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import lika.model.Equipamento;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class SubRelatorioMaterialLaboratorioDS implements JRDataSource {

	public List<Equipamento> dados;
	public Iterator<Equipamento> iterator;
	public boolean proximo = false;
	public Equipamento equipamentoAtual;

	public SubRelatorioMaterialLaboratorioDS(List<Equipamento> dados) {
		this.dados = dados;
		this.iterator = this.dados.iterator();
	}

	public boolean next() throws JRException {
		this.equipamentoAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.equipamentoAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Equipamento equipamento = this.equipamentoAtual;
		if ("total".equals(campo.getName())) {
			valor = " " + this.dados.size();
		}
		if ("nome".equals(campo.getName())) {
			valor = equipamento.getNome();
		} else if ("situacao".equals(campo.getName())) {
			valor = equipamento.getStatus();
		} else if ("nomeProjeto".equals(campo.getName())) {
			if (equipamento.getProjeto() != null) {
				valor = equipamento.getProjeto().getNome();
			} else {
				valor = "Nenhum Projeto associado.";
			}
		} else if ("numeroTombamento".equals(campo.getName())) {
			valor = equipamento.getNumeroTombamento();
		}
		return valor;
	}
}
