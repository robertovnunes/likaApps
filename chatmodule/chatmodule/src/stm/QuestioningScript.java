package stm;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

import org.apache.lucene.document.Document;

import database.DataBaseConnector;
import static indexer.IndexedFields.*;

public class QuestioningScript {

	private Iterator<Section> sectionIterator ;
	private Section currentSection ;
	private VirtualPatientSTM stm ;

	public QuestioningScript() throws InstantiationException, IllegalAccessException,
	ClassNotFoundException, SQLException
	{
		stm = new VirtualPatientSTM() ;
		Vector<Section> script = new Vector<Section>() ;
		int id_section, qty_topics ;
		boolean ordered ;
		DataBaseConnector connector = new DataBaseConnector() ;

		String query = "SELECT s.id_secao, COUNT(t.id_topico) AS qtd_topicos, s.ordenada FROM secao s, topico t " +
				"WHERE t.id_secao = s.id_secao GROUP BY s.id_secao" ;
		ResultSet result = connector.db_query( query ) ;

		while( result.next() )
		{
			id_section = result.getInt( ID_SECTION.getValue() ) ;
			qty_topics = result.getInt( QTY_TOPICS.getValue() ) ;
			ordered = ( result.getInt( ORDERED.getValue() ) == 1 );
			script.add( new Section( id_section, qty_topics, ordered ) ) ;
		}

		connector.closeConnection() ;
		sectionIterator = script.iterator() ;
		currentSection = sectionIterator.next() ;
	}

	public void process( ArrayList<Document> docs ) 
	{
		Document doc = null ;

		if ( docs.isEmpty() ) 
			stm.toMisunderstoodQuestionState() ;

		else
		{
			doc = docs.get( 0 ) ;
			int id_section = Integer.parseInt( doc.get( ID_SECTION.getValue() ) ) ;
			int id_topic = Integer.parseInt( doc.get( ID_TOPIC.getValue() ) ) ;

			if ( currentSection.isExpectedSection( id_section ) )
			{
				if ( currentSection.isMarkedTopic( id_topic ) )
					stm.toRepeatedQuestionState( doc ) ;
				//
				else if ( currentSection.isOrdered() && !currentSection.isExpectedTopic( id_topic ) )
					stm.toUnorderedQuestionState( doc ) ;
				//
				else
				{
					stm.toWaitingAskState( doc ) ;
					currentSection.markTopic( id_topic ) ;
				}

				if ( currentSection.isEnd() )
				{
					if ( sectionIterator.hasNext() )
						currentSection = sectionIterator.next() ;
					else
						stm.toQuestioningDoneState( doc ) ;
				}
			}
			else if ( currentSection.sectionId() < id_section )
				stm.toRepeatedQuestionState( doc ) ;
			//
			else
				stm.toUnorderedQuestionState( doc ) ;
		}
	}

	public VirtualPatientState sendDocument( ArrayList<Document> docs )
	{
		process(docs);
		VirtualPatientState state = stm.getCurrentState();

		return state;
	}

}
