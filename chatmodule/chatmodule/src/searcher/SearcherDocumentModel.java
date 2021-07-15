package searcher;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import util.Directories;

import analysis.AnamnesisCustomAnalyser;

public class SearcherDocumentModel {

	private QueryParser parser ;
	private IndexSearcher indexSearcher ;

	public SearcherDocumentModel( Directories dir ) throws IOException
	{
		AnamnesisCustomAnalyser analyser = new AnamnesisCustomAnalyser() ;
		parser = new QueryParser( Version.LUCENE_36, "texto_questao", analyser ) ;
		parser.setPhraseSlop( 5 );
		IndexReader indexReader = IndexReader.open( FSDirectory.open( dir.getIndexDiretory() ) ) ;
		indexSearcher = new IndexSearcher( indexReader ) ;
	}

	public ArrayList<Document> phraseQuery( int id_caso_clinico, String question ) throws ParseException, IOException
	{
		ArrayList<Document> queriedDocs = new ArrayList<Document>() ;
		String phraseQuery = String.format("\"%s\"", question ) ;
		String clinicalCase = String.valueOf( id_caso_clinico ) ;

		Query q = parser.parse( phraseQuery ) ;
		queriedDocs = searchInClinicalCase( q, clinicalCase ) ;

		return queriedDocs ;
	}

	public String getAnswer( Document doc )
	{
		return doc.get( "resposta" ) ;
	}

	private ArrayList<Document> searchInClinicalCase( Query q, String clinicalCase ) throws IOException
	{
		TopDocs docs = indexSearcher.search( q, 3 ) ;		// tenta achar até 50 matches
		ArrayList<Document> queryDocs = new ArrayList<Document>() ;
		Document doc ;

		for( ScoreDoc scoreDoc : docs.scoreDocs )
		{
			doc = indexSearcher.doc( scoreDoc.doc ) ;

			if ( clinicalCase.compareTo( doc.get( "id_caso_clinico" ) ) == 0 )
				queryDocs.add( doc ) ;
		}

		return  queryDocs ;
	}

}
