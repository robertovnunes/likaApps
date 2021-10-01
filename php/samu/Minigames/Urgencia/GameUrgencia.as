package Minigames.Urgencia {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.DisplayObject;
	import Minigames.Relogio;

	public class GameUrgencia extends MovieClip {
		private var alinx:int;
		private var carros:Array;
		private var tempo:int;
		private var tempImunidade:int;
		private var vida:int;
		private var vidas:Array;
		private var moto:Moto;
		public var vitoria:Boolean;
		public var velocidade:int;
		public function GameUrgencia() {
			tempo=0;
			tempImunidade=50;
			carros=new Array();
			adicionaVidas();
			velocidade=8;
			this.moto = new Moto();
			gameLayer.addChild(this.moto);
			addEventListener(Event.ENTER_FRAME,loop);
			Data.palco.addEventListener(KeyboardEvent.KEY_DOWN,precionaTecla);
			Data.palco.addEventListener(KeyboardEvent.KEY_UP,soltaTecla);
			relogio.setTime(90*500);
			relogio.addEventListener("TempoZero",acabaTempo);
			Teclado.limparPercionados();
		}
		public function acabaTempo(e:Event){
			vitoria=true;
			finalizarJogo();
		}
		public function precionaTecla(e:KeyboardEvent){
			Teclado.preciona(e);
		}
		public function soltaTecla(e:KeyboardEvent){
			Teclado.solta(e);
		}
		public function loop(e:Event){
			alinx+=velocidade;
			if (alinx>=1200){
				alinx=0;
			}
			fundo1.x=-alinx%600;	
			fundo2.x=fundo1.x+600;
			if (Teclado.verifica(37)){
				moto.x-=5;
			} else if (Teclado.verifica(39)){
				moto.x+=5;
			}
			if (Teclado.verifica(38)){
				moto.y-=5;
			} else if (Teclado.verifica(40)){
				moto.y+=5;
			}
			if (moto.x<0){
				moto.x=0;
			} else if (moto.x+moto.width>600){
				moto.x=600-moto.width;
			}
			if (moto.y<50){
				moto.y=50;
			} else if (moto.y>215){
				moto.y=215;
			}
			if (moto.x<50){
				moto.x=50;
				velocidade=4;
			} else if (moto.x>450){
				moto.x=450;
				velocidade=12;
			} else {
				velocidade=8;
			}
			tempo-=velocidade;
			if (tempo<=0){
				if (relogio.tempo.time<20000){
					tempo=280;
				} else if (relogio.tempo.time<40000){
					tempo=320;
				} else if (relogio.tempo.time<60000){
					tempo=400;
				} else if (relogio.tempo.time<80000){
					tempo=480;
				} else {
					tempo=600;
				}
				var carro:Carro = new Carro();
				carros.push(carro);
				gameLayer.addChild(carro);
			}
			if (tempImunidade>0){
				tempImunidade--;
				if (tempImunidade==0){
					moto.gotoAndStop(1);
				}
			}
			var i:int;var i2:int;
			for (i=0;i<carros.length;i++){
				carros[i].x+=carros[i].velocidade-velocidade;
				if (tempImunidade==0 && moto.colisao.hitTestObject(carros[i].colisao)){
					vida--;
					SoundEngine.tocarEfeito(new somMotoBatida());
					tempImunidade=50;
					moto.play();
					for (i2=0;i2<3;i2++){
						if (i2<vida){
							vidas[i2].alpha=1;
						} else {
							vidas[i2].alpha=0;
						}
					}
					if (vida<=0){
						vitoria = false;
						finalizarJogo();
					}
				}
				for (i2=i+1;i2<carros.length;i2++){
					if (carros[i].x+carros[i].width+10>carros[i2].x){
						if (carros[i].y==carros[i2].y){
							carros[i].x = carros[i2].x-carros[i].width-10;
							carros[i].velocidade = carros[i2].velocidade;
						}
					}
				}
				if (carros[i].x+carros[i].width<0){
					gameLayer.removeChild(carros[i]);
					carros.splice(i,1);
					i--;
				}
			}
			if (relogio.tempo.time<=0){
				vitoria = true;
				finalizarJogo();
			}
			var sortArray:Array = new Array();
			for(i = 0; i < gameLayer.numChildren; i++) {
    			sortArray.push(gameLayer.getChildAt(i));
			}
			sortArray.sortOn("y",Array.NUMERIC);
			for(i = 0; i < sortArray.length; i++) {
    			gameLayer.setChildIndex(sortArray[i],i);
			}
		}
		public function finalizarJogo(){
			removeEventListener(Event.ENTER_FRAME,loop);
			relogio.removeEventListener("TempoZero",acabaTempo);
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
				vd.y=290;
				vd.x=i*60+400;
				vidas.push(vd);
				gameLayer.addChild(vd);
			}
		}
	}
}