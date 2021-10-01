package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;

	public class Config extends MovieClip
	{
		private var lockFrames:Boolean = false;
		private var mainInt:int;
		private var main2Int:int;
		public function Config(){
			// constructor code
			mainInt=SoundEngine.volumeChannel1;
			main2Int=SoundEngine.volumeChannel2;
			this.gotoAndPlay(1);
			this.addEventListener(Event.ENTER_FRAME, ConfigEnterFrame);
		}
		public function IncreaseSound(me:MouseEvent){
			mainInt++;
			if (mainInt>4) mainInt=4;
			main.gotoAndStop(mainInt+1);
			SoundEngine.volumeMusica(mainInt);
		}
		public function DecreaseSound(me:MouseEvent){
			mainInt--;
			if (mainInt<0) mainInt=0;
			main.gotoAndStop(mainInt+1);
			SoundEngine.volumeMusica(mainInt);
		}
		public function IncreaseSound2(me:MouseEvent){
			main2Int ++;
			if (main2Int>4) main2Int=4;
			main2.gotoAndStop(main2Int+1);
			SoundEngine.volumeEfeitos(main2Int);
		}
		public function DecreaseSound2(me:MouseEvent){
			main2Int --;
			if (main2Int<0) main2Int=0;
			main2.gotoAndStop(main2Int+1);
			SoundEngine.volumeEfeitos(main2Int);
		}
		public function DownloadPDF(me:MouseEvent){
			try {
                var req:URLRequest = new URLRequest("http://www.icaregames.com.br/samu/cartilha.pdf");
            	navigateToURL(req, "_blank");
            } catch (e:Error) {
                trace("Navigate to URL failed", e.message);
            }
		}
		public function ConfigEnterFrame(e:Event){
			if (lockFrames){
				this.gotoAndStop(currentFrame);
			}
			if (! lockFrames){
				this.play();
			}
			if (this.currentFrame == 19){
				lockFrames = true;
			}
			if (this.currentFrame == 20){
				this.backBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.main.gotoAndStop(mainInt+1);
				this.main2.gotoAndStop(main2Int+1);
				this.more.addEventListener(MouseEvent.CLICK, IncreaseSound);
				this.less.addEventListener(MouseEvent.CLICK, DecreaseSound);
				this.more2.addEventListener(MouseEvent.CLICK, IncreaseSound2);
				this.less2.addEventListener(MouseEvent.CLICK, DecreaseSound2);
				this.downloadBtn.addEventListener(MouseEvent.CLICK, DownloadPDF);
			}
			if (this.currentFrame == 41){
				Intro1.blockClick = false;
				Tutorial.blockClick = false;
				Data.closeOptions = true;
			}
		}
		public function Advance(me:MouseEvent){
			lockFrames = false;
		}
	}
}