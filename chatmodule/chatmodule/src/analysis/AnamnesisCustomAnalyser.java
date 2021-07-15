package analysis;

import java.io.Reader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.LowerCaseTokenizer;
import org.apache.lucene.analysis.StopFilter;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.br.BrazilianAnalyzer;
import org.apache.lucene.analysis.br.BrazilianStemFilter;
import org.apache.lucene.util.Version;

public class AnamnesisCustomAnalyser extends Analyzer {

	@Override
	public TokenStream tokenStream(String fildName, Reader reader) {
		StopFilter stopFilter = new StopFilter(Version.LUCENE_36, 
				new LowerCaseTokenizer( Version.LUCENE_36, reader ),
				BrazilianAnalyzer.getDefaultStopSet() ) ;
		stopFilter.setEnablePositionIncrements( true ) ;
		BrazilianStemFilter brStemFilter = new BrazilianStemFilter( stopFilter ) ;
		
		return brStemFilter ;
	}
	
}
