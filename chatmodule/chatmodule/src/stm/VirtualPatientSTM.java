package stm;

import org.apache.lucene.document.Document;

public class VirtualPatientSTM {

	private VirtualPatientState currentState ;

	protected VirtualPatientSTM()
	{
		currentState = new WaitingAskState() ;
		currentState.setCurrentDocument( new Document() ) ;
	}

	protected void setCurrentState( VirtualPatientState state )
	{
		currentState = state ;
	}

	protected VirtualPatientState getCurrentState()
	{
		return currentState ;
	}

	protected void toMisunderstoodQuestionState() 
	{
		currentState = new MisunderstoodQuestionState() ;
	} 
	
	protected void toRepeatedQuestionState( Document doc ) 
	{
		currentState = new RepeatedAskState() ;
		currentState.setCurrentDocument( doc ) ;
	}
	
	protected void toUnorderedQuestionState( Document doc ) 
	{
		currentState = new UnorderedAskState() ;
		currentState.setCurrentDocument( doc ) ;
	}
	
	protected void toWaitingAskState( Document doc ) 
	{
		currentState = new WaitingAskState() ;
		currentState.setCurrentDocument( doc ) ;
	}
	
	protected void toQuestioningDoneState( Document doc )
	{
		currentState = new QuestioningDoneState() ;
		currentState.setCurrentDocument( doc ) ;
	}
}
