package Minigames.Bejeweled{
	import flash.display.MovieClip;
	public class Ponto extends MovieClip{
		public var apagar:Boolean;
		public function Ponto(x:int,y:int,base:int,combo:int){
			this.x=x;
			this.y=y;
			apagar=false;
			switch (base){
				case 2:gotoAndStop(1);break;
				case 4:gotoAndStop(2);break;
				case 8:gotoAndStop(3);break;
			}
			if (combo>1){
				edCombo.text= "x"+combo;
			} else {
				edCombo.text= "";
			}
		}
		public function update(){
			var deltax:Number = 230-x;
			var deltay:Number = 23-y;
			var hipo:Number = Math.sqrt(deltax*deltax+deltay*deltay);
			if (hipo<20){
				apagar=true;
			}
			else {
				x+=deltax/hipo*8;
				y+=deltay/hipo*8;
				
			}
			
		}
	}
}