package Minigames.Bejeweled{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class GameBejeweled extends MovieClip{
		private var tempoDec:int;
		public var vitoria:Boolean;
		public function GameBejeweled(){
			Dado.mcCasas=casas;
			Dado.mcPedras=pedras;
			Dado.palco=this;
			relogio.setTime(90*1000);
			iniciar();
			addEventListener(Event.ENTER_FRAME,loopPrincipal);
		}
		public function loopPrincipal(evt:Event){
			var i:int=0;
			for (i=0;i<Dado.casas.length;i++){
				Dado.casas[i].update();
			}
			for (i=Dado.aniPontos.length-1;i>=0;i--){
				Dado.aniPontos[i].update();
				if (Dado.aniPontos[i].apagar){
					removeChild(Dado.aniPontos[i]);
					Dado.aniPontos.splice(i,1);
				}
			}
			tempoDec--;
			if (tempoDec<=0){
				tempoDec=80;
				Dado.pontos--;
				if (Dado.pontos<=1){
					vitoria = false;
					finalizarJogo();
				}
			}
			pontos.gotoAndStop(Dado.pontos);
			if (Dado.travado){
				var achou:Boolean=false;
				for (i=0;i<Dado.casas.length;i++){
					if (Dado.casas[i].pedra==null || Dado.casas[i].pedra.situacao!=0){
						achou=true;
						break;
					}
				}
				if (!achou){
					Dado.travado=false;
					Dado.iniciou=true;
					Dado.combo=0;
				}
			} else if (relogio.tempo.time<=0){
				vitoria = false;
				finalizarJogo();
			} else if (pontos.currentFrame>=100){
				vitoria = true;
				finalizarJogo();
			}
		}
		public function finalizarJogo(){
			for (var i:int=0;i<Dado.casas.length;i++){
				Dado.casas[i].removeEventListener(MouseEvent.MOUSE_UP,clickCasa);
			}
			removeEventListener(Event.ENTER_FRAME,loopPrincipal);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		public function clickCasa(evt:MouseEvent){
			if (!Dado.travado && evt.currentTarget as Casa){
				var casa:Casa = Casa(evt.currentTarget)
				if (Dado.selCasa1==null){
					casa.primeiraSelecao();
				} else {
					casa.segundaSelecao();
				}
			}
		}
		private function iniciar(){
			Dado.limparSelecao();
			Dado.pontos=20;
			Dado.combo=0;
			tempoDec=0;
			var i:int=0;
			var i2:int=0;
			Dado.aniPontos=new Array();
			Dado.casas=new Array();
			//criando casas
			for (i=0;i < 8; i++){
				for (i2=0;i2 < 8;i2++){
					Dado.casas.push(new Casa(i*40+20,i2*40+20));
				}
			}
			//ligando e adicionando as casas a tela
			for (i=0;i<Dado.casas.length;i++){
				for (i2=0;i2<Dado.casas.length;i2++){
					if (Dado.casas[i].x+40==Dado.casas[i2].x && Dado.casas[i].y==Dado.casas[i2].y){
						Dado.casas[i].ligarDireita(Dado.casas[i2]);
					}
					if (Dado.casas[i].y+40==Dado.casas[i2].y && Dado.casas[i].x==Dado.casas[i2].x){
						Dado.casas[i].ligarAbaixo(Dado.casas[i2]);
					}
				}
				Dado.mcCasas.addChild(Dado.casas[i]);
				Dado.casas[i].addEventListener(MouseEvent.MOUSE_UP,clickCasa);
			}
		}
	}
}