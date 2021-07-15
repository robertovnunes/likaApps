package util;

import java.io.File;

public class Directories {
	
	private String realPath ;
	
	public Directories( String realPath )
	{
		this.realPath = realPath ;
	}
	
	public File getIndexDiretory()
	{
		return new File( String.format( "%s%s", realPath, "index" ) ) ;
	}
}
