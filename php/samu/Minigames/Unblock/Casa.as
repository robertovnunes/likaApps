package Minigames.Unblock{
	import flash.display.MovieClip;
	
	public class Casa extends MovieClip{
		public var marcado:Boolean;
		public var saida:Boolean;
		public var px:int;
		public var py:int;
		public function Casa(x:int,y:int) {
			this.x=x*50+215;
			this.y=y*50+20;
			px=x;
			py=y;
			marcado=false;
			saida=false;
			stop();
		}
	}
	
}
