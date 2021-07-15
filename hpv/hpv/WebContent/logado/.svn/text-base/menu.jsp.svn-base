<%@ taglib uri="http://www.lika.ufpe.br/taglib" prefix="m" %>
<div id="menuh">
	<ul>
		<li><a href="logado.index.logic" class="top_parent">&nbsp; Home </a></li>
	</ul>
	<c:if test="${usuarioDaSessao.acessoFormularioClinico != null && usuarioDaSessao.acessoFormularioClinico == 'Y'}">
		<ul>
			<li><a href="#" class="top_parent"> &nbsp; Formul&aacute;rios </a>
			<ul>
				<li><a href="formulario.formulario.logic"> &bull; Novo</a></li>
				<li><a href="formulario.listarProcurar.logic"> &bull; Editar </a></li>
				<li><a href="formulario.listarProcurar.logic"> &bull; Remover </a></li>
				<li><a href="formulario.listarProcurar.logic"> &bull; Listar</a></li>
			</ul>
			</li>
		</ul>
	</c:if>
	<c:if test="${m:acessoViral(usuarioDaSessao) == true}">
		<ul>
			<li><a href="#" class="top_parent"> &nbsp; Viral</a>
				<ul>
					<c:if test="${usuarioDaSessao.acessoViralClamidia == 'Y'}">
						<li >
							<a href="viralClamidia.index.logic" >&nbsp; Clamídia</a>
						</li>
					</c:if>
					<c:if test="${usuarioDaSessao.acessoViralHbv == 'Y'}">
						<li >
							<a href="viralHbv.index.logic" >&nbsp; HBV</a>
						</li>
					</c:if>
					<c:if test="${usuarioDaSessao.acessoViralHcv == 'Y'}">
						<li >
							<a href="viralHcv.index.logic" >&nbsp; HCV</a>
						</li>
					</c:if>
					<c:if test="${usuarioDaSessao.acessoViralHiv == 'Y'}">
						<li >
							<a href="viralHiv.index.logic">&nbsp; HIV</a>
						</li>
					</c:if>
					<c:if test="${usuarioDaSessao.acessoViralHpv == 'Y'}">
						<li >
							<a href="viralHpv.index.logic" >&nbsp; HPV</a>
						</li>
					</c:if>
					<c:if test="${usuarioDaSessao.acessoViralSifilis == 'Y'}">
						<li >
							<a href="viralSifilis.index.logic" >&nbsp; Sífilis</a>
						</li>
					</c:if>
				</ul>
			</li>
		</ul>
	</c:if>

	<c:if test="${usuarioDaSessao.acessoCitopato == 'Y'}">
		<ul>
			<li class="top_parent"><a href="citopato.index.logic" >&nbsp; CITOPATO </a></li>
		</ul>
	</c:if>
	<c:if test="${usuarioDaSessao.acessoAnexos != null && usuarioDaSessao.acessoAnexos == 'Y'}">
		<ul>
			<li><a href="anexos.index.logic" class="top_parent">Anexos</a></li>
		</ul>
	</c:if>
	<c:if test="${usuarioDaSessao.acessoAmostras != null && usuarioDaSessao.acessoAmostras == 'Y'}">
		<ul>
			<li><a href="amostras.index.logic" class="top_parent">Amostras</a></li>
		</ul>
	</c:if>
	<c:if test="${usuarioDaSessao.acessoAdministrador != null && usuarioDaSessao.acessoAdministrador == 'Y'}">
		<ul>
			<li><a href="#" class="top_parent"> &nbsp; Usuários </a>
			<ul>
				<li><a href="usuario.formularioUsuario.logic"> &bull; Novo usuário </a></li>
				<li><a href="usuario.listarUsuarios.logic"> &bull; Listar </a></li>
			</ul>
			</li>
		</ul>
	</c:if>

	<ul>
		<li><a href="login.logout.logic?auditoria.ip=<%=request.getRemoteAddr() %>&auditoria.login=${usuarioDaSessao.login}&auditoria.session=<%=session.getId()%>" class="top_parent" style=""> &nbsp; Logout </a></li>
	</ul>
</div>
<br/>