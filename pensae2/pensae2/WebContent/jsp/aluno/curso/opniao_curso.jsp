<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <jsp:include page="../../inc_header.jsp"  flush="true"/>
 		 
    
</head>
<body>

<div id="container">

	  <jsp:include page="inc_topo_curso.jsp"  flush="true"/>
    
    <div id="middle">    
		<div id="middle_align">

            <div id="wrapper" class="logado avalia">
            
		          <h3 class="bread">CR<c:out value="${matricula.curso.id}"></c:out> > Minha Opini�o  Sobre o Curso</h3>
		         <h:form action="salvarOpniaoSobreCurso" >
					<h:hidden property="method" value="salvarOpniaoSobreCurso"/>
	               
		            <h:hidden property="idMatriculaCursoAluno" value="${matricula.id}"/>
					1�: Qual foi seu sentimento participando do curso de extens�o "O Processo de Enfermagem Aplicado � Crian�a de 0 a 2 anos"?       
					<textarea id="pergunta1"  name="pergunta1" style="width: 600px; height: 150px; "><c:out value="${matricula.pergunta1 }"></c:out></textarea><br />
					2�: A partir dos tr�s cen�rios que voc� conheceu no curso, fale sobre os pontos facilitadores e dificultadores em rela��o � aprendizagem do Processo de Enfermagem. 
					<textarea id="pergunta2"  name="pergunta2" style="width: 600px; height: 150px; "><c:out value="${matricula.pergunta2}"></c:out></textarea><br />
					3�: A partir da sua experi�ncia na utiliza��o do software educativo PenSAE, fale sobre os pontos positivos e negativos deste sistema.
					<textarea id="pergunta3"  name="pergunta3" style="width: 600px; height: 150px; "><c:out value="${matricula.pergunta3}"></c:out></textarea><br />
					4�: Ao terminar o curso de extens�o, voc� considera estar preparado para o exerc�cio pr�tico do Processo de Enfermagem a crian�a de 0 a 2 anos?
					<textarea id="pergunta4"  name="pergunta4" style="width: 600px; height: 150px; "><c:out value="${matricula.pergunta4}"></c:out></textarea><br />
					
					<input type="submit" value="Salvar Opini�o" />
					
					<br clear="all" />
				</h:form>
                
            </div><!-- /#wrapper -->

    	</div><!-- /#middle_align -->
    		<div style="width: 100%; height: 200px;"></div>
    </div><!-- /#middle -->    
    
	<jsp:include page="../../inc_rodape.jsp"  flush="true"/>
  
    
</div><!-- /#container -->
</body>
</html>    