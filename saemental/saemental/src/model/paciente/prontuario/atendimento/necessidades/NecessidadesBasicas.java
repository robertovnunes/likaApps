package model.paciente.prontuario.atendimento.necessidades;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="necessidadesbasicas")
public class NecessidadesBasicas implements Serializable{

	public int id;
	public boolean sonoAdequada;
	public boolean sonoAlterada;
	public String sonoRepousoQual;
	public boolean elimincaAdequada;
	public boolean elimincaAlterada;
	public String elimincaoQual;
	public boolean nutricaoMetabolismoAdequada;
	public boolean nutricaoMetabolismoAlterada;
	public String nutricaoMetabolismoQual;
	public boolean sexualidadeReproducaoAdequada;
	public boolean sexualidadeReproducaoAlterada;
	public String sexualidadeReproducaoQual;
	public boolean percepcaoSaudeAdequada;
	public boolean percepcaoSaudeAlterada;
	public String percepcaoSaudeQual;
	public boolean exercicioAdequada;
	public boolean exercicioAlterada;
	public String exercicioQual;
	public boolean cognicaoAdequada;
	public boolean cognicaoAlterada;
	public String cognicaoQual;
	public boolean papeisRelacionamentosAdequada;
	public boolean papeisRelacionamentosAlterada;
	public String papeisRelacionamentosQual;
	public boolean gerenciamentoEstresseAdequada;
	public boolean gerenciamentoEstresseAlterada;
	public String gerenciamentoEstresseQual;
	public boolean autoconceitoAdequada;
	public boolean autoconceitoAlterada;
	public String autoconceitoQual;
	public boolean necessidadesEspirituaisSim;
	public boolean necessidadesEspirituaisNao;
	
	public NecessidadesBasicas(){}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id", nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="sonoRepousoQual", nullable=true)
	public String getSonoRepousoQual() {
		return sonoRepousoQual;
	}
	public void setSonoRepousoQual(String sonoRepousoQual) {
		this.sonoRepousoQual = sonoRepousoQual;
	}
	
	@Column(name="elimincaoQual", nullable=true)
	public String getElimincaoQual() {
		return elimincaoQual;
	}
	public void setElimincaoQual(String elimincaoQual) {
		this.elimincaoQual = elimincaoQual;
	}
	
	@Column(name="nutricaoMetabolismoQual", nullable=true)
	public String getNutricaoMetabolismoQual() {
		return nutricaoMetabolismoQual;
	}
	public void setNutricaoMetabolismoQual(String nutricaoMetabolismoQual) {
		this.nutricaoMetabolismoQual = nutricaoMetabolismoQual;
	}
	
	@Column(name="sexualidadeReproducaoQual", nullable=true)
	public String getSexualidadeReproducaoQual() {
		return sexualidadeReproducaoQual;
	}
	public void setSexualidadeReproducaoQual(String sexualidadeReproducaoQual) {
		this.sexualidadeReproducaoQual = sexualidadeReproducaoQual;
	}
	
	@Column(name="percepcaoSaudeQual", nullable=true)
	public String getPercepcaoSaudeQual() {
		return percepcaoSaudeQual;
	}
	public void setPercepcaoSaudeQual(String percepcaoSaudeQual) {
		this.percepcaoSaudeQual = percepcaoSaudeQual;
	}
	
	@Column(name="exercicioQual", nullable=true)
	public String getExercicioQual() {
		return exercicioQual;
	}
	public void setExercicioQual(String exercicioQual) {
		this.exercicioQual = exercicioQual;
	}
	
	@Column(name="cognicaoQual", nullable=true)
	public String getCognicaoQual() {
		return cognicaoQual;
	}
	public void setCognicaoQual(String cognicaoQual) {
		this.cognicaoQual = cognicaoQual;
	}
	
	@Column(name="papeisRelacionamentosQual", nullable=true)
	public String getPapeisRelacionamentosQual() {
		return papeisRelacionamentosQual;
	}
	public void setPapeisRelacionamentosQual(String papeisRelacionamentosQual) {
		this.papeisRelacionamentosQual = papeisRelacionamentosQual;
	}
	
