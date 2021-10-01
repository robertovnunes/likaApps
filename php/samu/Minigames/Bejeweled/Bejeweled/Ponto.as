package{
	import flash.display.MovieClip;
	public class Ponto extends MovieClip{
		public var apagar:Boolean;
		public function Ponto(x:int,y:int,base:int,combo:int){
			this.x=x;
			this.y=y;
			apagar=false;
			edCombo.text= "x"+combo;
			edBase.text= base+"";
		}
		public function update(){
			var deltax:Number = 100-x;
			var deltay:Number = 140-y;
			var hipo:Number = Math.sqrt(deltax*deltax+deltay*deltay);
			alpha-=0.03;
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