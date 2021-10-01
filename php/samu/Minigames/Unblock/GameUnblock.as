package Minigames.Unblock{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;

	public class GameUnblock extends MovieClip{
		private var veiculos:Array;
		private var grade:Array;
		private var selecionado:int;
		private var altura:int;
		private	var largura:int;
		private var inicioX:int;
		private var inicioY:int;
		private var mousex:int;
		private var mousey:int;
		private var saida:Casa;
		public var vitoria:Boolean;
		public function GameUnblock() {
			selecionado=-1;
			carregarJogo();
			relogio.setTime(90*1000);
			addEventListener(Event.ENTER_FRAME,loop);
			addEventListener(MouseEvent.MOUSE_DOWN,precionaMouse);
			addEventListener(MouseEvent.MOUSE_MOVE,moveMouse);
			addEventListener(MouseEvent.MOUSE_UP,soltaMouse);
		}
		private function loop(e:Event){
			var i:int;
			if (selecionado>-1){
				if (veiculos[selecionado].orientacao){
					if (Math.abs(veiculos[selecionado].y+veiculos[selecionado].height/2-mousey)<20){
						veiculos[selecionado].y=mousey-veiculos[selecionado].height/2;
					} else if (veiculos[selecionado].y+veiculos[selecionado].height/2>=mousey){
						veiculos[selecionado].y-=20;
					} else {
						veiculos[selecionado].y+=20;
					}
					if (veiculos[selecionado].y<inicioY){
						veiculos[selecionado].y=inicioY;
					} else if (veiculos[selecionado].y+veiculos[selecionado].height>=inicioY+altura*50){
						veiculos[selecionado].y=inicioY+altura*50-veiculos[selecionado].height;
					} else {
						for (i=0;i<grade.length;i++){
							if (grade[i].marcado && veiculos[selecionado].x==grade[i].x){
								if (veiculos[selecionado].py>grade[i].py && veiculos[selecionado].y<=grade[i].y+grade[i].height){
									veiculos[selecionado].y=grade[i].y+grade[i].height;
								}
								if (veiculos[selecionado].py<grade[i].py && veiculos[selecionado].y+veiculos[selecionado].height>=grade[i].y){
									veiculos[selecionado].y=grade[i].y-veiculos[selecionado].height;
								}
							}
						}
					}
				} else {
					if (Math.abs(veiculos[selecionado].x+veiculos[selecionado].width/2-mousex)<20){
						veiculos[selecionado].x=mousex-veiculos[selecionado].width/2;
					} else if (veiculos[selecionado].x+veiculos[selecionado].width/2>=mousex){
						veiculos[selecionado].x-=20;
					} else {
						veiculos[selecionado].x+=20;
					}
					if (veiculos[selecionado].x<inicioX){
						veiculos[selecionado].x=inicioX;
					} else if (veiculos[selecionado].x+veiculos[selecionado].width>=inicioX+largura*50){
						veiculos[selecionado].x=inicioX+largura*50-veiculos[selecionado].width;
					} else {
						for (i=0;i<grade.length;i++){
							if (grade[i].marcado && veiculos[selecionado].y==grade[i].y){
								if (veiculos[selecionado].px>grade[i].px && veiculos[selecionado].x<=grade[i].x+grade[i].width){
									veiculos[selecionado].x=grade[i].x+grade[i].width;
								}
								if (veiculos[selecionado].px<grade[i].px && veiculos[selecionado].x+veiculos[selecionado].width>=grade[i].x){
									veiculos[selecionado].x=grade[i].x-veiculos[selecionado].width;
								}
							}
						}
					}
				}
			}
			if (relogio.tempo.time<=0){
				vitoria = false;
				finalizarJogo();
			}
		}
		private function precionaMouse(e:MouseEvent){
			var ajuste:Point=localToGlobal(new Point(0,0));
			mousex = e.stageX-ajuste.x;
			mousey = e.stageY-ajuste.y;
			soltaMouse(e);
			for (var i:int=0;i<veiculos.length;i++){
				if (mousex>=veiculos[i].x && mousex<=veiculos[i].x+veiculos[i].width && mousey>=veiculos[i].y && mousey<=veiculos[i].y+veiculos[i].height){
					SoundEngine.tocarEfeito(new somUnblockAcelera());
					selecionado = i;
					veiculos[i].marcarPosicao(grade,false);
					break;
				}
			}
		}
		private function moveMouse(e:MouseEvent){
			var ajuste:Point=localToGlobal(new Point(0,0));
			mousex = e.stageX-ajuste.x;
			mousey = e.stageY-ajuste.y;
		}
		private function soltaMouse(e:MouseEvent){
			if (selecionado!=-1){
				veiculos[selecionado].confirmaPosicao(grade);
				if (veiculos[selecionado].tipo==Veiculo.AMBULANCIA && saida.marcado){
					var veic:Veiculo = veiculos[selecionado];					
					if (veic.px<=saida.px && veic.px+veic.largura>=saida.px && veic.py<=saida.py && veic.py+veic.altura>=saida.py){
						vitoria=true;
						finalizarJogo();
					}
				}
				SoundEngine.tocarEfeito(new somUnblockFreio());
				selecionado=-1;
			}
		}
		public function finalizarJogo(){
			removeEventListener(MouseEvent.MOUSE_DOWN,precionaMouse);
			removeEventListener(MouseEvent.MOUSE_MOVE,moveMouse);
			removeEventListener(MouseEvent.MOUSE_UP,soltaMouse);
			removeEventListener(Event.ENTER_FRAME,loop);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function addVeiculo(tipo:int,x:int,y:int){
			var temp:Veiculo = new Veiculo(tipo, x, y);
			temp.marcarPosicao(grade,true);
			veiculos.push(temp);
			addChild(temp);
		}
		private function carregarJogo(){
			inicioX = 215;
			inicioY = 20;
			altura = 6;
			largura = 7;
			grade = new Array();
			for (var i:int=0;i<largura;i++){
				for (var i2:int=0;i2<altura;i2++){
					var temp:Casa = new Casa(i,i2);
					if (i==6 && i2==2){
						saida=temp;
						saida.saida=true;
					}
					grade.push(temp);
					addChild(temp);
				}
			}
			veiculos = new Array();
			cenario1();
		}
		private function cenario1(){
			addVeiculo(Veiculo.AMBULANCIA,0,2);
			addVeiculo(Veiculo.A,0,0);
			addVeiculo(Veiculo.B,1,0);
			addVeiculo(Veiculo.B,1,1);
			addVeiculo(Veiculo.A,3,0);
			addVeiculo(Veiculo.A,4,0);
			addVeiculo(Veiculo.C,5,0);
			addVeiculo(Veiculo.A,2,2);
			addVeiculo(Veiculo.B,0,3);
			addVeiculo(Veiculo.A,1,4);
			addVeiculo(Veiculo.A,2,4);
			//addVeiculo(Veiculo.D,3,4);
		}
	}
}