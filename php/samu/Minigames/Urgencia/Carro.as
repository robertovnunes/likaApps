package Minigames.Urgencia {
	import flash.display.MovieClip;
	public class Carro extends MovieClip {
		public var velocidade:Number;
		public function Carro() {
			velocidade = Math.random()*4+1;
			var r:Number = Math.random();
			if (r<0.33){
				y=95;
			} else if (r<0.66) {
				y=150;
			} else {
				y=205;
			}
			x=600;
			r = Math.random();
			if (r<0.4){
				gotoAndStop("carro1");
			} else if (r<0.8){
				gotoAndStop("carro2");/**/
			} else {
				gotoAndStop("carro3");
			}
		}
	}
}