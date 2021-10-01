package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Congratulations extends MovieClip {
		
		private var lockFrames:Boolean = false;

		public function Congratulations() {
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, CongratulationsEnterFrame);			
		}
		public function CongratulationsEnterFrame(e:Event){
			if (lockFrames)this.gotoAndStop(currentFrame);
			if (!lockFrames)this.play();
			if (this.currentFrame==10)lockFrames;
			if (this.currentFrame==11){
				this.winner.text=="";//Pendente: Identificar jogador vencedor
				this.addEventListener(MouseEvent.CLICK, Clicking);
			}
			if (this.currentFrame>=22){
				//Pendente: Abrir tela de ranking
			}
		}
		public function Clicking(me:MouseEvent){
			lockFrames=false;
		}

	}
	
}
