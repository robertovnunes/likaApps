<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ include file="/jsp/inc_header.jsp"%>


<link href="../css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="../css/default.ultimate.css" media="screen" rel="stylesheet" type="text/css" />
        
        
        <link rel="stylesheet" type="text/css" href="../css/jTPS.css" />
		<link href="../css/tabela.css" rel="stylesheet" type="text/css" />
        <link href="../css/menu.css" rel="stylesheet" type="text/css" />
           <style>
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                }
        </style>
</head>
<body>
<%@ include file="/jsp/inc_topo.jsp"%>


<div align='center' id="main-content" >
		<div id="nurse" style='display:inline-block;'>
			
		</div>


		<div id="highligths" style="width: 450px;display:inline-block; vertical-align: top;">
			
			
			
				<jsp:include page="menu.jsp"  flush="true"/>	
			
			
			
			
		</div>
		
		<br /><br /><br /><br />
		
</div>



<%@ include file="/jsp/inc_rodape.jsp"%>
</body>

</html>