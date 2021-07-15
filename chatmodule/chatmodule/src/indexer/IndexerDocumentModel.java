package indexer;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import database.DataBaseConnector;

import analysis.AnamnesisCustomAnalyser;
import static indexer.IndexedFields.*;

public class IndexerDocumentModel {

	private DataBaseConnector connector ;
	
	public IndexerDocumentModel() throws InstantiationException, IllegalAccessException, ClassNotFoundException, 
	SQLException, IOException
	{
		connector = new DataBaseConnector() ;
		IndexWriter indexWriter = setUpIndexWriter() ;
		indexContent( indexWriter ) ;

		indexWriter.close() ;
		connector.closeConnection() ;
	}

	private void indexContent( IndexWriter indexWriter ) throws IOException, SQLException, InstantiationException,
	IllegalAccessException, ClassNotFoundException
	{
		String query = new String( "SELECT q1.id_secao, q1.id_topico, q1.id_questao, q3.ordenada, texto as texto_questao, q3.qtd_secoes, q2.qtd_topicos FROM questao q1, " +
				"(SELECT id_secao, COUNT(id_topico) as qtd_topicos FROM topico GROUP BY id_secao ) q2, " + 
				"(SELECT id_secao, ordenada, COUNT(id_secao) as qtd_secoes FROM secao) q3 WHERE q1.id_secao=q2.id_secao AND q3.qtd_secoes ;" ) ;

		ResultSet result = connector.db_query( query ) ;
		writeDocs( result, indexWriter ) ;
		result.close() ;
	}

	private void writeDocs( ResultSet result, IndexWriter indexWriter ) throws SQLException, CorruptIndexException, IOException,
	InstantiationException, IllegalAccessException, ClassNotFoundException
	{
		Document doc = new Document() ;
		NumericField id_clinical_case = new NumericField( ID_CLINICAL_CASE.getValue(), Field.Store.YES, true ) ;
		NumericField id_section = new NumericField( ID_SECTION.getValue(), Field.Store.YES, true ) ;
		NumericField qty_sections = new NumericField( QTY_SECTIONS.getValue(), Field.Store.YES, true ) ;
		NumericField id_topic = new NumericField( ID_TOPIC.getValue(), Field.Store.YES, true ) ;
		NumericField qty_topics = new NumericField( QTY_TOPICS.getValue(), Field.Store.YES, true ) ;
		NumericField id_question = new NumericField( ID_QUESTION.getValue(), Field.Store.YES, true ) ;
		NumericField ordered = new NumericField( ORDERED.getValue(), Field.Store.YES, true ) ;
		Field storedAnswer = new Field( "resposta",	"", Field.Store.YES, Field.Index.NOT_ANALYZED );
		
		while( result.next() )
		{
			id_section.setIntValue( result.getInt( ID_SECTION.getValue() ) ) ;
			qty_sections.setIntValue( result.getInt( QTY_SECTIONS.getValue() ) ) ;
			id_topic.setIntValue( result.getInt( ID_TOPIC.getValue() ) ) ;
			qty_topics.setIntValue( result.getInt( QTY_TOPICS.getValue() ) ) ;
			id_question.setIntValue( result.getInt( ID_QUESTION.getValue() ) ) ;
			ordered.setIntValue( result.getInt( ORDERED.getValue() ) ) ;

			doc.add( id_section ) ;
			doc.add( qty_sections ) ;
			doc.add( id_topic ) ;
			doc.add( qty_topics ) ;
			doc.add( id_question ) ;
			doc.add( ordered ) ;
			doc.add( new Field( QUESTION_TEXT.getValue(), result.getString( QUESTION_TEXT.getValue() ),
					Field.Store.YES, Field.Index.ANALYZED ) ) ;

			String query = String.format( "SELECT id_caso_clinico, texto as texto_resposta" +
							" FROM resposta WHERE id_secao=%d AND id_topico=%d",
							result.getInt( ID_SECTION.getValue() ), result.getInt( ID_TOPIC.getValue() ) ) ;

			ResultSet resultResp = connector.db_query( query ) ;		
			while( resultResp.next() )
			{
				id_clinical_case.setIntValue( resultResp.getInt( ID_CLINICAL_CASE.getValue() ) ) ;
				doc.add( id_clinical_case ) ;
				
				storedAnswer.setValue( resultResp.getString( ANSWER_TEXT.getValue() ) ) ;
				
				/*doc.add( new Field( String.format( "resposta%d", resultResp.getRow() ), 
						resultResp.getString( ANSWER_TEXT.getValue() ), Field.Store.YES, Field.Index.NOT_ANALYZED ) ) ;*/
				
				doc.add( storedAnswer ) ;
			}

			resultResp.close() ;
			indexWriter.addDocument( doc ) ;
		}
	}

	private IndexWriter setUpIndexWriter() throws IOException
	{
		Directory dir = FSDirectory.open( new File( "./WebContent/index" ) ) ;
		IndexWriterConfig config = new IndexWriterConfig( Version.LUCENE_36, new AnamnesisCustomAnalyser() ) ;
		IndexWriter indexWriter = new IndexWriter( dir, config ) ;

		return indexWriter ;
	}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, 
	ClassNotFoundException, SQLException, IOException {
		new IndexerDocumentModel() ;
	}
	
}
