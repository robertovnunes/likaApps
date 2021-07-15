package stm;

public class UnorderedAskState extends VirtualPatientState {

	@Override
	public String responseState() {
		return "Pergunta fora de ordem.";
	}

}
