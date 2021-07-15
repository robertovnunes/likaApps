package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.ParseException;

import searcher.SearcherDocumentModel;
import stm.QuestioningScript;
import stm.VirtualPatientState;
import util.Directories;

public class Dialogo {

	private SearcherDocumentModel searcher ;
	private QuestioningScript questioning ;
	
	public Dialogo( Directories dir ) throws IOException, InstantiationException, 
	IllegalAccessException, ClassNotFoundException, SQLException
	{
		searcher = new SearcherDocumentModel( dir ) ;
		questioning = new QuestioningScript() ;
	}
	
	public VirtualPatientState askPatient( String question ) throws ParseException, IOException
	{
		ArrayList<Document> docs = searcher.phraseQuery( 1, question ) ;
	
		return questioning.sendDocument( docs ) ;
	}
	
}
