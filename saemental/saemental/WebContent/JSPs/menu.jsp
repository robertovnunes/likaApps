<style>
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
               
        </style>
		<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		
		<div style='margin-top: -35px;' align="center">
		
		<div style="display:inline-block;">
		
			<ul id="nav" class="dropdown dropdown-horizontal" style="z-index:600;">
				<li><span class="dir" style="width:100px;">Pacientes</span>
					<ul>
						<li> <a href="paciente.do?method=mostrarTelaPacienteAdd" >Adicionar</a></li>
						<li class="divider"><a href="paciente.do?method=mostrarTelaPacienteBuscar" >Buscar</a></li>
					</ul>
				</li>
				<li style='margin-left: 15px;'><span class="dir" style="width:100px;">Usu&aacute;rios</span>
					<ul>
						
						<c:if test="${usuario.tipoUsuario != 'ALUNOLABORATORIO'}">
							<li class="divider"><a href="usuario.do?method=mostrarTelaUsuarioAdd" >Adicionar</a></li>
							<li class="divider"><a href="usuario.do?method=mostrarTelaUsuarioBuscar" >Buscar</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
		<div style="display:inline-block;  line-height: 20px; vertical-align: top; padding-top: 5px; color: white;">
             <!--  
                 <div id="sub_menu" align="center" style="background:none repeat scroll 0 0 #2A6DB1; color: white;">
                 	<table>
                 		<tr>
                 			<td width="1000" style="background:none repeat scroll 0 0 #2A6DB1; color: white; padding: 0 0 6px;">
			                    <div id="dadosPaciente" align="center" >
			                    </div>
                 			</td>
                 			<td align="right" width="24" style="background:none repeat scroll 0 0 #2A6DB1; color: white; padding: 0 0 6px;">
			                     <div id="sair" align="right" >
			                    	<a href="logoff.do?method=logoff" style="text-decoration: none; color: white; margin-right: 15px;">Sair</a>
			                    </div>
                 			</td>
                 		</tr>
                 	</table>
                </div>
             -->
                <div style="margin-top: 0; margin-left: 50px;color:white; width: 510px;" id="navegacao" align="left" >
				</div>

          </div>
          
          </div>
                