	@Column(name="gerenciamentoEstresseQual", nullable=true)
	public String getGerenciamentoEstresseQual() {
		return gerenciamentoEstresseQual;
	}
	public void setGerenciamentoEstresseQual(String gerenciamentoEstresseQual) {
		this.gerenciamentoEstresseQual = gerenciamentoEstresseQual;
	}
	
	@Column(name="autoconceito", nullable=true)
	public String getAutoconceitoQual() {
		return autoconceitoQual;
	}
	public void setAutoconceitoQual(String autoconceitoQual) {
		this.autoconceitoQual = autoconceitoQual;
	}
	
	@Column(name="necessidadesEspirituaisSim", nullable=true)
	public boolean isNecessidadesEspirituaisSim() {
		return necessidadesEspirituaisSim;
	}
	public void setNecessidadesEspirituaisSim(boolean necessidadesEspirituaisSim) {
		this.necessidadesEspirituaisSim = necessidadesEspirituaisSim;
	}
	
	@Column(name="necessidadesEspirituaisNao", nullable=true)
	public boolean isNecessidadesEspirituaisNao() {
		return necessidadesEspirituaisNao;
	}
	public void setNecessidadesEspirituaisNao(boolean necessidadesEspirituaisNao) {
		this.necessidadesEspirituaisNao = necessidadesEspirituaisNao;
	}

	@Column(name="sonoAdequada", nullable=true) 
	public boolean getSonoAdequada() {
		return sonoAdequada;
	}

	public void setSonoAdequada(boolean sonoAdequada) {
		this.sonoAdequada = sonoAdequada;
	}

	@Column(name="sonoAlterada", nullable=true) 
	public boolean getSonoAlterada() {
		return sonoAlterada;
	}

	public void setSonoAlterada(boolean sonoAlterada) {
		this.sonoAlterada = sonoAlterada;
	}

	@Column(name="elimincaAdequada", nullable=true) 
	public boolean getElimincaAdequada() {
		return elimincaAdequada;
	}

	public void setElimincaAdequada(boolean elimincaAdequada) {
		this.elimincaAdequada = elimincaAdequada;
	}

	@Column(name="elimincaAlterada", nullable=true)
	public boolean getElimincaAlterada() {
		return elimincaAlterada;
	}

	public void setElimincaAlterada(boolean elimincaAlterada) {
		this.elimincaAlterada = elimincaAlterada;
	}

	@Column(name="nutricaoMetabolismoAdequada", nullable=true) 
	public boolean getNutricaoMetabolismoAdequada() {
		return nutricaoMetabolismoAdequada;
	}

	public void setNutricaoMetabolismoAdequada(boolean nutricaoMetabolismoAdequada) {
		this.nutricaoMetabolismoAdequada = nutricaoMetabolismoAdequada;
	}

	@Column(name="nutricaoMetabolismoAlterada", nullable=true) 
	public boolean getNutricaoMetabolismoAlterada() {
		return nutricaoMetabolismoAlterada;
	}

	public void setNutricaoMetabolismoAlterada(boolean nutricaoMetabolismoAlterada) {
		this.nutricaoMetabolismoAlterada = nutricaoMetabolismoAlterada;
	}

	@Column(name="sexualidadeReproducaoAdequada", nullable=true) 
	public boolean getSexualidadeReproducaoAdequada() {
		return sexualidadeReproducaoAdequada;
	}

	public void setSexualidadeReproducaoAdequada(
			boolean sexualidadeReproducaoAdequada) {
		this.sexualidadeReproducaoAdequada = sexualidadeReproducaoAdequada;
	}

	@Column(name="sexualidadeReproducaoAlterada", nullable=true) 
	public boolean getSexualidadeReproducaoAlterada() {
		return sexualidadeReproducaoAlterada;
	}

	public void setSexualidadeReproducaoAlterada(
			boolean sexualidadeReproducaoAlterada) {
		this.sexualidadeReproducaoAlterada = sexualidadeReproducaoAlterada;
	}

