package Minigames.Memoria{
	import flash.display.MovieClip;
	
	public class Carta extends MovieClip{
		public var tipo:int;
		public var virado:Boolean;
		public var rotacao:int;
		public var situacao:int;//0 normal,1 desvirando, 2 virando
		public function Carta(tipo:int) {
			this.tipo=tipo;
			virado=true;
			rotacao=100;
			situacao=0;
			stop();
		}
		public function virar(){
			if (situacao==1){
				rotacao-=20;
				if (rotacao>0){
					gotoAndStop(1);
					scaleX=rotacao/100;
				} else {
					gotoAndStop(tipo+1);
					scaleX=-rotacao/100;
				}
				if (rotacao==-100){
					virado=false;
					situacao=0;
				}
			} else if (situacao==2){
				rotacao+=20;
				if (rotacao>0){
					gotoAndStop(1);
					scaleX=rotacao/100;
				} else {
					gotoAndStop(tipo+1);
					scaleX=-rotacao/100;
				}
				if (rotacao==100){
					virado=true;
					situacao=0;
				}
			}
		}
	}
}
