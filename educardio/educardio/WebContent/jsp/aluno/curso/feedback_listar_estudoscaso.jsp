<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <jsp:include page="../../inc_header.jsp"  flush="true"/>
     <script language="JavaScript" type="text/javascript" src="js/popup.js" ></script>
	
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="screen" />	
     
    
</head>
<body>

<div id="container">

	  <jsp:include page="inc_topo_curso.jsp"  flush="true"/>
    
    <div id="middle">    
		<div id="middle_align">

            <div id="wrapper" class="logado avalia">
            
        	  <h3 class="bread">CR<c:out value="${matricula.curso.id}"></c:out> > Estudo de Casos</h3>

			<table >
            	<tr>
                	<th>C?d</th>
                    <th>Caso</th>
                    <th>Observa??o da Realidade</th>
                    <th>Pontos-Chaves</th>
                    <th>Teoriza??o</th>
                    <th>Hip?teses de Solu??o</th>
                    <th>Aplica??o ? Realidade</th> 
                    <th>Coment?rios e Men??o</th>
                </tr>
            	
            	
                 <c:forEach items="${arcosMaguerez}" var="arco" varStatus="index">
	            	<tr>
	            		<td>EC<c:out value="${arco.estudoDeCaso.id}"></c:out></td>
	                    <td><c:out value="${arco.estudoDeCaso.titulo}"></c:out></td>
	                   	<td>
	                   		 <c:if test="${arco.faseDoArco == 0}">
						        <img src="imagens/icons/Play-1-Normal-Red-icon.png" />
					        </c:if>
					         <c:if test="${arco.faseDoArco > 0}">
						        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png" />
					        </c:if>
	                   	</td>
	                   	<td>
	                   		 <c:if test="${arco.faseDoArco < 1}">
							        <img src="imagens/icons/Play-1-Disabled-icon.png" />
						       </c:if>
						        <c:if test="${arco.faseDoArco == 1}">
							        <img src="imagens/icons/Play-1-Normal-Red-icon.png" />
						        </c:if>
						        <c:if test="${arco.faseDoArco > 1}">
							        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png" />
						       </c:if>
	                   	</td>
	                   	<td>
	                   		 <c:if test="${arco.faseDoArco < 2}">
							        <img src="imagens/icons/Play-1-Disabled-icon.png" />
						       </c:if>
						        <c:if test="${arco.faseDoArco == 2}">
							        <img src="imagens/icons/Play-1-Normal-Red-icon.png" />
						        </c:if>
						        <c:if test="${arco.faseDoArco > 2}">
							        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png" />
						       </c:if>
	                   	</td>
	                   	<td>
	                   		  <c:if test="${arco.faseDoArco < 3}">
							        <img src="imagens/icons/Play-1-Disabled-icon.png" />
						       </c:if>
						        <c:if test="${arco.faseDoArco == 3}">
							        <img src="imagens/icons/Play-1-Normal-Red-icon.png" />
						        </c:if>
						        <c:if test="${arco.faseDoArco > 3}">
							        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png" />
						       </c:if>
	                   	</td>
	                   	<td>
	                   		  <c:if test="${arco.faseDoArco < 4}">
							        <img src="imagens/icons/Play-1-Disabled-icon.png" />
						       </c:if>
						        <c:if test="${arco.faseDoArco == 4}">
							        <img src="imagens/icons/Play-1-Normal-Red-icon.png" />
						        </c:if>
						        <c:if test="${arco.faseDoArco > 4}">
							        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png" />
						       </c:if>
	                   	</td>
	                   	<td>
	                   			<img src="imagens/icons/icon_search.png" id="EC<c:out value="${arco.id}"></c:out>" style="cursor: pointer;" />
	                   			   
							     <script type="text/javascript">
									     $('#EC<c:out value="${arco.id}"></c:out>').click(function(){
									 		
								    		   $("#pontos-chave-comentarios").html('Coment?rios:<c:out value="${arco.pontosChave.avaliacaoProfessor.comentario}"></c:out>');
								    		   $("#pontos-chave-nota").html('Men??o:<c:out value="${arco.pontosChave.avaliacaoProfessor.nota}"></c:out>');
								    		   
								    		   $("#teorizacao-comentarios").html('Coment?rios:<c:out value="${arco.teorizacao.avaliacaoProfessor.comentario}"></c:out>');
								    		   $("#teorizacao-nota").html('Men??o:<c:out value="${arco.teorizacao.avaliacaoProfessor.nota}"></c:out>');
								    		   
								    		   $("#hipoteses-comentarios").html('Coment?rios:<c:out value="${arco.hipotesesDeSolucao.avaliacaoProfessor.comentario}"></c:out>');
								    		   $("#hipoteses-nota").html('Men??o:<c:out value="${arco.hipotesesDeSolucao.avaliacaoProfessor.nota}"></c:out>');
										 		centerPopup();
										 		loadPopup();
									    	
									 	});
							     </script>   
                   		</td>
	            	</tr>
	            </c:forEach>


            </table>
                
            </div><!-- /#wrapper -->

    	</div><!-- /#middle_align -->
    		<div style="width: 100%; height: 350px;"></div>
    </div><!-- /#middle -->    
    
	<jsp:include page="../../inc_rodape.jsp"  flush="true"/>
  
    
</div><!-- /#container -->

<div id="popupContact" style="position: absolute; top: 184.167px; left: 0px; display: none;">
		<a id="popupContactClose">sair</a>
		<h1>Visualizar Avalia??o!</h1>
		<p id="contactArea">
				<b>Pontos-Chaves:</b><br />
				<div id="pontos-chave-comentarios"></div><br />
				<div id="pontos-chave-nota"></div><br />
				
				<b>Teoriza??o:</b><br />
				<div id="teorizacao-comentarios"></div><br />
				<div id="teorizacao-nota"></div><br />
				
				<b>Hip?teses de Solu??o:</b><br />
				<div id="hipoteses-comentarios"></div><br />
				<div id="hipoteses-nota"></div><br />
		</p>
</div>
<div id="backgroundPopup"></div>

</body>
</html>    