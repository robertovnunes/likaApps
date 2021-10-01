package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;	
	import flash.net.navigateToURL;
    import flash.net.URLRequest;

	
	public class Results extends MovieClip {
		
		private var lockFrames:Boolean = false;
		public function Results() {
			// constructor code
			this.gotoAndPlay(1);
			lockFrames = false;
			this.addEventListener(Event.ENTER_FRAME, ResultsEnterFrame);
		}
		public function ReturnToMenu(me:MouseEvent){
			lockFrames = false;			
		}
		public function ResultsEnterFrame(e:Event){
			if (lockFrames)
			{
				this.gotoAndStop(currentFrame);
			}
			if (! lockFrames)
			{
				this.play();
			}
			if (this.currentFrame == 24)
			{
				lockFrames = true;
			}
			if (this.currentFrame == 25)
			{
				calculaRanking();
				this.nextBtn.addEventListener(MouseEvent.CLICK, ReturnToMenu);
			}
			if (this.currentFrame==248){
				stop();
				this.removeEventListener(Event.ENTER_FRAME, ResultsEnterFrame);
				Data.backToSelection = true;
			}
		}
		private function calculaRanking(){
			posicao1.alpha = 0;
			posicao2.alpha = 0;
			posicao3.alpha = 0;
			posicao4.alpha = 0;
			posicao1.gotoAndStop(5);
			posicao2.gotoAndStop(5);
			posicao3.gotoAndStop(5);
			posicao4.gotoAndStop(5);
			nome1.text="";
			nome2.text="";
			nome3.text="";
			nome4.text="";
			var i=0;
			var ordenado:Boolean=false;
			while (!ordenado){
				ordenado=true;
				for (i=0;i<Data.players.length-1;i++){
					if (Data.players[i].posicaoAtual<Data.players[i+1].posicaoAtual){
						var aux:Player = Data.players[i];
						Data.players[i] = Data.players[i+1];
						Data.players[i+1] = aux;
					}
				}
			}
			var posicaoEmpate:int=-1;
			for (i=0;i<Data.players.length;i++){
				if (posicaoEmpate==-1 || Data.players[i].posicaoAtual!=Data.players[posicaoEmpate].posicaoAtual){
					posicaoEmpate=i;
				}
				switch (i){
					case 0:
						posicao1.gotoAndStop(posicaoEmpate+1);
						nome1.text=Data.players[i].nome;
						posicao1.alpha = 1;
					break;
					case 1:
						posicao2.gotoAndStop(posicaoEmpate+1);
						nome2.text=Data.players[i].nome;
						posicao2.alpha = 1;
					break;
					case 2:
						posicao3..gotoAndStop(posicaoEmpate+1);
						nome3.text=Data.players[i].nome;
						posicao3.alpha = 1;
					break;
					case 3:
						posicao4..gotoAndStop(posicaoEmpate+1);
						nome4.text=Data.players[i].nome;
						posicao4.alpha = 1;
					break;
				}
			}
		}
	}
	
}
