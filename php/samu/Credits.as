package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Credits extends MovieClip {

		public function Credits() {
			// constructor code
			SoundEngine.tocarMusica("PalavraCruzada");
			this.gotoAndPlay(1);
			this.addEventListener(Event.ENTER_FRAME, CreditsEnterFrame);
		}
		public function CreditsEnterFrame(e:Event){
			if (this.currentFrame>=285){
				Data.showInfografico = true;
				this.gotoAndStop(1);
			}
		}
	}
	
}
