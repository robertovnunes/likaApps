package lika.util;

 import  java.io.IOException;  
   
 import javax.servlet.Filter;  
 import javax.servlet.FilterChain;  
 import javax.servlet.FilterConfig;  
 import javax.servlet.ServletException;  
 import javax.servlet.ServletRequest;  
 import javax.servlet.ServletResponse;  
 import javax.servlet.http.HttpServletRequest;  
 import javax.servlet.http.HttpSession;  
   
 import org.apache.commons.logging.Log;  
 import org.apache.commons.logging.LogFactory;  
 import org.hibernate.FlushMode;  
 import org.hibernate.Session;  
 import org.hibernate.SessionFactory;  
 import org.springframework.dao.DataAccessResourceFailureException;  
 import org.springframework.orm.hibernate3.SessionFactoryUtils;  
 import org.springframework.orm.hibernate3.SessionHolder;  
 import org.springframework.transaction.support.TransactionSynchronizationManager;  
 import org.springframework.web.context.WebApplicationContext;  
 import org.springframework.web.context.support.WebApplicationContextUtils;  
   
 public class KeepSessionPerPage implements Filter {  
   
     private static Log log = LogFactory.getLog(KeepSessionPerPage.class);  
   
     public static final String DEFAULT_SESSION_FACTORY_NAME = "sessionFactory";  
     public static final String HIBERNATE_SESSION_KEY = "hibernateSession";  
     public static final String HIBERNATE_SCOPE_KEY = "hibernateCurrentSessionScope";  
     private static final String HIBERNATE_FLUSH_MODE_KEY = "FlushMode";  
     private static final String HIBERNATE_SESSION_FACTORY_REFERENCE_KEY = "SessionFactoryReference";  
   
     private SessionFactory sessionFactory;  
     private FlushMode flushMode = FlushMode.MANUAL;  
   
     public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)   
             throws IOException, ServletException {  
   
         HttpServletRequest httpRequest = (HttpServletRequest) request;  
         HttpSession httpSession = ((HttpServletRequest) request).getSession();  
   
         Integer newResourceCode = getNewPageCode(httpRequest);  
         boolean participate = false;  
         boolean createNewSession = outOfCurrentScope(newResourceCode, httpSession);  
   
         if (TransactionSynchronizationManager.hasResource(sessionFactory)) {  
             participate = true;  
         } else {  
               
             Session session;  
             Session keptSession = (org.hibernate.classic.Session) httpSession.getAttribute(HIBERNATE_SESSION_KEY);  
               
             if (keptSession == null) {  
                 log.debug("No session kept");  
                 log.info("Opening new session for page: " + httpRequest.getRequestURL());  
                 session = getSession(sessionFactory);  
             } else if (keptSession != null && createNewSession) {  
                 log.debug("Closing current session");  
                SessionFactoryUtils.closeSession(keptSession);  
   
                 log.info("Opening new session for page: " + httpRequest.getRequestURL());  
                 session = getSession(sessionFactory);  
             } else  
                 session = keptSession;  
   
             TransactionSynchronizationManager.bindResource(sessionFactory, new SessionHolder(session));  
   
             try {  
                 chain.doFilter(request, response);  
             } finally {  
                 if (!participate) {  
                     log.debug("Unbinding session");  
                     SessionHolder sessionHolder = (SessionHolder) TransactionSynchronizationManager.unbindResource(sessionFactory);  
                     httpSession.setAttribute(HIBERNATE_SESSION_KEY, sessionHolder.getSession());  
                     httpSession.setAttribute(HIBERNATE_SCOPE_KEY, newResourceCode);  
                 }  
             }  
         }  
     }  
   
     public void init(FilterConfig filterConfig) throws ServletException {  
           
         String sessionFactoryRef = filterConfig.getInitParameter(HIBERNATE_SESSION_FACTORY_REFERENCE_KEY);  
           
         if (sessionFactoryRef == null) {  
             sessionFactoryRef = DEFAULT_SESSION_FACTORY_NAME;  
         }  
           
         WebApplicationContext webAppContext = WebApplicationContextUtils.getWebApplicationContext(filterConfig.getServletContext());  
         sessionFactory = (SessionFactory) webAppContext.getBean(sessionFactoryRef, SessionFactory.class);  
   
         String flushModeParam = filterConfig.getInitParameter(HIBERNATE_FLUSH_MODE_KEY);  
           
         if (flushModeParam == null) {  
             return;  
         } else if (flushModeParam.equals("ALWAYS")) {  
             flushMode = FlushMode.ALWAYS;  
         } else if (flushModeParam.equals("AUTO")) {  
             flushMode = FlushMode.AUTO;  
         } else if (flushModeParam.equals("COMMIT")) {  
             flushMode = FlushMode.COMMIT;  
         } else if (flushModeParam.equals("MANUAL")) {  
             flushMode = FlushMode.MANUAL;  
         } else if (flushModeParam.equals("NEVER")) {  
             flushMode = FlushMode.MANUAL; // FlushMode.NEVER esta deprecated utilizar FlushMode.MANUAL.  
         }  
     }  
   
     public void destroy() {  
     }  
   
     private Integer getNewPageCode(HttpServletRequest request) {  
         return (Integer) request.getRequestURL().toString().hashCode();  
     }  
   
     private boolean outOfCurrentScope(Integer newResourceCode, HttpSession httpSession) {  
           
         Integer currentResourceCode = (Integer) httpSession.getAttribute(HIBERNATE_SCOPE_KEY);  
   
         if (currentResourceCode == null) {  
             log.debug("No scope found");  
             return true;  
         } else {  
             log.debug("Current page code: " + currentResourceCode);  
             log.debug("New page code: " + newResourceCode);  
   
             if (currentResourceCode.equals(newResourceCode)) {  
                 log.debug("Request is in current session scope");  
                 return false;  
             } else {  
                 log.debug("Request is out of current session scope");  
                 return true;  
             }  
         }  
     }  
   
     private Session getSession(SessionFactory sessionFactory) throws DataAccessResourceFailureException {  
         Session session = SessionFactoryUtils.getSession(sessionFactory, true);  
         session.setFlushMode(flushMode);  
         return session;  
     }  
     
 }