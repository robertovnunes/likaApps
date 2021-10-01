package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Tutorial extends MovieClip
	{
		private var lockFrames:Boolean = false;
		static public var blockClick:Boolean = false;

		public function Tutorial()
		{
			// constructor code
			lockFrames = false;
			this.gotoAndPlay(1);
			//this.countdown.gotoAndPlay(1);
			this.addEventListener(Event.ENTER_FRAME, TutorialEnterFrame);
		}
		public function OpenOptions(me:MouseEvent){
			if (blockClick == false){
				Data.openOptions = true;
				blockClick = true;
			}			
		}
		public function TutorialEnterFrame(e:Event)
		{
			if (lockFrames)
			{
				this.gotoAndStop(currentFrame);
			}
			if (! lockFrames)
			{
				this.play();
			}
			if (this.currentFrame == 20)
			{
				lockFrames = true;
			} else if (this.currentFrame == 21)
			{
				this.playBtn.addEventListener(MouseEvent.CLICK, StartGame);
				this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
				this.pn1.restrict="a-zA-Z_ \\-";
				this.pn2.restrict="a-zA-Z_ \\-";
				this.pn3.restrict="a-zA-Z_ \\-";
				this.pn4.restrict="a-zA-Z_ \\-";
				this.pn1.maxChars = 10;
				this.pn2.maxChars = 10;
				this.pn3.maxChars = 10;
				this.pn4.maxChars = 10;
				if (this.cb1.selectedItem.data=="v1"){
					this.red2.alpha = 1;
				}else if (this.cb1.selectedItem.data!="v1"){
					this.red2.alpha = 0;
				}
				if (this.cb2.selectedItem.data=="v2"){
					this.blue2.alpha = 1;
				}else if (this.cb2.selectedItem.data!="v2"){
					this.blue2.alpha = 0;
				}
				if (this.cb3.selectedItem.data=="v3"){
					this.green2.alpha = 1;
				}else if (this.cb3.selectedItem.data!="v3"){
					this.green2.alpha = 0;
				}
				if (this.cb4.selectedItem.data=="v4"){
					this.yellow2.alpha = 1;
				}else if (this.cb4.selectedItem.data!="v4"){
					this.yellow2.alpha = 0;
				}
					
			} else if (this.currentFrame==41){
				this.removeEventListener(Event.ENTER_FRAME, TutorialEnterFrame);
				Data.showGameEngine = true;
				this.gotoAndStop(1);
			}
			
		}
		public function Advance(me:MouseEvent){
			lockFrames=false;
		}
		public function StartGame(me:MouseEvent)
		{
			if (this.cb1.selectedItem.data == "j1")
			{
				Data.ppl1 = true;
				Data.bot1 = false;
			}
			else if (this.cb1.selectedItem.data=="c1")
			{
				Data.bot1 = true;
				Data.ppl1 = false;
			}
			else if (this.cb1.selectedItem.data=="v1")
			{
				Data.ppl1 = false;
				Data.bot1 = false;
			}
			if (this.cb2.selectedItem.data == "j2")
			{
				Data.ppl2 = true;
				Data.bot2 = false;
			}
			else if (this.cb2.selectedItem.data=="c2")
			{
				Data.bot2 = true;
				Data.ppl2 = false;
			}
			else if (this.cb2.selectedItem.data=="v2")
			{
				Data.ppl2 = false;
				Data.bot2 = false;
			}
			if (this.cb3.selectedItem.data == "j3")
			{
				Data.ppl3 = true;
				Data.bot3 = false;
			}
			else if (this.cb3.selectedItem.data=="c3")
			{
				Data.bot3 = true;
				Data.ppl3 = false;
			}
			else if (this.cb3.selectedItem.data=="v3")
			{
				Data.ppl3 = false;
				Data.bot3 = false;
			}
			if (this.cb4.selectedItem.data == "j4")
			{
				Data.ppl4 = true;
				Data.bot4 = false;
			}
			else if (this.cb4.selectedItem.data=="c4")
			{
				Data.bot4 = true;
				Data.ppl4 = false;
			}
			else if (this.cb4.selectedItem.data=="v4")
			{
				Data.ppl4 = false;
				Data.bot4 = false;
			}
			Data.player1Name = this.pn1.text;
			Data.player2Name = this.pn2.text;
			Data.player3Name = this.pn3.text;
			Data.player4Name = this.pn4.text;
			if (!Data.ppl1 && !Data.ppl2 && !Data.ppl3 && !Data.ppl4){
				this.infoText.text = "Escolha um veículo para ser jogador";
			}else{
				lockFrames = false;
			}
			this.playBtn.removeEventListener(MouseEvent.CLICK, StartGame);
			this.optionsBtn.removeEventListener(MouseEvent.CLICK, OpenOptions);
		}
	}
}