package lika.relatorio;

import java.text.DateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import lika.handler.DaoHandler;
import lika.model.Projeto;
import lika.model.SubAreaDePesquisa;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;

/**
 * 
 * @author Marcio
 */
public class ImpressaoProjetoDS implements JRDataSource {

	public List<Projeto> dados;
	public Iterator<Projeto> iterator;
	public boolean proximo = false;
	public Projeto projetoAtual;
	DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM, new Locale(
			"pt", "BR"));

	public ImpressaoProjetoDS(List<Projeto> dados) {

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
		System.out.println("AQUIIII");

		Object valor = null;
		Projeto projeto = this.projetoAtual;

		if ("titulo".equals(campo.getName())) {
			valor = projeto.getNome();
		} else if ("descricao".equals(campo.getName())) {
			valor = projeto.getDescricao();
		} else if ("dataInicio".equals(campo.getName())) {
			if (projeto.getDataInicio() != null) {
				valor = df.format(projeto.getDataInicio());
			} else {
				valor = " - ";
			}

		} else if ("dataFim".equals(campo.getName())) {
			if (projeto.getDataFim() != null) {
				valor = df.format(projeto.getDataFim());
			} else {
				valor = " - ";
			}

		} else if ("situacao".equals(campo.getName())) {
			valor = projeto.getSituacaoAtual();
		} else if ("responsavel".equals(campo.getName())) {
			if (projeto.getGerente() != null) {
				valor = projeto.getGerente().getNome();
			} else {
				valor = "-";
			}
		} else if ("viceResponsavel".equals(campo.getName())) {
			if (projeto.getViceGerente() != null) {
				valor = projeto.getViceGerente().getNome();
			} else {
				valor = "-";
			}

		} else if ("tipoProjeto".equals(campo.getName())) {
			valor = projeto.getTipo();
		} else if ("valor".equals(campo.getName())) {
			valor = projeto.getValor();
			if (valor == null) {
				valor = "";
			}
		} else if ("orgaoFinanciador".equals(campo.getName())) {
			valor = projeto.getOrgaoFinanciador();
			if (valor == null) {
				valor = "Não possui";
			}
			if (valor == null) {
				valor = "Não possui";
			}
		} else if ("areaDePesquisa".equals(campo.getName())) {
			if (projeto.getGrandeArea() != null) {
				valor = projeto.getGrandeArea().getNome();
			}
		} else if ("subAreas".equals(campo.getName())) {
			valor = this.listarSubAreas(projeto);
		} else if ("integrantes".equals(campo.getName())) {
			valor = new SubRelatorioIntegrantesDS(DaoHandler.getInstance()
					.getProjetoDao().listarPessoas(projeto));
		} else if ("materiais".equals(campo.getName())) {
			valor = new SubRelatorioMaterialDS(projeto
					.getEquipamentosAdiquiridos());
		} else if ("publicacoes".equals(campo.getName())) {
			valor = new SubRelatorioPublicacaoDS(projeto.getPublicacoes());
		}

		return valor;
	}

	public String listarSubAreas(Projeto projeto) {
		String nomeAreas = "";
		List<SubAreaDePesquisa> areas = projeto.getSubAreasDePesquisas();
		if (areas != null) {
			for (int i = 0; i < areas.size(); i++) {
				SubAreaDePesquisa a = areas.get(i);
				if (i == areas.size() - 1) {
					nomeAreas = nomeAreas + a.getNome() + ".";
				} else {
					nomeAreas = nomeAreas + a.getNome() + ", ";
				}
			}
		}
		if (areas.isEmpty()) {
			return null;
		}

		return nomeAreas;
	}
}
