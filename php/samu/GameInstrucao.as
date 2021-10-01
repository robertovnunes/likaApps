package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class GameInstrucao extends MovieClip {
		private var id:int;
		
		public function GameInstrucao(id:int) {
			this.id=id;
			this.x = -200;
			this.y = -200;
			this.addEventListener(Event.ENTER_FRAME, GameResultEnterFrame);
		}
		public function GameResultEnterFrame(e:Event){
			if (currentFrame==1){
				SoundEngine.tocarEfeito(new somAbreRoleta());
			} else if (currentFrame==11){
				switch (id){
					case 0:SoundEngine.ReproduzirFala("VozForca");break;
					case 1:SoundEngine.ReproduzirFala("VozDragndrop");break;
					case 2:SoundEngine.ReproduzirFala("VozUnblock");break;
					case 3:SoundEngine.ReproduzirFala("VozMemoria");break;
					case 4:SoundEngine.ReproduzirFala("VozCP");break;
					case 5:SoundEngine.ReproduzirFala("VozUrgencia");break;
					case 6:SoundEngine.ReproduzirFala("VozErros");break;
					case 7:SoundEngine.ReproduzirFala("VozSamuacaminho");break;
					case 8:SoundEngine.ReproduzirFala("VozHelicoptero");break;
					case 9:SoundEngine.ReproduzirFala("VozPC");break;
					case 10:SoundEngine.ReproduzirFala("VozJoias");break;
				}
				gotoAndStop(12+id);
				removeEventListener(Event.ENTER_FRAME, GameResultEnterFrame);
				this.addEventListener(MouseEvent.CLICK,Advance);
			}		
		}
		public function Advance(me:MouseEvent){
			SoundEngine.pararLoopEfeito();
			this.removeEventListener(MouseEvent.CLICK,Advance);
			SoundEngine.tocarEfeito(new somFechaRoleta());
			var evt:Event = new Event("Fechar");
			dispatchEvent(evt);
		}
	}
	
}