	@Column(name="percepcaoSaudeAdequada", nullable=true) 
	public boolean getPercepcaoSaudeAdequada() {
		return percepcaoSaudeAdequada;
	}

	public void setPercepcaoSaudeAdequada(boolean percepcaoSaudeAdequada) {
		this.percepcaoSaudeAdequada = percepcaoSaudeAdequada;
	}

	@Column(name="percepcaoSaudeAlterada", nullable=true) 
	public boolean getPercepcaoSaudeAlterada() {
		return percepcaoSaudeAlterada;
	}

	public void setPercepcaoSaudeAlterada(boolean percepcaoSaudeAlterada) {
		this.percepcaoSaudeAlterada = percepcaoSaudeAlterada;
	}

	@Column(name="exercicioAdequada", nullable=true) 
	public boolean getExercicioAdequada() {
		return exercicioAdequada;
	}

	public void setExercicioAdequada(boolean exercicioAdequada) {
		this.exercicioAdequada = exercicioAdequada;
	}

	@Column(name="exercicioAlterada", nullable=true) 
	public boolean getExercicioAlterada() {
		return exercicioAlterada;
	}

	public void setExercicioAlterada(boolean exercicioAlterada) {
		this.exercicioAlterada = exercicioAlterada;
	}

	@Column(name="cognicaoAdequada", nullable=true) 
	public boolean getCognicaoAdequada() {
		return cognicaoAdequada;
	}

	public void setCognicaoAdequada(boolean cognicaoAdequada) {
		this.cognicaoAdequada = cognicaoAdequada;
	}

	@Column(name="cognicaoAlterada", nullable=true) 
	public boolean getCognicaoAlterada() {
		return cognicaoAlterada;
	}

	public void setCognicaoAlterada(boolean cognicaoAlterada) {
		this.cognicaoAlterada = cognicaoAlterada;
	}

	@Column(name="papeisRelacionamentosAdequada", nullable=true) 
	public boolean getPapeisRelacionamentosAdequada() {
		return papeisRelacionamentosAdequada;
	}

	public void setPapeisRelacionamentosAdequada(
			boolean papeisRelacionamentosAdequada) {
		this.papeisRelacionamentosAdequada = papeisRelacionamentosAdequada;
	}

	@Column(name="papeisRelacionamentosAlterada", nullable=true) 
	public boolean getPapeisRelacionamentosAlterada() {
		return papeisRelacionamentosAlterada;
	}

	public void setPapeisRelacionamentosAlterada(
			boolean papeisRelacionamentosAlterada) {
		this.papeisRelacionamentosAlterada = papeisRelacionamentosAlterada;
	}

	@Column(name="gerenciamentoEstresseAdequada", nullable=true) 
	public boolean getGerenciamentoEstresseAdequada() {
		return gerenciamentoEstresseAdequada;
	}

	public void setGerenciamentoEstresseAdequada(
			boolean gerenciamentoEstresseAdequada) {
		this.gerenciamentoEstresseAdequada = gerenciamentoEstresseAdequada;
	}

	@Column(name="gerenciamentoEstresseAlterada", nullable=true) 
	public boolean getGerenciamentoEstresseAlterada() {
		return gerenciamentoEstresseAlterada;
	}

	public void setGerenciamentoEstresseAlterada(
			boolean gerenciamentoEstresseAlterada) {
		this.gerenciamentoEstresseAlterada = gerenciamentoEstresseAlterada;
	}

	@Column(name="autoconceitoAdequada", nullable=true) 
	public boolean getAutoconceitoAdequada() {
		return autoconceitoAdequada;
	}

	public void setAutoconceitoAdequada(boolean autoconceitoAdequada) {
		this.autoconceitoAdequada = autoconceitoAdequada;
	}

	@Column(name="autoconceitoAlterada", nullable=true) 
	public boolean getAutoconceitoAlterada() {
		return autoconceitoAlterada;
	}

	public void setAutoconceitoAlterada(boolean autoconceitoAlterada) {
		this.autoconceitoAlterada = autoconceitoAlterada;
	}
	
