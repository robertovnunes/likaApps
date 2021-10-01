package Minigames.Helicoptero {
	import flash.display.MovieClip;
	import flash.events.Event;
	import Minigames.Urgencia.Teclado;
	import flash.events.KeyboardEvent;
	import flash.sensors.Accelerometer;
	public class GameHelicoptero extends MovieClip {
		private var alinx:int;
		private var vy:Number=0;
		private var tempo:int;
		private var obstaculos:Array;
		private var vidas:Array;
		private var tempImunidade:int;
		private var vida:int;
		private var pontos:int;
		private var helicoptero:MovieClip;
		public var vitoria:Boolean;
		public function GameHelicoptero() {
			tempo=0;
			tempImunidade=50;
			relogio.setTime(90*1000);
			helicoptero = new mcHelicoptero();
			helicoptero.alpha=0.5;
			gameLayer.addChild(helicoptero);
			pontos=0;
			adicionaVidas();
			fundo1a.gotoAndStop(1);
			fundo1b.gotoAndStop(1);
			fundo2a.gotoAndStop(2);
			fundo2b.gotoAndStop(2);
			fundo3a.gotoAndStop(3);
			fundo3b.gotoAndStop(3);
			fundo4a.gotoAndStop(4);
			fundo4b.gotoAndStop(4);
			fundo5a.gotoAndStop(5);
			fundo5b.gotoAndStop(5);
			obstaculos=new Array();
			addEventListener(Event.ENTER_FRAME,loop);
			Data.palco.addEventListener(KeyboardEvent.KEY_DOWN,precionaTecla);
			Data.palco.addEventListener(KeyboardEvent.KEY_UP,soltaTecla);
		}
		public function finalizarJogo(){
			removeEventListener(Event.ENTER_FRAME,loop);
			Data.palco.removeEventListener(KeyboardEvent.KEY_DOWN,precionaTecla);
			Data.palco.removeEventListener(KeyboardEvent.KEY_UP,soltaTecla);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function adicionaVidas(){
			vida=3;
			vidas= new Array();
			for (var i:int=0;i<vida;i++){
				var vd:MovieClip = new Vida();
				vd.y=0;
				vd.x=i*60+360;
				vidas.push(vd);
				addChild(vd);
			}
		}
		public function loop(e:Event){
			alinx+=1;
			if (alinx>=600){
				alinx=0;
			}
			fundo1a.x=-alinx;
			fundo1b.x=fundo1a.x+600;
			fundo2a.x=(-alinx*2)%600;
			fundo2b.x=fundo2a.x+600;
			fundo3a.x=(-alinx*4)%600;
			fundo3b.x=fundo3a.x+600;
			fundo4a.x=(-alinx*6)%600;
			fundo4b.x=fundo4a.x+600;
			fundo5a.x=(-alinx*8)%600;
			fundo5b.x=fundo5a.x+600;
			if (Teclado.verifica(32)){
				if (vy>-6){
					vy-=0.4;
				}
			} else {
				if (vy<6){
					vy+=0.3;
				}
			}
			helicoptero.y+=vy;
			if (helicoptero.y<0){
				helicoptero.y=0;
				vy=0;
			} else if (helicoptero.y+helicoptero.height>338){
				//morrer();
				helicoptero.y=338-helicoptero.height;
				vy=0;
			}
			tempImunidade--;
			if (tempImunidade<=0){
				tempImunidade=0;
				helicoptero.alpha=1;
			}
			for (var i:int=0;i<obstaculos.length;i++){
				obstaculos[i].update();
				if (obstaculos[i].area.hitTestObject(helicoptero.area)){
					switch (obstaculos[i].tipo){
						case 0:
							pontos++;
							gameLayer.removeChild(obstaculos[i]);
							obstaculos.splice(i,1);
							i--;
							SoundEngine.tocarEfeito(new somHelicopteroMoeda());
							if (pontos>=5){
								vitoria = true;
								finalizarJogo();
							}
						break;
						case 1:
						case 2:
							if (tempImunidade==0){
								if (obstaculos[i].tipo==1){
									SoundEngine.tocarEfeito(new somHelicopteroPassaro());
								} else {
									SoundEngine.tocarEfeito(new somHelicopteroBalao());
								}
								morrer();
							}
						break;
					}
				} else if (obstaculos[i].x+obstaculos[i].width<0){
					gameLayer.removeChild(obstaculos[i]);
					obstaculos.splice(i,1);
					i--;
				}
			}
			txtPontos.text="x "+pontos;
			tempo++;
			if (tempo>=40){
				tempo=0;
				var tempObs:Obstaculo=new Obstaculo();
				obstaculos.push(tempObs);
				gameLayer.addChild(tempObs);
			}
		}
		private function morrer(){
			vida--;
			tempImunidade=100;
			helicoptero.alpha=0.5;
			for (var i:int=0;i<3;i++){
				if (i<vida){
					vidas[i].alpha=1;
				} else {
					vidas[i].alpha=0;
				}
			}
			if (vida<=0){
				vitoria = false;
				finalizarJogo();
			}
		}
		public function precionaTecla(e:KeyboardEvent){
			Teclado.preciona(e);
		}
		public function soltaTecla(e:KeyboardEvent){
			Teclado.solta(e);
		}
	}
}
