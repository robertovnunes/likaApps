package stm;

import org.apache.lucene.document.Document;
import static indexer.IndexedFields.ANSWER_TEXT;

public class WaitingAskState extends VirtualPatientState {

	@Override
	public String responseState() 
	{
		Document doc = getCurrentDocument() ;		
		return doc.get( ANSWER_TEXT.getValue() ) ;
	}

}
