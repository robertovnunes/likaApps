package controller.aluno;


import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import model.Nanda;
import model.Nic;
import model.Noc;
import model.curso.EstudoDeCaso;
import model.curso.matricula.MatriculaCursoAluno;
import model.curso.matricula.arcomaguerez.ArcoMaguerezEstudoDeCaso;
import model.curso.matricula.arcomaguerez.Avaliacao;
import model.curso.matricula.arcomaguerez.DiagnosticoAlunoPlanejamento;
import model.curso.matricula.arcomaguerez.DiagnosticosImplementacoes;
import model.curso.matricula.arcomaguerez.DiagnosticosResultados;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.curso.matricula.arcomaguerez.Planejamento;
import model.curso.matricula.arcomaguerez.ResultadosEsperados;
import fachada.Fachada;

@ManagedBean(name = "arcoMagueresController")
@SessionScoped
public class ArcoMagueresController {

	public int tabIndex;
    private EstudoDeCaso estudoDeCaso;
    private MatriculaCursoAluno matricula;
    private ArcoMaguerezEstudoDeCaso arcoMaguerez;
    
    private DataModel<DiagnosticoAlunoPlanejamento> listaDiagnosticosSelecionadosAluno;
    private DiagnosticoAlunoPlanejamento diagnosticoAlunoPlanejamento;
    
    private DataModel<Nanda> listaDiagnosticosSelecionadosPeloProfessor;
    private DataModel<Nic> listaNics;
    private DataModel<Noc> listaNocs;
    
    private Nanda nandaTemp;
    private Nic nicTemp;
    private Noc nocTemp;
    private DiagnosticosImplementacoes diagnosticoImplementacaoAluno;
    private DiagnosticosResultados diagnosticoResultadosAluno;
    
    public void prepararAdicionarNic(){}
    
    public void prepararAdicionarNoc(){}
    
