package Minigames {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.globalization.DateTimeFormatter;
	public class Relogio extends MovieClip {
		private var antTempo:Date;
		public var tempo:Date;
		public function Relogio() {
			this.tempo = new Date();
			antTempo = new Date();
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		public function setTime(tempo:int){
			this.tempo=new Date(tempo);
			this.antTempo = new Date();
		}
		public function loop(e:Event){
			var agora = new Date();
			tempo=new Date(tempo.time-agora.time+antTempo.time);
			antTempo=agora;
			if (tempo.time<=0){
				removeEventListener(Event.ENTER_FRAME,loop);
				var evt:Event = new Event("TempoZero");
				dispatchEvent(evt);
			} else {
				var dtf:DateTimeFormatter = new DateTimeFormatter("en-US");
				dtf.setDateTimePattern("mm:ss");
				texto.text=dtf.format(tempo);
			}
		}
	}
}
