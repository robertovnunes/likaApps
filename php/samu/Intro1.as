package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Intro1 extends MovieClip {
		private var lockFrames:Boolean = false;		
		static public var blockClick:Boolean = false;

		public function Intro1() {
			// constructor code			
			this.addEventListener(Event.ENTER_FRAME, Intro1EnterFrame);
		}
		public function Advance(me:MouseEvent){
			//Data.showSplashScreen = true;
			//Data.showTutorial = true;
			lockFrames = false;
		}
		public function OpenOptions(me:MouseEvent){
			if (blockClick == false){
				Data.openOptions = true;
				blockClick = true;
			}			
		}
		public function Intro1EnterFrame(e:Event){
			if (lockFrames)this.gotoAndStop(currentFrame);
			if (!lockFrames)this.play();
			if (this.currentFrame==46)lockFrames=true;
			if (this.currentFrame==47){
				this.playBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
			}
			if (this.currentFrame>=78)Data.showTutorial = true;
		}

	}
	
}
