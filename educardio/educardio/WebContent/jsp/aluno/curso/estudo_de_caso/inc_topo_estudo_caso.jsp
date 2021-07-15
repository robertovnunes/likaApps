<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="rf-tab-hdr-tabline-vis rf-tab-hdr-tabline-top">
    <table cellspacing="0" class="rf-tab-hdr-tabs">
    	<tbody><tr>
        <td class="rf-tab-hdr-spcr" style="padding-left: 5px;"><br></td>
        <td style="" class="rf-tab-hdr rf-tab-hdr-act rf-tab-hdr-top" id="j_idt2345:j_idt2347:header:active"><span class="rf-tab-lbl">
        	 <c:if test="${arcoMaguerez.faseDoArco == 0}">
		        <img src="imagens/icons/Play-1-Normal-Red-icon.png">
	        </c:if>
	         <c:if test="${arcoMaguerez.faseDoArco > 0}">
		        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png">
	        </c:if>
        	<a href="estudoCaso.do?method=mostrarTelaObservacaoRealidade&idEstudoCaso=${ estudoDeCaso.id}">Investiga��o</a></span></td>
        <td class="rf-tab-hdr-spcr rf-tab-hortab-tabspcr-wdh" style=""><br></td>
		
        <td style="" class="rf-tab-hdr rf-tab-hdr-act rf-tab-hdr-top" id="j_idt2345:j_idt2349:0:j_idt2350:header:active"><span class="rf-tab-lbl">
         <c:if test="${arcoMaguerez.faseDoArco < 1}">
	        <img src="imagens/icons/Play-1-Disabled-icon.png">
       </c:if>
        <c:if test="${arcoMaguerez.faseDoArco == 1}">
	        <img src="imagens/icons/Play-1-Normal-Red-icon.png">
        </c:if>
        <c:if test="${arcoMaguerez.faseDoArco > 1}">
	        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png">
       </c:if>
        <a href="ptsChave.do?method=mostrarTelaPontosChave">Diagn�stico</a></span></td>
        <td class="rf-tab-hdr-spcr rf-tab-hortab-tabspcr-wdh" style=""><br></td>
        
        <td style="" class="rf-tab-hdr rf-tab-hdr-act rf-tab-hdr-top" id="j_idt2345:j_idt2349:1:j_idt2350:header:active"><span class="rf-tab-lbl">
       <c:if test="${arcoMaguerez.faseDoArco < 2}">
	        <img src="imagens/icons/Play-1-Disabled-icon.png">
       </c:if>
        <c:if test="${arcoMaguerez.faseDoArco == 2}">
	     	 <img src="imagens/icons/Play-1-Normal-Red-icon.png">
        </c:if>
        <c:if test="${arcoMaguerez.faseDoArco > 2}">
	        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png">
       </c:if>
        <a href="teorizacao.do?method=mostrarTelaTeorizacao">Planejamento</a></span></td>
        <td class="rf-tab-hdr-spcr rf-tab-hortab-tabspcr-wdh" style=""><br></td>
        
        <td style="" class="rf-tab-hdr rf-tab-hdr-act rf-tab-hdr-top" id="j_idt2345:j_idt2349:2:j_idt2350:header:active"><span class="rf-tab-lbl">
        <c:if test="${arcoMaguerez.faseDoArco < 3}">
	        <img src="imagens/icons/Play-1-Disabled-icon.png">
       </c:if>
        <c:if test="${arcoMaguerez.faseDoArco == 3}">
	  	    <img src="imagens/icons/Play-1-Normal-Red-icon.png">
        </c:if>
        <c:if test="${arcoMaguerez.faseDoArco > 3}">
	        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png">
       </c:if>
        <a href="hipoteses.do?method=mostrarTelaHipoteses">Implementa��o</a></span></td>
        <td class="rf-tab-hdr-spcr rf-tab-hortab-tabspcr-wdh" style=""><br></td>
        
        <td style="" class="rf-tab-hdr rf-tab-hdr-act rf-tab-hdr-top" id="j_idt2345:j_idt2349:3:j_idt2350:header:active"><span class="rf-tab-lbl">
         <c:if test="${arcoMaguerez.faseDoArco < 4}">
	        <img src="imagens/icons/Play-1-Disabled-icon.png">
       </c:if>
        <c:if test="${arcoMaguerez.faseDoArco == 4}">
	        <img src="imagens/icons/Play-1-Normal-Red-icon.png">
        </c:if>
        <c:if test="${arcoMaguerez.faseDoArco > 4}">
	        <img src="imagens/icons/Actions-dialog-ok-apply-icon.png">
       </c:if>
        <a href="aplicacao.do?method=mostrarTelaAplicacao">Avalia��o</a></span></td>
        
        <td class="rf-tab-hdr-spcr rf-tab-hortab-tabspcr-wdh" style=""><br></td>
        <td class="rf-tab-hdr-spcr" style="padding-right: 5px; width: 100%;"><br></td>
        </tr></tbody></table>
        
        <div class="rf-tab-hdr-scrl-lft rf-tab-hdn">�</div>
        <div class="rf-tab-hdr-tablst rf-tab-hdn">?</div>
        <div class="rf-tab-hdr-scrl-rgh rf-tab-hdn">�</div>
 </div>
 
  <!-- <div id="nav_casos" style="position: relative; z-index: 2;">
    <ul class="">
                 <li><a href="#" title="Ferramentas" class="ferramenta">Ferramentas</a>
                    <span></span>
                    <ul>
                        <li><a href="mostrarTelaMaterialPedagogico.do?method=mostrarTelaMaterialPedagogico">Material Pedag�gico</a></li>
                        <li><a href="#">Busca</a></li>
                        <li><a href="#">Gloss�rio</a></li>
                    </ul>
                </li>
                <li><a href="#" title="Comunica��o" class="comunicacao">Comunica��o</a>
                    <span></span>
                    <ul>
                        <li><a href="#">F�rum</a></li>
                        <li><a href="#">Constru��o compartilhada</a></li>
                    </ul>
                </li>  
    </ul>
</div> -->
        