package stm;

public class Section {

	private int id_section ;
	private boolean topics [] ;
	private int remaingTopics ;
	private boolean ordered ;
	private int id_expectedTopic ;

	public Section( int id_section, int qty_topics, boolean ordered )
	{
		this.id_section = id_section ;
		topics = new boolean[ qty_topics + 1 ] ;
		this.ordered = ordered ;
		remaingTopics = qty_topics ;
		id_expectedTopic = 1 ;
	}

	public boolean isOrdered()
	{
		return ordered ;
	}

	public void markTopic( int id_topico )
	{
		topics[ id_topico ] = true ;
		remaingTopics = remaingTopics - 1 ;

		if ( ordered )
			id_expectedTopic = id_expectedTopic + 1 ;
	}

	public int sectionId()
	{
		return id_section ;
	}

	public boolean isExpectedSection( int id_section )
	{
		return ( this.id_section == id_section ) ;
	}

	public boolean isMarkedTopic( int id_topic )
	{
		return topics[ id_topic ] ;
	}

	public boolean isExpectedTopic( int id_topic )
	{
		return ( id_expectedTopic == id_topic ) ;
	}

	public boolean isEnd()
	{
		if ( remaingTopics == 0 )
			return true ;
		else
			return false ;
	}
}