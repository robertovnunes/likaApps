package br.com.lika.hpv.logic;

import br.com.lika.hpv.interceptor.DAOInterceptor;
import br.com.lika.hpv.interceptor.ViralInterceptor;
import org.vraptor.annotations.Component;
import org.vraptor.annotations.InterceptedBy;

@Component("viral")
@InterceptedBy({DAOInterceptor.class, ViralInterceptor.class})
public class ViralLogic
{
}

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.logic.ViralLogic
 * JD-Core Version:    0.6.0
 */