	public void limparDados(){
		this.sonoAdequada= false;
		this.sonoAlterada= false;
		this.sonoRepousoQual= "";
		this.elimincaAdequada= false;
		this.elimincaAlterada= false;
		this.elimincaoQual= "";
		this.nutricaoMetabolismoAdequada= false;
		this.nutricaoMetabolismoAlterada= false;
		this.nutricaoMetabolismoQual= "";
		this.sexualidadeReproducaoAdequada= false;
		this.sexualidadeReproducaoAlterada= false;
		this.sexualidadeReproducaoQual= "";
		this.percepcaoSaudeAdequada= false;
		this.percepcaoSaudeAlterada= false;
		this.percepcaoSaudeQual= "";
		this.exercicioAdequada= false;
		this.exercicioAlterada= false;
		this.exercicioQual= "";
		this.cognicaoAdequada= false;
		this.cognicaoAlterada= false;
		this.cognicaoQual= "";
		this.papeisRelacionamentosAdequada= false;
		this.papeisRelacionamentosAlterada= false;
		this.papeisRelacionamentosQual= "";
		this.gerenciamentoEstresseAdequada= false;
		this.gerenciamentoEstresseAlterada= false;
		this.gerenciamentoEstresseQual= "";
		this.autoconceitoAdequada= false;
		this.autoconceitoAlterada= false;
		this.autoconceitoQual= "";
		this.necessidadesEspirituaisSim= false;
		this.necessidadesEspirituaisNao= false;
	}
	
	@Override
	public NecessidadesBasicas clone() {
		NecessidadesBasicas clone = new NecessidadesBasicas();
		clone.autoconceitoAdequada = autoconceitoAdequada;
		clone.autoconceitoAlterada = autoconceitoAlterada;
		clone.autoconceitoQual = autoconceitoQual;
		clone.cognicaoAdequada = cognicaoAdequada;
		clone.cognicaoAlterada = cognicaoAlterada;
		clone.cognicaoQual = cognicaoQual;
		clone.elimincaAdequada = elimincaAdequada;
		clone.elimincaAlterada = elimincaAlterada;
		clone.elimincaoQual = elimincaoQual;
		clone.exercicioAdequada = exercicioAdequada;
		clone.exercicioAlterada = exercicioAlterada;
		clone.exercicioQual = exercicioQual;
		clone.gerenciamentoEstresseAdequada = gerenciamentoEstresseAdequada;
		clone.gerenciamentoEstresseAlterada = gerenciamentoEstresseAlterada;
		clone.gerenciamentoEstresseQual = getGerenciamentoEstresseQual();
		clone.necessidadesEspirituaisNao = necessidadesEspirituaisNao;
		clone.necessidadesEspirituaisSim = necessidadesEspirituaisSim;
		clone.nutricaoMetabolismoAdequada = nutricaoMetabolismoAdequada;
		clone.nutricaoMetabolismoAlterada = nutricaoMetabolismoAlterada;
		clone.nutricaoMetabolismoQual = nutricaoMetabolismoQual;
		clone.papeisRelacionamentosAdequada = papeisRelacionamentosAdequada;
		clone.papeisRelacionamentosAlterada = papeisRelacionamentosAlterada;
		clone.papeisRelacionamentosQual = papeisRelacionamentosQual;
		clone.percepcaoSaudeAdequada = percepcaoSaudeAdequada;
		clone.percepcaoSaudeAlterada = percepcaoSaudeAlterada;
		clone.percepcaoSaudeQual = percepcaoSaudeQual;
		clone.sexualidadeReproducaoAdequada = sexualidadeReproducaoAdequada;
		clone.sexualidadeReproducaoAlterada = sexualidadeReproducaoAlterada;
		clone.sexualidadeReproducaoQual = sexualidadeReproducaoQual;
		clone.sonoAdequada = sonoAdequada;
		clone.sonoAlterada = sonoAlterada;
		clone.sonoRepousoQual = sonoRepousoQual;
		return clone;
	}
	
}
