package Minigames.Caminho {
	import flash.display.MovieClip;
	public class Ambulancia extends MovieClip {
		public var posicao:int;
		public var rota:Array;
		public function Ambulancia(local:Ligacao) {
			gotoAndStop(1);
			x=local.x;
			y=local.y;
		}
	}
	
}
