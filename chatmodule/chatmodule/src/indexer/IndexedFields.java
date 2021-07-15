package indexer;

public enum IndexedFields {
	
	ID_CLINICAL_CASE( "id_caso_clinico" ),
	ID_SECTION( "id_secao" ),
	ID_TOPIC( "id_topico" ),
	ID_QUESTION( "id_questao" ),
	ID_ANSWER( "id_resposta" ),
	ORDERED( "ordenada" ),
	ANSWER_TEXT( "resposta" ),
	QUESTION_TEXT( "texto_questao" ),
	QTY_SECTIONS( "qtd_secoes" ),
	QTY_TOPICS( "qtd_topicos" ) ;
	
	private final String value ;
	
	IndexedFields( String field ) 
	{
		value = field ;
	}
	
	public String getValue()
	{
		return value ;
	}

}