    public String avancarFase(int fase){
    	try{
    		if(arcoMaguerez.getFaseDoArco() <= fase){
    			arcoMaguerez.setFaseDoArco(fase);
    			Fachada.getInstancia().atualizarArcoMaguerez(arcoMaguerez);
    		}
    		if(fase <= 4){
    			setTabIndex(fase);
    		}
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	
    	return "arcoMagueresController";
    }
    

    public String adicionarNic(){
    	
    	try{
        	Nic nicTemp = (Nic)(listaNics.getRowData());
        	
        	Implementacao implementacaoAluno = arcoMaguerez.getImplementacao();
        	List<DiagnosticosImplementacoes> implementacoesAluno = implementacaoAluno.getListaImplementacoesAluno();
        	boolean adicionado = false;
        	for (DiagnosticosImplementacoes diagnosticosImplementacoes : implementacoesAluno) {
				if(diagnosticosImplementacoes.getNandaProfessor().getId() == nandaTemp.getId()){
					diagnosticosImplementacoes.getNicsSelecionadosAluno().add(nicTemp);
					Fachada.getInstancia().atualizarDiagnosticosImplementacoes(diagnosticosImplementacoes);
					adicionado = true;
				}
			}
        	if(adicionado == false){
        		DiagnosticosImplementacoes diagnosticosImplementacoes = new DiagnosticosImplementacoes();
        		diagnosticosImplementacoes.setNandaProfessor(nandaTemp);
        		diagnosticosImplementacoes.getNicsSelecionadosAluno().add(nicTemp);
        		Fachada.getInstancia().persistirDiagnosticosImplementacoes(diagnosticosImplementacoes);
        		implementacaoAluno.getListaImplementacoesAluno().add(diagnosticosImplementacoes);
        	}
        	Fachada.getInstancia().atualizarImplementacao(implementacaoAluno);
        	
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Intervenção adicionada com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }
    
    public String adicionarNoc(){
    	
    	try{
        	Noc nocTemp = (Noc)(listaNocs.getRowData());
        	
        	ResultadosEsperados resultadosAluno = arcoMaguerez.getResultadosEsperados();
        	List<DiagnosticosResultados> listaResultadosAluno = resultadosAluno.getListaResultadosAluno();
        	boolean adicionado = false;
        	for (DiagnosticosResultados diagnosticosResultados : listaResultadosAluno) {
				if(diagnosticosResultados.getNandaProfessor().getId() == nandaTemp.getId()){
					diagnosticosResultados.getNocsSelecionadosAluno().add(nocTemp);
					Fachada.getInstancia().atualizarDiagnosticosResultados(diagnosticosResultados);
					adicionado = true;
				}
			}
        	if(adicionado == false){
        		DiagnosticosResultados diagnosticosResultados = new DiagnosticosResultados();
        		diagnosticosResultados.setNandaProfessor(nandaTemp);
        		diagnosticosResultados.getNocsSelecionadosAluno().add(nocTemp);
        		Fachada.getInstancia().persistirDiagnosticosResultados(diagnosticosResultados);
        		resultadosAluno.getListaResultadosAluno().add(diagnosticosResultados);
        	}
        	Fachada.getInstancia().atualizarResultadosEsperados(resultadosAluno);
        	
        	FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Resultado Esperado adicionado com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }
    
    public String excluirNicSelecionado(){
    	
    	try{
        	diagnosticoImplementacaoAluno.getNicsSelecionadosAluno().remove(nicTemp);
        	Fachada.getInstancia().atualizarDiagnosticosImplementacoes(diagnosticoImplementacaoAluno);
        	setNicTemp(new Nic());
        	setDiagnosticoImplementacaoAluno(new DiagnosticosImplementacoes());
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Intervenção removida com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	
    	return "arcoMagueresController";
    }
    
    public String excluirNocSelecionado(){
    	
    	try{
        	diagnosticoResultadosAluno.getNocsSelecionadosAluno().remove(nocTemp);
        	Fachada.getInstancia().atualizarDiagnosticosResultados(diagnosticoResultadosAluno);
        	setNocTemp(new Noc());
        	setDiagnosticoResultadosAluno(new DiagnosticosResultados());
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Resultado Esperado removido com sucesso!"));
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	
    	return "arcoMagueresController";
    }
    
    public ArcoMagueresController(){
    	tabIndex = 0;
    	setDiagnosticoAlunoPlanejamento(new DiagnosticoAlunoPlanejamento());
    	diagnosticoAlunoPlanejamento.setNomenclatura(new Nanda());
    }
    
    public DataModel<Nanda> getListarDiagnosticosSelecionadosPeloProfessor() {
    	listaDiagnosticosSelecionadosPeloProfessor = new ListDataModel<Nanda>(estudoDeCaso.getDiagnosticosSelecionadoProfessor());
        return listaDiagnosticosSelecionadosPeloProfessor;
    }
    
    public DataModel<Nic> getListarNics() {
    	List<Nic> listaNicsTemp = Fachada.getInstancia().getTodosNics();
    	listaNics = new ListDataModel<Nic>(listaNicsTemp);
        return listaNics;
    }
    
    public DataModel<Noc> getListarNocs() {
    	List<Noc> listaNocsTemp = Fachada.getInstancia().getTodosNocs();
    	listaNocs = new ListDataModel<Noc>(listaNocsTemp);
        return listaNocs;
    }
    
    public DataModel<DiagnosticoAlunoPlanejamento> getListarDiagnosticosSelecionadosAluno() {
        listaDiagnosticosSelecionadosAluno = new ListDataModel<DiagnosticoAlunoPlanejamento>(arcoMaguerez.getPlanejamento().getDiagnosticosSelecionadoAluno());
        return listaDiagnosticosSelecionadosAluno;
    }
    
    public String adicionarDiagnostico(){
    	try {
    		String termo = diagnosticoAlunoPlanejamento.getNomenclatura().getTermo();
    		List<Nanda> listNanda = Fachada.getInstancia().getNandaPorConsulta("termo", termo);
    		if(listNanda != null  && !listNanda.isEmpty()){
    			Nanda nandaTemp = listNanda.get(0);
    			diagnosticoAlunoPlanejamento.setNomenclatura(nandaTemp);
    		}
    		
			arcoMaguerez.getPlanejamento().getDiagnosticosSelecionadoAluno().add(diagnosticoAlunoPlanejamento);
			Fachada.getInstancia().atualizarPlanejamento(arcoMaguerez.getPlanejamento());
			listaDiagnosticosSelecionadosAluno = new ListDataModel<DiagnosticoAlunoPlanejamento>(arcoMaguerez.getPlanejamento().getDiagnosticosSelecionadoAluno());
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Diagnóstico inserido com sucesso!"));
			setDiagnosticoAlunoPlanejamento(new DiagnosticoAlunoPlanejamento());
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }
    
    public String preparaVisualizarArcoMagueres(){
    	try {
			ArcoMaguerezEstudoDeCaso arcoMaguerez = Fachada.getInstancia().getArcoMaguerezPorMatriculaCursoEstudoCaso(matricula, estudoDeCaso);
			
			if(arcoMaguerez == null){
				arcoMaguerez = new ArcoMaguerezEstudoDeCaso(ArcoMaguerezEstudoDeCaso.INVESTIGACAO, matricula, estudoDeCaso, new Planejamento(), new Implementacao(), new ResultadosEsperados(), new Avaliacao());
				arcoMaguerez = Fachada.getInstancia().inserirArcoMaguerez(arcoMaguerez);
			}else{
				if(arcoMaguerez.getFaseDoArco() >= 5){
					setTabIndex(4);
				}else{
					setTabIndex(arcoMaguerez.getFaseDoArco());
				}
			}
			setArcoMaguerez(arcoMaguerez);
			
			FacesContext.getCurrentInstance().getExternalContext().redirect(FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath()+"/restrict/aluno/arcomagueres.xhtml");
			setDiagnosticoAlunoPlanejamento(new DiagnosticoAlunoPlanejamento());
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
		}
    	
    	return "arcoMagueresController";
    }

    public List<Nanda> completeText(String query) {
		List<Nanda> lista = null;
		lista = Fachada.getInstancia().getNandaPorTituloAutocomplete(query.toUpperCase().trim()+"%");
        return lista;
    }
    
    public String removerDiagnostico(){
    	try {
    		DiagnosticoAlunoPlanejamento diagnostico = (DiagnosticoAlunoPlanejamento) listaDiagnosticosSelecionadosAluno.getRowData();
    		arcoMaguerez.getPlanejamento().getDiagnosticosSelecionadoAluno().remove(diagnostico);
    		Fachada.getInstancia().atualizarPlanejamento(arcoMaguerez.getPlanejamento());
    		listaDiagnosticosSelecionadosAluno = new ListDataModel<DiagnosticoAlunoPlanejamento>(arcoMaguerez.getPlanejamento().getDiagnosticosSelecionadoAluno());
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Diagnóstico removido com sucesso!"));	
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }
    
    public String salvarAvaliacao(){
    	try {
    		Avaliacao avaliacaoTemp = arcoMaguerez.getAvaliacao();
    		Fachada.getInstancia().atualizarAvaliacao(avaliacaoTemp);
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Avaliação salva com sucesso!"));	
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }
    
    public String adicionarNic(Nic nic){
    	
    	try {
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "", "Intervenção adicionado com sucesso!"));	
    	}catch(Exception ex){
    		FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "", "Algum erro aconteceu. Tente novamente mais tarde"));
    	}
    	return "arcoMagueresController";
    }

	public EstudoDeCaso getEstudoDeCaso() {
		return estudoDeCaso;
	}

	public void setEstudoDeCaso(EstudoDeCaso estudoDeCaso) {
		this.estudoDeCaso = estudoDeCaso;
	}

	public MatriculaCursoAluno getMatricula() {
		return matricula;
	}

	public void setMatricula(MatriculaCursoAluno matricula) {
		this.matricula = matricula;
	}


	public ArcoMaguerezEstudoDeCaso getArcoMaguerez() {
		return arcoMaguerez;
	}


	public void setArcoMaguerez(ArcoMaguerezEstudoDeCaso arcoMaguerez) {
		this.arcoMaguerez = arcoMaguerez;
	}

	public DiagnosticoAlunoPlanejamento getDiagnosticoAlunoPlanejamento() {
		return diagnosticoAlunoPlanejamento;
	}

	public void setDiagnosticoAlunoPlanejamento(DiagnosticoAlunoPlanejamento diagnosticoAlunoPlanejamento) {
		this.diagnosticoAlunoPlanejamento = diagnosticoAlunoPlanejamento;
	}

	public int getTabIndex() {
		return tabIndex;
	}

	public void setTabIndex(int tabIndex) {
		this.tabIndex = tabIndex;
	}

	public Nanda getNandaTemp() {
		return nandaTemp;
	}

	public void setNandaTemp(Nanda nandaTemp) {
		this.nandaTemp = nandaTemp;
	}

	public Nic getNicTemp() {
		return nicTemp;
	}

	public void setNicTemp(Nic nicTemp) {
		this.nicTemp = nicTemp;
	}

	public DiagnosticosImplementacoes getDiagnosticoImplementacaoAluno() {
		return diagnosticoImplementacaoAluno;
	}

	public void setDiagnosticoImplementacaoAluno(
			DiagnosticosImplementacoes diagnosticoImplementacaoAluno) {
		this.diagnosticoImplementacaoAluno = diagnosticoImplementacaoAluno;
	}

	public Noc getNocTemp() {
		return nocTemp;
	}

	public void setNocTemp(Noc nocTemp) {
		this.nocTemp = nocTemp;
	}

	public DiagnosticosResultados getDiagnosticoResultadosAluno() {
		return diagnosticoResultadosAluno;
	}

	public void setDiagnosticoResultadosAluno(
			DiagnosticosResultados diagnosticoResultadosAluno) {
		this.diagnosticoResultadosAluno = diagnosticoResultadosAluno;
	}

}
