package stm;

import org.apache.lucene.document.Document;

public abstract class VirtualPatientState {
	
	private Document currentDocument ;
	
	public Document getCurrentDocument()
	{
		return currentDocument ;
	}
	
	public void setCurrentDocument( Document doc )
	{
		currentDocument = doc ;
	}
	
	public abstract String responseState() ;
	
}
