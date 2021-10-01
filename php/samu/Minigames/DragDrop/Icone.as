package Minigames.DragDrop{
	import flash.display.MovieClip;
	public class Icone extends MovieClip{
		public var vy:Number;
		public var ordem:int;
		public var arrastando:Boolean;
		public var efeito:Boolean;
		public function Icone() {
			x=26;
			y=-70;
			vy=0;
			arrastando=false;
			var r:int=Math.random()*14;
			gotoAndStop(r+1);
			efeito=r<=5;
		}
		public function update() {
			if (!arrastando){
				vy+=0.5;
				y+=vy;
				if (y+height>266-ordem*70){
					vy=0;
					y=266-ordem*70-height;
				}
			}
		}
	}
}
