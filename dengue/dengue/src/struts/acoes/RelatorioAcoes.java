package struts.acoes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.endereco.Pais;
import model.endereco.UF;
import model.fichainvestigativa.NotificacaoInvestigativa;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.DispatchAction;

import fachada.Fachada;

public class RelatorioAcoes extends DispatchAction {

	
	private static final String fRELATORIOGEOGRAFICO = "fRelatorioGeografico";
	private static final String fRELATORIOFRONTEIRAS = "fRelatorioFronteiras";
	private static final String fRELATORIOINDIVIDUAL = "fRelatorioIndividual";

	private Fachada fachada;
	
	public RelatorioAcoes(){
		fachada = Fachada.getInstancia();
	}
	
	
	public ActionForward mostrarTelaRelatorioGeo(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<UF> estados = fachada.getTodosEstados();
		List<Pais> paises = fachada.getTodosPaises();
		request.getSession().setAttribute("estados", estados);
		request.getSession().setAttribute("paises", paises);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		request.getSession().setAttribute("investigacoes", null);
		
			return map.findForward(fRELATORIOGEOGRAFICO);
	}
	
	public ActionForward mostrarTelaRelatorioFronteiras(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List<UF> estados = fachada.getTodosEstados();
		List<Pais> paises = fachada.getTodosPaises();
		request.getSession().setAttribute("estados", estados);
		request.getSession().setAttribute("paises", paises);
		
		request.getSession().setAttribute("cidades", null);
		request.getSession().setAttribute("bairros", null);
		
			return map.findForward(fRELATORIOFRONTEIRAS);
	}
	
	public ActionForward mostrarRelatorioIndividual(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String idFicha = ((DynaActionForm)form).getString("idFicha");
		
		if(idFicha != null){
			NotificacaoInvestigativa notificacao = fachada.getNotificacaoInvestigativaPorID(Integer.parseInt(idFicha));
			request.getSession().setAttribute("notificacaoInvestigativa",notificacao);
		}
		
			return map.findForward(fRELATORIOINDIVIDUAL);
	}
	
	
	public ActionForward filtrarRelatorioGeografico(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){

		String cep = (String) request.getParameter("cep");
		String pais = (String) request.getParameter("pais");
		String estado = (String) request.getParameter("estado");
		String cidade = (String) request.getParameter("cidade");
		String bairro = (String) request.getParameter("bairro");
		String dataInicial = (String) request.getParameter("inputDate");
		String dataFinal = (String) request.getParameter("inputDate2");
		String autocomplete = (String) request.getParameter("autocomplete");
		
		String classico = (String) request.getParameter("classico");
		String complicacoes = (String) request.getParameter("complicacoes");
		String fhd = (String) request.getParameter("fhd");
		String scd = (String) request.getParameter("scd");
		String descartado = (String) request.getParameter("descartado");
		
		List<NotificacaoInvestigativa> investigacoes = fachada.pesquisarNotificacaoInvestigativa(cep, pais, estado, cidade, bairro, dataInicial, dataFinal, autocomplete, classico, complicacoes, fhd, scd, descartado);
		request.getSession().setAttribute("investigacoes", investigacoes);
		
		if(investigacoes != null && !investigacoes.isEmpty()){
			request.getSession().setAttribute("latitude", investigacoes.get(0).getConclusao().getLatitude());
			request.getSession().setAttribute("longitude", investigacoes.get(0).getConclusao().getLongitude());
		}
		
		return map.findForward(fRELATORIOGEOGRAFICO);
	}
	
	
}
