package stm;

public class RepeatedAskState extends VirtualPatientState {

	@Override
	public String responseState() {
		return "Eu acho que você já me fez esta pergunta.";
	}
	
}
