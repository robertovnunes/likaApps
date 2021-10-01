package Minigames.SeteErros {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	
	public class GameSeteErros extends MovieClip {
		private var countErros:int;
		private var erros:Array;
		private var certos:Array;
		public var vitoria:Boolean;
		private var idDelay:int;
		public function GameSeteErros(){
			relogio.setTime(90*1000);
			relogio.addEventListener("TempoZero",acabaTempo);
			carregaEstagio();
		}
		public function acabaTempo(e:Event){
			vitoria=false;
			finalizarJogo();
		}
		public function finalizarJogo(){
			for (var i=0;i<certos.length;i++){
				erros[i].removeEventListener(MouseEvent.CLICK,clickErro);
				certos[i].removeEventListener(MouseEvent.CLICK,clickCerto);
			}
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function carregaEstagio(){
			var r:int = Math.random()*3;
			//r=2;
			countErros=7;
			erros=new Array();
			certos=new Array();
			switch (r){
				case 0:
					imagemCerta.gotoAndStop(1);
					imagemErrada.gotoAndStop(1);
					addErro(195,121);
					addErro(204,181);
					addErro(150,237);
					addErro(111,256);
					addErro(24,247);
					addErro(98,160);
					addErro(150,268);
				break;
				case 1:
					imagemCerta.gotoAndStop(2);
					imagemErrada.gotoAndStop(2);
					addErro(27,270);
					addErro(53,226);
					addErro(152,225);
					addErro(211,217);
					addErro(101,192);
					addErro(112,145);
					addErro(199,129);
				break;
				case 2:
					imagemCerta.gotoAndStop(3);
					imagemErrada.gotoAndStop(3);
					addErro(75,313);
					addErro(55,234);
					addErro(111,172);
					addErro(164,141);
					addErro(163,111);
					addErro(162,84);
					addErro(51,132);
				break;
			}
		}

		private function addErro(x:int,y:int){
			var erro:Erro = new Erro();
			erro.x=x;
			erro.y=y;
			erro.gotoAndStop(1);
			erro.addEventListener(MouseEvent.CLICK,clickCerto);
			certos.push(erro);
			imagemCerta.addChild(erro);
			erro = new Erro();
			erro.x=x;
			erro.y=y;
			erro.gotoAndStop(1);
			erro.addEventListener(MouseEvent.CLICK,clickErro);
			erros.push(erro);
			imagemErrada.addChild(erro);
		}
		public function clickCerto(e:MouseEvent){
			for (var i=0;i<certos.length;i++){
				if (e.currentTarget==certos[i]){
					eliminaErro(i);
					break;
				}
			}
		}
		public function clickErro(e:MouseEvent){
			for (var i=0;i<erros.length;i++){
				if (e.currentTarget==erros[i]){
					eliminaErro(i);
					break;
				}
			}
		}
		private function eliminaErro(indice:int){
			countErros--;
			txtErros.text=countErros+"";
			erros[indice].gotoAndStop(2);
			erros[indice].removeEventListener(MouseEvent.CLICK,clickErro);
			certos[indice].gotoAndStop(2);
			certos[indice].removeEventListener(MouseEvent.CLICK,clickCerto);
			SoundEngine.tocarEfeito(new som7ErrosAcerto());
			if (countErros==0){
				vitoria=true;
				idDelay = setTimeout(delayFimJogo, 2000);
				
			}
		}
		private function delayFimJogo(){
			clearTimeout(idDelay);
			finalizarJogo();
		}
	}
}
