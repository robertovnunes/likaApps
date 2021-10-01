package Minigames.Urgencia{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	public class Teclado{
		static private var teclas:Array=new Array(255);
		static public function Iniciar(stage){
			stage.addEventListener(KeyboardEvent.KEY_DOWN,preciona);
			stage.addEventListener(KeyboardEvent.KEY_UP,solta);
		}
		static public function limparPercionados(){
			for (var i:int=0;i<teclas.length;i++){
				teclas[i]=false;
			}
		}
		static public function preciona(evt:KeyboardEvent){
			teclas[evt.keyCode]=true;
		}
		static public function solta(evt:KeyboardEvent){
			teclas[evt.keyCode]=false;
		}
		static public function verifica(tecla:uint):Boolean{
			return teclas[tecla];
		}
	}	
}