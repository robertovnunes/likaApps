package Minigames.Caminho {
	import flash.display.MovieClip;
	
	public class Ligacao extends MovieClip {
		public var tipo:int;
		public var ligado:Boolean;
		public var acima:Ligacao;
		public var abaixo:Ligacao;
		public var direita:Ligacao;
		public var esquerda:Ligacao;
		public function Ligacao() {
			var r:int=Math.random()*4;
			rotation = r*90;
			tipo=Math.random()*3+1;
			gotoAndStop(tipo);
		}
		public function viradoAcima():Boolean{
			var retorno:Boolean = false;
			switch (tipo){
				case 1:retorno = rotation==90 || rotation==-90;break;
				case 2:retorno = rotation==90 || rotation==180;break;
				case 3:retorno = rotation==90 || rotation==180 || rotation==-90;break;
				case 4:retorno = false;break;
				case 5:retorno = false;break;
			}
			return retorno;
		}
		public function viradoAbaixo():Boolean{
			var retorno:Boolean = false;
			switch (tipo){
				case 1:retorno = rotation==90 || rotation==-90;break;
				case 2:retorno = rotation==0 || rotation==-90;break;
				case 3:retorno = rotation==0 || rotation==90 || rotation==-90;break;
				case 4:retorno = false;break;
				case 5:retorno = false;break;
			}
			return retorno;
		}
		public function viradoEsquerda():Boolean{
			var retorno:Boolean = false;
			switch (tipo){
				case 1:retorno = rotation==0 || rotation==180;break;
				case 2:retorno = rotation==0 || rotation==90;break;
				case 3:retorno = rotation==0 || rotation==90 || rotation==180;break;
				case 4:retorno = false;break;
				case 5:retorno = true;break;
			}
			return retorno;
		}
		public function viradoDireita():Boolean{
			var retorno:Boolean = false;
			switch (tipo){
				case 1:retorno = rotation==0 || rotation==180;break;
				case 2:retorno = rotation==180 || rotation==-90;break;
				case 3:retorno = rotation==0 || rotation==180 || rotation==-90;break;
				case 4:retorno = true;break;
				case 5:retorno = false;break;
			}
			return retorno;
		}
		public function ligacaoAcima():Boolean{
			if (acima!=null){
				return acima.viradoAbaixo() && this.viradoAcima();
			} else {
				return false;
			}
		}
		public function ligacaoAbaixo():Boolean{
			if (abaixo!=null){
				return abaixo.viradoAcima() && this.viradoAbaixo();
			} else {
				return false;
			}
		}
		public function ligacaoEsquerda():Boolean{
			if (esquerda!=null){
				return esquerda.viradoDireita() && this.viradoEsquerda();
			} else {
				return false;
			}
		}
		public function ligacaoDireita():Boolean{
			if (direita!=null){
				return direita.viradoEsquerda() && this.viradoDireita();
			} else {
				return false;
			}
		}
	}
}