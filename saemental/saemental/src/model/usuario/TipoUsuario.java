package model.usuario;

public enum TipoUsuario {
	ENFERMEIRO, PROFESSOR, ALUNOLABORATORIO, ALUNOENFERMARIA;;
	
	public String toString() {
		if(this.equals(ENFERMEIRO)){
			return "enfermeiro";
		}else if(this.equals(PROFESSOR)){
			return "professor";
		}else if(this.equals(ALUNOLABORATORIO)){
			return "alunoLab";
		}else if(this.equals(ALUNOENFERMARIA)){
			return "alunoEnf";
		}else{
			return null;
		}
	};
	
}
