package Minigames.Forca{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;

	public class GameForca extends MovieClip{
		private var palavra:String;
		private var letFaltando:int;
		private var letras:Array;
		private var vidas:Array;
		private var vida:int;
		public var vitoria:Boolean;
		public function GameForca() {
			sorteiaPalavra();
			adicionaLetras();
			adicionaVidas();
			preparaBotao(leta);
			preparaBotao(letb);
			preparaBotao(letc);
			preparaBotao(letd);
			preparaBotao(lete);
			preparaBotao(letf);
			preparaBotao(letg);
			preparaBotao(leth);
			preparaBotao(leti);
			preparaBotao(letj);
			preparaBotao(letk);
			preparaBotao(letl);
			preparaBotao(letm);
			preparaBotao(letn);
			preparaBotao(leto);
			preparaBotao(letp);
			preparaBotao(letq);
			preparaBotao(letr);
			preparaBotao(lets);
			preparaBotao(lett);
			preparaBotao(letu);
			preparaBotao(letv);
			preparaBotao(letw);
			preparaBotao(letx);
			preparaBotao(lety);
			preparaBotao(letz);
			relogio.setTime(90*1000);
			relogio.addEventListener("TempoZero",acabaTempo);
			Data.palco.addEventListener(KeyboardEvent.KEY_DOWN,teclaLetra);
		}
		public function acabaTempo(e:Event){
			vitoria=false;
			finalizarJogo();
		}
		public function finalizarJogo(){
			liberaBotao(leta);
			liberaBotao(letb);
			liberaBotao(letc);
			liberaBotao(letd);
			liberaBotao(lete);
			liberaBotao(letf);
			liberaBotao(letg);
			liberaBotao(leth);
			liberaBotao(leti);
			liberaBotao(letj);
			liberaBotao(letk);
			liberaBotao(letl);
			liberaBotao(letm);
			liberaBotao(letn);
			liberaBotao(leto);
			liberaBotao(letp);
			liberaBotao(letq);
			liberaBotao(letr);
			liberaBotao(lets);
			liberaBotao(lett);
			liberaBotao(letu);
			liberaBotao(letv);
			liberaBotao(letw);
			liberaBotao(letx);
			liberaBotao(lety);
			liberaBotao(letz);
			Data.palco.removeEventListener(KeyboardEvent.KEY_DOWN,teclaLetra);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function teclaLetra(e:KeyboardEvent){
			var c:String = String.fromCharCode(e.charCode);
			c = c.toUpperCase();
			var mc:MovieClip;
			switch (c){
				case "A":mc = leta;break;
				case "B":mc = letb;break;
				case "C":mc = letc;break;
				case "D":mc = letd;break;
				case "E":mc = lete;break;
				case "F":mc = letf;break;
				case "G":mc = letg;break;
				case "H":mc = leth;break;
				case "I":mc = leti;break;
				case "J":mc = letj;break;
				case "K":mc = letk;break;
				case "L":mc = letl;break;
				case "M":mc = letm;break;
				case "N":mc = letn;break;
				case "O":mc = leto;break;
				case "P":mc = letp;break;
				case "Q":mc = letq;break;
				case "R":mc = letr;break;
				case "S":mc = lets;break;
				case "T":mc = lett;break;
				case "U":mc = letu;break;
				case "V":mc = letv;break;
				case "W":mc = letw;break;
				case "X":mc = letx;break;
				case "Y":mc = lety;break;
				case "Z":mc = letz;break;
			}
			if (mc.currentFrame!=3){
				escolheuLetra(mc,c);
			}
		}
		private function clickLetra(e:MouseEvent){
			var mc:MovieClip = MovieClip(e.target);
			var c:String = "";
			switch (mc){
				case leta:c="A";break;
				case letb:c="B";break;
				case letc:c="C";break;
				case letd:c="D";break;
				case lete:c="E";break;
				case letf:c="F";break;
				case letg:c="G";break;
				case leth:c="H";break;
				case leti:c="I";break;
				case letj:c="J";break;
				case letk:c="K";break;
				case letl:c="L";break;
				case letm:c="M";break;
				case letn:c="N";break;
				case leto:c="O";break;
				case letp:c="P";break;
				case letq:c="Q";break;
				case letr:c="R";break;
				case lets:c="S";break;
				case lett:c="T";break;
				case letu:c="U";break;
				case letv:c="V";break;
				case letw:c="W";break;
				case letx:c="X";break;
				case lety:c="Y";break;
				case letz:c="Z";break;
			}
			escolheuLetra(mc,c);
		}
		private function escolheuLetra(mc:MovieClip,letra:String){
			var i:int;
			var achou:Boolean = false;
			for (i=0;i<palavra.length;i++){
				if (palavra.charAt(i)==letra){
					achou=true;
					letFaltando--;
					letras[i].txtLetra.text=letra;
				}
			}
			if (!achou){
				vida--;
				SoundEngine.tocarEfeito(new somDragDropErrado());
				for (i=0;i<3;i++){
					if (i<vida){
						vidas[i].alpha=1;
					} else {
						vidas[i].alpha=0;
					}
				}
			} else {
				SoundEngine.tocarEfeito(new somDragDropCerto());
			}
			
			
			var e:Event;
			if (vida<=0){
				vitoria=false;
				finalizarJogo();
			} else if (letFaltando<=0){
				vitoria=true;
				finalizarJogo();
			}
			mc.removeEventListener(MouseEvent.CLICK,clickLetra);
			mc.removeEventListener(MouseEvent.MOUSE_OVER,marcar);
			mc.removeEventListener(MouseEvent.MOUSE_OUT,desMarcar);
			mc.gotoAndStop(3);
		}
		private function liberaBotao(botao:MovieClip){
			botao.removeEventListener(MouseEvent.CLICK, clickLetra);
			botao.removeEventListener(MouseEvent.MOUSE_OVER, marcar);
			botao.removeEventListener(MouseEvent.MOUSE_OUT, desMarcar);
		}
		private function preparaBotao(botao:MovieClip){
			botao.gotoAndStop(1);
			botao.addEventListener(MouseEvent.CLICK, clickLetra);
			botao.addEventListener(MouseEvent.MOUSE_OVER, marcar);
			botao.addEventListener(MouseEvent.MOUSE_OUT, desMarcar);
		}
		private function marcar(e:MouseEvent){
			e.target.gotoAndStop(2);
		}
		private function desMarcar(e:MouseEvent){
			e.target.gotoAndStop(1);
		}
		private function adicionaLetras(){
			letras = new Array();
			var inicio:int= 194 + (380-palavra.length*30)/2;
			
			for (var i:int=0;i<palavra.length ;i++){
				var temp:MovieClip = new mcLetra();
				temp.txtLetra.text="";
				temp.y=170;
				temp.x=i*30+inicio;//194-574
				letras.push(temp);
				addChild(letras[i]);
			}
		}
		private function adicionaVidas(){
			vida=3;
			vidas= new Array();
			for (var i:int=0;i<vida;i++){
				var vd:MovieClip = new mcVida();
				vd.y=280;
				vd.x=i*50+450;
				vidas.push(vd);
				addChild(vd);
			}
		}
		private function sorteiaPalavra(){
			var sorteio:int = Math.random()*6;
			switch (sorteio){
				case 0:palavra="ambulancia";break;
				case 1:palavra="cruz";break;
				case 2:palavra="garoto";break;
				case 3:palavra="hospital";break;
				case 4:palavra="motolancia";break;
				case 5:palavra="triangulo";break;
				case 6:palavra="vida";break;
				default :
					palavra="vida";
					sorteio=6;
				break;
			}
			palavra=palavra.toUpperCase();
			mcDica.gotoAndStop(sorteio+1);
			letFaltando = palavra.length;
		}
	}
}
