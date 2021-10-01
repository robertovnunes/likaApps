package Minigames.DragDrop {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class GameDragDrop extends MovieClip{
		private var icones:Array;
		private var dropTempo:int;
		private var selIcone:int;
		private var pontoBom:int;
		public var vitoria:Boolean;
		public function GameDragDrop() {
			icones = new Array();
			dropTempo = 0;
			pontoBom = 0;
			selIcone = -1;
			relogio.setTime(90*1000);
			mcBom.gotoAndStop(1);
			mcRuim.gotoAndStop(2);
			addEventListener(Event.ENTER_FRAME,loop);
			addEventListener(MouseEvent.MOUSE_DOWN,precionaMouse);
			addEventListener(MouseEvent.MOUSE_MOVE,moveMouse);
			addEventListener(MouseEvent.MOUSE_UP,soltaMouse);
		}
		public function finalizarJogo(){
			removeEventListener(Event.ENTER_FRAME,loop);
			removeEventListener(MouseEvent.MOUSE_DOWN,precionaMouse);
			removeEventListener(MouseEvent.MOUSE_MOVE,moveMouse);
			removeEventListener(MouseEvent.MOUSE_UP,soltaMouse);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function precionaMouse(e:MouseEvent){
			selIcone=-1;
			var ajuste:Point=areaQueda.localToGlobal(new Point(0,0));
			var mousex = e.stageX-ajuste.x;
			var mousey = e.stageY-ajuste.y;
			for (var i:int=0;i<icones.length;i++){
				if (mousex>=icones[i].x && mousex<=icones[i].x+icones[i].width && mousey>=icones[i].y && mousey<=icones[i].y+icones[i].height){
					areaQueda.removeChild(icones[i]);
					icones[i].x+=areaQueda.x;
					icones[i].y+=areaQueda.y;
					addChild(icones[i]);
					icones[i].arrastando=true;
					selIcone=i;
					break;
				}
			}
		}
		private function moveMouse(e:MouseEvent){
			if (selIcone>-1){
				var ajuste:Point=localToGlobal(new Point(0,0));
				var mousex = e.stageX-ajuste.x;
				var mousey = e.stageY-ajuste.y;
				icones[selIcone].x = mousex-icones[selIcone].width/2;
				icones[selIcone].y = mousey-icones[selIcone].height/2;
			}
		}
		private function soltaMouse(e:MouseEvent){
			if (selIcone>-1){
				var ajuste:Point=localToGlobal(new Point(0,0));
				var mousex = e.stageX-ajuste.x;
				var mousey = e.stageY-ajuste.y;
				var temp:Icone = icones[selIcone];
				if (mousex>mcBom.x && mousex<mcBom.x+mcBom.width && mousey>mcBom.y && mousey<mcBom.y+mcBom.height){
					if (temp.efeito){
						SoundEngine.tocarEfeito(new somDragDropCerto());
						pontoBom++;
					} else {
						SoundEngine.tocarEfeito(new somDragDropErrado());
						pontoBom--;
					}
					icones.splice(selIcone,1);
					removeChild(temp);
				} else if (mousex>mcRuim.x && mousex<mcRuim.x+mcRuim.width && mousey>mcRuim.y && mousey<mcRuim.y+mcRuim.height){
					if (temp.efeito){
						SoundEngine.tocarEfeito(new somDragDropErrado());
						pontoBom--;
					} else {
						SoundEngine.tocarEfeito(new somDragDropCerto());
						pontoBom++;
					}
					icones.splice(selIcone,1);
					removeChild(temp);
				} else {
					temp.arrastando=false;
					removeChild(temp);
					temp.x=26;
					temp.y=266;
					areaQueda.addChild(temp);
				}
				selIcone=-1;
			}
		}
		private function loop(e:Event){
			dropTempo--;
			if (dropTempo<=0){
				if (icones.length<4){
					dropTempo=40;
					var temp=new Icone();
					icones.push(temp);
					areaQueda.addChild(temp);
				} else {
					vitoria=false;
					finalizarJogo();
				}
			}
			for (var i:int=0;i<icones.length;i++){
				icones[i].ordem=i;
				icones[i].update();
			}
			txBom.text = pontoBom+"";
			if (relogio.tempo.time<=0){
				vitoria = false;
				finalizarJogo();
			} else if (pontoBom>=15){
				vitoria=true;
				finalizarJogo();
			}
		}
	}
}