package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class NewClassTutorial extends MovieClip {
		
		private var lockFrames:Boolean = false;
		static public var blockClick:Boolean = false;
		private var hit:Boolean = false;

		public function NewClassTutorial() {
			// constructor code
			lockFrames = false;
			this.gotoAndPlay(1);
			this.addEventListener(Event.ENTER_FRAME, NewClassTutorialEnterFrame);
		}
		public function OpenOptions(me:MouseEvent){
			if (blockClick == false){
				Data.openOptions = true;
				blockClick = true;
			}			
		}
		public function Advance(me:MouseEvent){
			SoundEngine.tocarEfeito(new somClick());
			lockFrames=false;
		}
		public function Previous(me:MouseEvent){
			SoundEngine.tocarEfeito(new somClick());
			hit = true;
			lockFrames = false;			
		}
		public function NewClassTutorialEnterFrame(e:Event){
			if (lockFrames)
			{
				this.gotoAndStop(currentFrame);
			}
			if (! lockFrames)
			{
				if (hit){
					this.prevFrame();
				}else{
					this.play();
				}				
			}
			if (this.currentFrame==13){
				lockFrames = true;
				SoundEngine.ReproduzirFala("VozAbertura1");
			}
			if(this.currentFrame==14){
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
				if (hit){
					SoundEngine.ReproduzirFala("VozAbertura1");
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame==27){
				if (!hit){
					lockFrames=true;
					SoundEngine.ReproduzirFala("VozAbertura2");
				}				
			}
			if(this.currentFrame==28){
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
				if (hit){
					SoundEngine.ReproduzirFala("VozAbertura2");
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame==42){
				if (!hit){
					lockFrames=true;
					SoundEngine.ReproduzirFala("VozAbertura3");
				}
			}
			if(this.currentFrame==43){
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
				if (hit){
					SoundEngine.ReproduzirFala("VozAbertura3");
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame==58){
				if (!hit){
					SoundEngine.ReproduzirFala("VozAbertura4");
					lockFrames=true;
					SoundEngine.ReproduzirFala("VozAbertura4");
				}
			}
			if(this.currentFrame==59){
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
				if (hit){					
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame == 67)
			{
				Data.showRealMenu = true;
				this.removeEventListener(Event.ENTER_FRAME, NewClassTutorialEnterFrame);
				this.gotoAndStop(1);
			}
		}
	}
}
