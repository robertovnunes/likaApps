package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Infografico extends MovieClip
	{

		//private var lockFrames:Boolean = false;
		//static public var blockClick:Boolean = false;
		//private var hit:Boolean = false;
		private var animacao:int;
		private var posicaoEntrada:Array;
		private var posicaoEstatica:Array;
		private var posicaoSaida:Array;
		public function Infografico(){
			//lockFrames = false;			
			animacao = 0;
			posicaoEntrada = new Array(4,38,107,144,192,231);
			posicaoEstatica = new Array(29,79,131,174,218,262);
			posicaoSaida = new Array(37,106,143,191,230,288);
			this.gotoAndPlay(1);
			//Data.showIntro1 = true;
			this.addEventListener(Event.ENTER_FRAME, InfograficoEnterFrame);
		}
		public function Advance(me:MouseEvent)
		{
			SoundEngine.tocarEfeito(new somClick());
			play();
			limparBotoes();
			animacao++;
		}
		public function Previous(me:MouseEvent)
		{
			SoundEngine.tocarEfeito(new somClick());
			play();
			limparBotoes();
			animacao--;
		}
		private function limparBotoes(){
			this.nextBtn.removeEventListener(MouseEvent.CLICK, Advance);
			if (animacao!=0){
				this.backBtn.removeEventListener(MouseEvent.CLICK, Previous);
			}
		}
		public function InfograficoEnterFrame(e:Event)
		{
			if (posicaoEstatica.indexOf(this.currentFrame)!=-1){
				this.gotoAndStop(currentFrame);
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				if (animacao!=0){
					this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				}
			} else if (posicaoSaida.indexOf(this.currentFrame)!=-1){
				if (animacao<posicaoEntrada.length) {
					gotoAndPlay(posicaoEntrada[animacao]);//dando bug
				}
			}
			
			/*if (lockFrames)
			{
				this.gotoAndStop(currentFrame);
			}
			if (! lockFrames)
			{
				if (hit)
				{
					this.prevFrame();
				}
				else
				{
					this.play();
				}
			}
			if (this.currentFrame == 114)
			{
				lockFrames = true;
			}
			if (this.currentFrame == 115)
			{
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				if (hit)
				{
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame == 262)
			{
				if (! hit)
				{
					lockFrames = true;
				}
			}
			if (this.currentFrame == 263)
			{
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				if (hit)
				{
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame == 436)
			{
				if (! hit)
				{
					lockFrames = true;
				}
			}
			if (this.currentFrame == 437)
			{
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				if (hit)
				{
					hit = false;
					lockFrames = true;
				}
			}
			if (this.currentFrame == 474)
			{
				if (! hit)
				{
					lockFrames = true;
				}
			}
			if (this.currentFrame == 475)
			{
				this.nextBtn.addEventListener(MouseEvent.CLICK, Advance);
				this.backBtn.addEventListener(MouseEvent.CLICK, Previous);
				if (hit)
				{
					hit = false;
					lockFrames = true;
				}
			}*/
			if (this.currentFrame >= 333)
			{
				Data.showIntro1 = true;
				this.removeEventListener(Event.ENTER_FRAME, InfograficoEnterFrame);
				this.gotoAndStop(1);
			}
		}
	}
}