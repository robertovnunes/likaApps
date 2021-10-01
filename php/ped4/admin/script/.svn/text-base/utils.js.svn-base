/**
 * @author Emanuel
 */
/**
*
*  MD5 (Message-Digest Algorithm)
*  http://www.webtoolkit.info/
*
**/
function cpf(v)
{
    v=v.replace(/\D/g,"");
	v=v.substring(0,11);
    v=v.replace(/(\d{3})(\d)/,"$1.$2");
    v=v.replace(/(\d{3})(\d)/,"$1.$2");
    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2");
	
    return v;
}

function formatar_cpf(e)
{
	e.currentTarget.value = cpf(e.currentTarget.value);
}

function aplicar_zebra(tabela) {
	tabela.find("TR:even").removeClass("odd").addClass("even").find("IMG.carregando").attr("src","img/spinner_even.gif");
	tabela.find("TR:odd").removeClass("even").addClass("odd").find("IMG.carregando").attr("src","img/spinner_odd.gif");;
}