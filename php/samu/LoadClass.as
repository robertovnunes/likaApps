package  {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.display.Loader;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	public class LoadClass extends MovieClip {
		
		public var Game:URLRequest;
		public var classLoader:Loader;

		public function LoadClass() {
			// constructor code
			Game = new URLRequest("Game.swf");
			classLoader = new Loader();
			classLoader.x = 0;
			classLoader.y = 0;
			classLoader.load(Game);
			classLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ShowError);
			classLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, LoadingStatus);
			classLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, LoadingEnd);
			addChild(classLoader);
		}
		function ShowError(e:IOErrorEvent):void
		{

			status_txt.text = "Error loading the game, please try again";

		}
		function LoadingStatus(e:ProgressEvent):void
		{
			var bTotal:Number = e.bytesTotal;
			var bLoader:Number = e.bytesLoaded;
			var percentual:Number =  Math.round(bLoader*100/bTotal);
			//barraStatus_mc.scaleX = percentual / 100;
			status_txt.text = String(percentual) + "%";
		}
		function LoadingEnd(e:Event):void
		{
			status_txt.text = "";
			//barraStatus_mc.scaleX = 0;
		}

	}
	
}
