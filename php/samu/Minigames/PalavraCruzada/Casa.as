package Minigames.PalavraCruzada {
	import flash.display.MovieClip;
	
	public class Casa extends MovieClip {
		public var px:int;
		public var py:int;
		public var conteudo:String;
		public var travado:Boolean;
		public function Casa(px:int,py:int) {
			this.px=px;
			this.py=py;
			this.x=px*20+140;
			this.y=py*20+10;
			this.travado=false;
			letra.gotoAndStop("vazio");
			gotoAndStop(1);
		}
	}
	
}
