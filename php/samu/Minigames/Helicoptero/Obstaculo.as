package Minigames.Helicoptero {
	import flash.display.MovieClip;
	public class Obstaculo extends MovieClip {
		private var vx;
		private var vy;
		private var tempo:int;
		public var tipo:int;
		public var moeda:Boolean;
		public function Obstaculo() {
			tempo=0;
			var r:Number = Math.random();
			if (r<0.4){
				tipo=0;
			} else if (r<0.8){
				tipo=1;
			} else {
				tipo=2;
			}
			switch (tipo){//0 - moeda, 1 - passaro,2 - balao
				case 0:
					moeda=true;
					vx=-8;
					vy=0;
					x=600;
					y=Math.random()*290;
					gotoAndStop(1);
				break;
				case 1:
					moeda=false;
					vx=-12;
					vy=2;
					x=600;
					y=Math.random()*290;
					gotoAndStop(2);
				break;
				case 2:
					moeda=false;
					vx=-8;
					vy=-6;
					x=Math.random()*300+300;
					y=338;
					gotoAndStop(3);
				break;
			}
		}
		public function update(){
			x+=vx;
			y+=vy;
			tempo++;
			if (tipo==1 && tempo>=10){
				tempo=0;
				vy=-vy;
			}
		}
	}
}