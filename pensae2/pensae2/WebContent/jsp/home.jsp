<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

  <jsp:include page="inc_header.jsp"  flush="true"/>
    
</head>
<body>

<div id="container">

	
  <jsp:include page="inc_topo.jsp"  flush="true"/>
    
    <div id="middle">    
		<div id="middle_align">
            
            <div id="wrapper">
            
            <div class="col w75">
				<h3>Quem somos</h3>
               <!--  <p>Buscamos alcan?ar a satisfa??o e o completo atendimento das necessidades e, acima de tudo, a seguran?a dos pacientes de nossos clientes, utilizando sempre de infra-estrutura adequada, colaboradores treinados e comprometidos com a melhoria cont?nua e a humaniza??o nos servi?os t?cnicos na ?rea de sa?de</p> -->          
               <p>Ol?, este ? o software PenSAE, um ambiente de aprendizagem interativa, que utiliza a metodologia da problematiza??o para a constru??o do conhecimento aplicado ao Processo de Enfermagem no cuidado ? sa?de da crian?a. O Processo de Enfermagem ? um conjunto de a??es direcionadas ? solu??o de problemas, onde o enfermeiro planeja, implementa e avalia as atividades de Enfermagem. Atrav?s deste software voc? ter? a oportunidade de desenvolver compet?ncias e habilidades essenciais para o exerc?cio pr?tico do Processo de Enfermagem, adquirindo autonomia e confian?a para a tomada de decis?o cl?nica.</p>
            </div>
            <div class="col w25 login">
            	
            	<div class="form bg_shadow_left_green">
                <h2>?rea do Cadastrado</h2>
                
				<h:form action="logon">
				<h:hidden property="method" value="logon"/>
					
                	<label for="user">Usu?rio</label>
					<h:text property="loginUsuario" styleClass="input-text input-200" value="Usu?rio" onblur="if (this.value == '') {this.value = 'Usu?rio';}"  onfocus="if (this.value == 'Usu?rio') {this.value = '';}"  styleId="user" maxlength="10"/>
                    <label for="pass">Senha</label>
					<h:password styleClass="input-text input-200" styleId="senha" property="senhaUsuario" value="****"  onblur="if (this.value == '') {this.value = '****';}"  onfocus="if (this.value == '****') {this.value = '';}"  maxlength="10"/>
                    <input type="submit" name="Enviar" value="Enviar" />
                </h:form>  
                    <a href="#" onclick="alert('Em constru??o!')">Esqueci a senha</a><br/>
                    <a href="usuarioExternoAdd.do?method=mostrarTelaUsuarioExternoAdd">Cadastrar-se</a>
                
                </div>
            </div>
            
           
           <div class="col w50">
           		<div class="p5 border_right">
      			<h2 class="noticias">Not?cias e Eventos</h2>
                
                <ul class="noticias">
                	<li>TIES - Disciplina Tecnologias da Informa??o em Educa??o e Sa?de. <br> <span>
Data: 29/10/2013</span></li>
					<li>TIES - Disciplina Tecnologias da Informa??o em Educa??o e Sa?de. <br> <span>
Data: 29/10/2013</span></li>
					<li>TIES - Disciplina Tecnologias da Informa??o em Educa??o e Sa?de. <br> <span>
Data: 29/10/2013</span></li>
					<li>TIES - Disciplina Tecnologias da Informa??o em Educa??o e Sa?de. <br> <span>
Data: 29/10/2013</span></li>
					<li>TIES - Disciplina Tecnologias da Informa??o em Educa??o e Sa?de. <br> <span>
Data: 29/10/2013</span></li>                  
                </ul>
				<p class="saiba_mais"><a href="#">Veja mais</a></p>
                </div>
           </div>
      
           <div class="col w50 bg_shadow_left_green">
           		<div class="p5">
      			<h2 class="cursos">Cursos Dispon?veis</h2>
                
                <ul class="cursos">
                	<li>LIKA - Novas instala??es - O Laborat?rio de Imunopatologia Keizo Asami conta com novas instala??es.
                    <br><span>In?cio: 09/10/2013</span></li>
                    <li>LIKA - Novas instala??es - O Laborat?rio de Imunopatologia Keizo Asami conta com novas instala??es.
                    <br><span>In?cio: 09/10/2013</span></li>
                    <li>LIKA - Novas instala??es - O Laborat?rio de Imunopatologia Keizo Asami conta com novas instala??es.
                    <br><span>In?cio: 09/10/2013</span></li>
                	               
                </ul>
				<p class="saiba_mais"><a href="#">Veja mais</a></p>
                </div>
                
           </div>
            </div><!-- /#wrapper -->
           	<div style="" align="right">
                <b>Contato:</b>
                rosalie.belian@ufpe.br
           	</div>
    	</div><!-- /#middle_align -->
    		<br /><br /><br />
    </div><!-- /#middle -->    
    
	<jsp:include page="inc_rodape.jsp"  flush="true"/>
  
</div><!-- /#container -->

</body>
</html>    