package Minigames.Memoria {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	import flash.events.Event;
	
	public class GameMemoria extends MovieClip{
		private var cartas:Array;
		private var sel1:Carta;
		private var sel2:Carta;
		private var travado:Boolean;
		private var codInterval:int;
		private var tempoEspera:int;
		public var vitoria:Boolean;
		public var pontos:int;
		public function GameMemoria() {
			sel1=null;
			sel2=null;
			relogio.setTime(90*1000);
			tempoEspera=0;
			criarCartas();
			travado=false;
			addEventListener(Event.ENTER_FRAME,loop);
		}
		private function loop(e:Event){
			if (tempoEspera>0){
				tempoEspera--;
			} else if (travado){
				travado=false;
				if (sel1!=null){
					sel1.virar();
					if (sel1.situacao!=0){
						travado=true;
					}
				}
				if (sel2!=null){
					sel2.virar();
					if (sel2.situacao!=0){
						travado=true;
					}
				}
				if (!travado && sel1!=null && sel2!=null){
					if (!sel1.virado && !sel2.virado){
						if (sel2.tipo==sel1.tipo){
							SoundEngine.tocarEfeito(new somDragDropCerto());
							sel1=null;
							sel2=null;
							verificaVitoria();
						} else {
							SoundEngine.tocarEfeito(new somDragDropErrado());
							tempoEspera=20;
							sel1.situacao=2;
							sel2.situacao=2;
							travado=true;
						}
					} else {
						sel1=null;
						sel2=null;
					}
				}
			}
			if (relogio.tempo.time<=0){
				vitoria = false;
				finalizarJogo();
			}
		}
		public function finalizarJogo(){
			removeEventListener(Event.ENTER_FRAME,loop);
			for (var i:int=0;i<cartas.length;i++){
				addChild(cartas[i]);
				cartas[i].removeEventListener(MouseEvent.CLICK,mouseClick);
			}
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function verificaVitoria(){
			var achou:Boolean=false;
			for (var i:int=0;i<cartas.length;i++){
				if (cartas[i].virado){
					achou=true;
					break;
				}
			}
			if (!achou){
				vitoria = true;
				finalizarJogo();
			}
		}
		private function mouseClick(e:MouseEvent){
			if (!travado){
				SoundEngine.tocarEfeito(new somMemoriaCarta());
				var carta:Carta = Carta(e.target);
				if (sel1==null){
					sel1=carta;
					sel1.situacao=1;
					travado=true;
				} else if (sel2==null && carta!=sel1){
					sel2=carta;
					sel2.situacao=1;
					travado=true;
				}
			}
		}
		private function criarCartas(){
			var origem:Array = new Array();
			origem.push(new Carta(1));
			origem.push(new Carta(1));
			origem.push(new Carta(2));
			origem.push(new Carta(2));
			origem.push(new Carta(3));
			origem.push(new Carta(3));
			origem.push(new Carta(4));
			origem.push(new Carta(4));
			origem.push(new Carta(5));
			origem.push(new Carta(5));
			origem.push(new Carta(6));
			origem.push(new Carta(6));
			origem.push(new Carta(7));
			origem.push(new Carta(7));
			origem.push(new Carta(8));
			origem.push(new Carta(8));
			cartas = new Array();
			while (origem.length>0){
				var r:int = Math.random()*origem.length;
				var temp:Array = origem.splice(r,1)
				cartas.push(temp[0]);
			}
			var i:int;
			for (i=0;i<4;i++){
				for (var i2:int=0;i2<4;i2++){
					cartas[i*4+i2].x=i*82+140+33.5;
					cartas[i*4+i2].y=i2*82+10;
				}
			}
			for (i=0;i<cartas.length;i++){
				addChild(cartas[i]);
				cartas[i].addEventListener(MouseEvent.CLICK,mouseClick);
			}
		}
	}
}