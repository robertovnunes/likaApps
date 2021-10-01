package Minigames.Bejeweled{
	import flash.display.MovieClip;
	import flash.media.Sound;
	public class Dado {
		static public var mcPedras:MovieClip;
		static public var mcCasas:MovieClip;
		static public var palco:MovieClip;
		static public var selCasa1:Casa;
		static public var selCasa2:Casa;
		static public var aniPontos:Array;
		static public var casas:Array;
		static public var travado:Boolean;
		static public var combo:int;
		static public var pontos:int;
		static public var iniciou:Boolean=false;
		static public function limparSelecao(){
			if (Dado.selCasa1!=null){
				Dado.selCasa1.gotoAndStop(1);
				Dado.selCasa1=null;
			}
			if (Dado.selCasa2!=null){
				Dado.selCasa2.gotoAndStop(1);
				Dado.selCasa2=null;
			}
		}
		static public function pontuar(x:int,y:int,tamanho:int){
			if (iniciou){
				combo++;
				var acrecimo:int = 0;
				switch (tamanho){
					case 2:acrecimo = 2;break;
					case 3:acrecimo = 4;break;
					case 4:acrecimo = 8;break;
				}
				aniPontos.push(new Ponto(mcPedras.x+x,mcPedras.y+y,acrecimo,combo));
				palco.addChild(aniPontos[aniPontos.length-1]);
				pontos+=acrecimo*combo;
			}
			SoundEngine.tocarEfeito(new somBjAcerto());
			/*var som:Sound = new combo5();
			switch (combo){
				case 1:som = new combo1();break;
				case 2:som = new combo2();break;
				case 3:som = new combo3();break;
				case 4:som = new combo4();break;
			}
			som.play(0);*/
		}
	}
}