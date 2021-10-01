package  {
	import flash.display.MovieClip;
	import fl.controls.NumericStepper;

	public class Player extends MovieClip {
		public var sozinho:Boolean;
		public var humano:Boolean;
		public var idCor:int;
		public var nome:String = "";
		public var posicaoAtual:int;
		public var novaPosicao:int;
		public var movendo:Boolean;
		public var jogouMinigame:Boolean;
		public var jogadas:int;
		public var proximoMovimento:int;
		public function Player(humano:Boolean,idCor:int){
			this.humano=humano;
			this.idCor=idCor;
			gotoAndStop(idCor);
			pinpoint.stop();
			ambulancia.gotoAndStop(6);
			posicaoAtual=0;
			novaPosicao=0;
			movendo=false;
			jogadas=0;
			jogouMinigame=false;
			x = Data.squares[posicaoAtual].x;
			y = Data.squares[posicaoAtual].y;
		}
		public function iniciarMovimento(){
			x = Data.squares[posicaoAtual].x;
			y = Data.squares[posicaoAtual].y;
			sozinho=true;
			movendo=true;
			switch (idCor){
				//case 1:SoundEngine.loopEfeito(new somMovimentoMoto());break;
				case 1:SoundEngine.loopEfeito(new somMovimentoAmbulancia());break;
				case 2:SoundEngine.loopEfeito(new somMovimentoMoto());break;
				case 3:SoundEngine.loopEfeito(new somMovimentoHelicoptero());break;
				case 4:SoundEngine.loopEfeito(new somMovimentoBarco());break;
			}
		}
		public function finalizaMovimento(){
			if (posicaoAtual>47){
				posicaoAtual=47;
			}
			var deltaX:Number = Data.squares[posicaoAtual].x - Data.squares[posicaoAtual+1].x;
			var deltaY:Number = Data.squares[posicaoAtual].y - Data.squares[posicaoAtual+1].y;
			girarAmbulancia(Math.atan2(deltaY,deltaX));
			SoundEngine.pararLoopEfeito();
		}
		public function girarAmbulancia(angulo:Number){
			if (sozinho){
				gotoAndStop(idCor+4);
			} else {
				gotoAndStop(idCor);
			}
			var acrecimo:int=0;
			if (angulo<-Math.PI*7/8){
				ambulancia.gotoAndStop(6+acrecimo);
			} else if (angulo<-Math.PI*5/8){
				ambulancia.gotoAndStop(7+acrecimo);
			} else if (angulo<-Math.PI*3/8){
				ambulancia.gotoAndStop(8+acrecimo);
			} else if (angulo<-Math.PI*1/8){
				ambulancia.gotoAndStop(1+acrecimo);
			} else if (angulo<Math.PI*1/8){
				ambulancia.gotoAndStop(2+acrecimo);
			} else if (angulo<Math.PI*3/8){
				ambulancia.gotoAndStop(3+acrecimo);
			} else if (angulo<Math.PI*5/8){
				ambulancia.gotoAndStop(4+acrecimo);
			} else if (angulo<Math.PI*7/8){
				ambulancia.gotoAndStop(5+acrecimo);
			} else {
				ambulancia.gotoAndStop(6+acrecimo);
			}
		}
	}
}