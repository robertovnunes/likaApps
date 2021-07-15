<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<head>

<%@ include file="/JSPs/inc_header.jsp"%>
</head>
<body>
<%@ include file="/JSPs/inc_topo.jsp"%>


<div align='center' id="main-content" >
		
				<jsp:include page="../menu.jsp"  flush="true"/>	
        

                
                <br />
                
                <div style="margin-top:15px;">
                <c:import  url="/paciente.do?method=mostrarTelaPacienteBuscar"></c:import>		
                </div>
            
		
</div>



<%@ include file="/JSPs/inc_rodape.jsp"%>
</body>
</html>