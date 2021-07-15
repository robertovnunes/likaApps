package lika.relatorio;

import java.util.Iterator;
import java.util.List;

import lika.model.Laboratorio;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class RelatorioLaboratorioDataSource implements JRDataSource {

	public List<Laboratorio> dados;
	public Iterator<Laboratorio> iterator;
	public boolean proximo = false;
	public Laboratorio laboratorioAtual;

	public RelatorioLaboratorioDataSource(List<Laboratorio> dados) {

		this.dados = dados;
		this.iterator = this.dados.iterator();
	}

	public boolean next() throws JRException {
		this.laboratorioAtual = this.iterator.hasNext() ? this.iterator.next()
				: null;
		this.proximo = (this.laboratorioAtual != null);
		return this.proximo;

	}

	public Object getFieldValue(JRField campo) throws JRException {
		Object valor = null;
		Laboratorio laboratorio = this.laboratorioAtual;

		if ("nome".equals(campo.getName())) {
			valor = laboratorio.getNome();
		} else if ("finalidade".equals(campo.getName())) {
			valor = laboratorio.getFinalidade();
		} else if ("responsavel".equals(campo.getName())) {
			if (laboratorio.getAdministrador() != null) {
				valor = laboratorio.getAdministrador().getNome();
			} else {
				valor = "Nenhum resp. foi selecionado.";
			}
		} else if ("viceResponsavel".equals(campo.getName())) {
			if (laboratorio.getViceAdministrador() != null) {
				valor = laboratorio.getViceAdministrador().getNome();
			} else {
				valor = "Nenhum vice-resp. foi selecionado.";
			}
		} else if ("integrantes".equals(campo.getName())) {
			valor = new SubRelatorioIntegrantesDS(laboratorio.getIntegrantes());

		} else if ("materiais".equals(campo.getName())) {
			valor = new SubRelatorioMaterialLaboratorioDS(laboratorio
					.getEquipamentos());

		}
		return valor;
	}
}
