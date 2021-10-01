package Minigames.Unblock{
	import flash.display.MovieClip;
	
	public class Veiculo extends MovieClip{
		public var tipo:int;
		public var orientacao:Boolean;//false - horizontal, true - vertical
		public static var AMBULANCIA=0;
		public static var A=1;
		public static var B=2;
		public static var C=3;
		public static var D=4;
		public var px:int;
		public var py:int;
		public var altura:int;
		public var largura:int;
		public function Veiculo(tipo:int,x:int,y:int) {
			this.px=x;
			this.py=y;
			this.x=x*50+215;
			this.y=y*50+20;
			this.tipo=tipo;
			gotoAndStop(tipo+1);
			switch(tipo){
				case AMBULANCIA:
					orientacao = false;
					altura=0;
					largura=1;
				break;
				case A:
					orientacao = true;
					altura=1;
					largura=0;
				break;
				case B:
					orientacao = false;
					altura=0;
					largura=1;
				break;
				case C:
					orientacao = true;
					altura=2;
					largura=0;
				break;
				case D:
					orientacao = false;
					altura=0;
					largura=2;
				break;
			}
		}
		public function marcarPosicao(grade:Array,marcado:Boolean){
			for (var i:int=0;i<grade.length;i++){
				if (px<=grade[i].px && px+largura>=grade[i].px && py<=grade[i].py && py+altura>=grade[i].py){
					grade[i].marcado=marcado;
				}
			}
		}
		public function confirmaPosicao(grade:Array){
			px=Math.round((x-215)/50);
			py=Math.round((y-20)/50);
			this.x=px*50+215;
			this.y=py*50+20;
			marcarPosicao(grade,true);
		}
	}
	
}
