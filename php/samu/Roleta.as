package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import fl.motion.Color;

	public class Roleta extends MovieClip {
		private var parado:Boolean;
		private var desacelerando:Boolean;
		private var frame:int;
		private var tempoSair:int;
		private var tempo:Number;
		private var velocidade:Number;
		private var idInterval:Number;
		private var oculto:Boolean=false;
		public var resultado:int;
		public function Roleta() {
			// constructor code
			parado=false;
			desacelerando=false;
			velocidade=1;
			frame=1;
			tempo=0;
			tempoSair=0;
			addEventListener(Event.ENTER_FRAME,passaFrames);
		}
		public function passaFrames(e:Event){
			if (currentFrame==1){
				SoundEngine.tocarEfeito(new somAbreRoleta());
			} else if (currentFrame==6){
				popupRoleta.gotoAndStop(Data.playerAtual.idCor);
			} else if (currentFrame==11){
				stop();
				nomeJogador.text = Data.playerAtual.nome+",";
				if (Data.playerAtual.humano){
					btParar.addEventListener(MouseEvent.CLICK,parar);
					ocultar.addEventListener(MouseEvent.CLICK,ocultarRoleta);
					idInterval = setTimeout(pararBot, Math.random()*1000+29000);
				} else {
					btParar.alpha=0;
					btParar.y=-1000;
					ocultar.alpha=0;
					ocultar.y=-1000;
					idInterval = setTimeout(pararBot, Math.random()*1000+2000);
				}
				removeEventListener(Event.ENTER_FRAME,passaFrames);
				addEventListener(Event.ENTER_FRAME,rodar);
			} else if (currentFrame==22){
				removeEventListener(Event.ENTER_FRAME,passaFrames);
				var evt:Event = new Event("Parou");
				dispatchEvent(evt);
			}
		}
		public function ocultarRoleta(e:MouseEvent){
			oculto=!oculto;
			var transparencia:Number=1;
			if (oculto){
				transparencia=0.2;
			}
			for (var i:int=0;i<this.numChildren;i++){
				var child = this.getChildAt(i);
				child.alpha=transparencia;
			}
			ocultar.alpha=1;
		}
		public function rodar(e:Event){
			tempo+=velocidade;
			if (tempo>=1 && velocidade>0){
				tempo-=1;
				frame++;
				if (frame>23){
					frame=1;
				}
				SoundEngine.tocarEfeito(new somRoletaGiro());
				disco.gotoAndStop(frame);
			}
			if (parado){
				tempo++;
				if (tempo>=50){
					play();
					SoundEngine.tocarEfeito(new somFechaRoleta());
					removeEventListener(Event.ENTER_FRAME,rodar);
					addEventListener(Event.ENTER_FRAME,passaFrames);
				}
			} else if (desacelerando){
				if (btParar.width>0){
					btParar.width-=8.4;
					btParar.height-=8.3;
				}
				velocidade-=0.02;
				if (velocidade<=0){
					parado=true;
					SoundEngine.tocarEfeito(new somRoletaGiro());
					switch (frame){
						case 1:case 2:case 3:
							resultado=0;
							disco.gotoAndStop(2);
						break;
						case 4:case 5:case 6:
							resultado=6;
							disco.gotoAndStop(5);
						break;
						case 7:case 8:case 9:
							resultado=5;
							disco.gotoAndStop(8);
						break;
						case 10:case 11:case 12:
							resultado=4;
							disco.gotoAndStop(11);
						break;
						case 13:case 14:case 15:
							resultado=0;
							disco.gotoAndStop(14);
						break;
						case 16:case 17:case 18:
							resultado=3;
							disco.gotoAndStop(17);
						break;
						case 19:case 20:case 21:
							resultado=2;
							disco.gotoAndStop(20);
						break;
						case 22:case 23:
							resultado=1;
							disco.gotoAndStop(23);
						break;
					}
					//resultado=48;
				}
			}
		}
		public function pararBot(){
			clearTimeout(idInterval);
			desacelerando=true;
		}
		public function parar(e:MouseEvent){
			btParar.removeEventListener(MouseEvent.CLICK,parar);
			clearTimeout(idInterval);
			desacelerando=true;
		}
	}
}