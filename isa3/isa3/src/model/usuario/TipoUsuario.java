package model.usuario;

public enum TipoUsuario {
	ADMINISTRADOR(2), PROFESSOR(1), ALUNO(0);
	
	private int sequencia;
	
	private TipoUsuario(int sequencia) {
		this.sequencia = sequencia;
	}
	
	public String toString() {
		if(this.equals(ADMINISTRADOR)){
			return "administrador";
		}else if(this.equals(PROFESSOR)){
			return "professor";
		}else if(this.equals(ALUNO)){
			return "aluno";
		}else{
			return null;
		}
	}

	public int getSequencia() {
		return sequencia;
	}

	public void setSequencia(int sequencia) {
		this.sequencia = sequencia;
	};
	
}
