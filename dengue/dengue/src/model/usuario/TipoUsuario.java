package model.usuario;

public enum TipoUsuario {
	INVESTIGADOR, PESSOA_FISICA;
	
	public String toString() {
		if(this.equals(INVESTIGADOR)){
			return "Investigador";
		}else if(this.equals(PESSOA_FISICA)){
			return "Pessoa Física";
		}else{
			return null;
		}
	};
	
}
