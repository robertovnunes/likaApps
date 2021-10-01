package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;

	public class GameTime extends MovieClip
	{
		public function GameTime()
		{
			this.optionsBtn.addEventListener(MouseEvent.CLICK, OpenOptions);
		}
		public function OpenOptions(me:MouseEvent){			
			Data.openOptions = true;			
		}
	}
}