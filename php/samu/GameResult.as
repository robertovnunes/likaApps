package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class GameResult extends MovieClip
	{
		private var idInterval:Number;
		var valorMaximo:Number = 9;
		var valorMinimo:Number = 0;
		var resultado:int;
		var som:Boolean = false;
		public function GameResult()
		{	
			this.x = -200;
			this.y = -200;
			resultado = Math.random() * (valorMaximo - valorMinimo) + valorMinimo;
			this.addEventListener(Event.ENTER_FRAME, GameResultEnterFrame);
		}
		private function selecionaTirinha(){
			switch (resultado) {
				case 0:this.tirinhas.gotoAndStop(1);break;
				case 1:this.tirinhas.gotoAndStop(2);break;
				case 2:this.tirinhas.gotoAndStop(3);break;
				case 3:this.tirinhas.gotoAndStop(4);break;
				case 4:this.tirinhas.gotoAndStop(5);break;
				case 5:this.tirinhas.gotoAndStop(6);break;
				case 6:this.tirinhas.gotoAndStop(8);break;
				case 7:this.tirinhas.gotoAndStop(8);break;
				case 8:this.tirinhas.gotoAndStop(9);break;
				case 9:this.tirinhas.gotoAndStop(9);break;
			}
		}
		private function ReproduzirVoz(){
			switch(this.tirinhas.currentFrame){
				case 1:SoundEngine.ReproduzirFala("VozTirinha1");som = true;break;
				case 2:SoundEngine.ReproduzirFala("VozTirinha2");som = true;break;
				case 3:SoundEngine.ReproduzirFala("VozTirinha3");som = true;break;
				case 4:SoundEngine.ReproduzirFala("VozTirinha4");som = true;break;
				case 5:SoundEngine.ReproduzirFala("VozTirinha5");som = true;break;
				case 6:SoundEngine.ReproduzirFala("VozTirinha6");som = true;break;
				case 7:SoundEngine.ReproduzirFala("VozTirinha8");som = true;break;
				case 8:SoundEngine.ReproduzirFala("VozTirinha8");som = true;break;
				case 9:SoundEngine.ReproduzirFala("VozTirinha9");som = true;break;					
			}
		}
		public function GameResultEnterFrame(e:Event){
			if (currentFrame==1){
				SoundEngine.tocarEfeito(new somAbreRoleta());
			} else if (currentFrame==10){
				if (Data.playerWin){
					SoundEngine.tocarEfeito(new somAplauso());
				}
				this.addEventListener(MouseEvent.CLICK,Advance);
			} else if (currentFrame==11){
				stop();
				playerName.text=Data.playerAtual.nome;
				if (Data.playerWin){
					playerCondition.text="Parabéns, você conseguiu!!!";
					txtDica.text="Como recompensa, você liberou uma tirinha e poderá jogar a roleta novamente.";
				} else {
					playerCondition.text="Que pena, não foi dessa vez...";
					txtDica.text="Mas não desanime, continue tentando que você conseguirá.";
				}
			} else if (currentFrame==22 && Data.playerWin && Data.playerAtual.humano){
				this.gotoAndPlay(33);
				selecionaTirinha();
			}else if (currentFrame==32){
				this.removeEventListener(Event.ENTER_FRAME, GameResultEnterFrame);
				var evt:Event = new Event("Fechar");
				dispatchEvent(evt);
			}else if (currentFrame==33 && Data.playerWin){
			
			
			}else if (currentFrame==39 && Data.playerWin){
				selecionaTirinha();
				stop();				
				this.addEventListener(MouseEvent.CLICK,Advance);
				if(!som)ReproduzirVoz();
			}else if (currentFrame==49 && Data.playerWin){
				this.removeEventListener(Event.ENTER_FRAME, GameResultEnterFrame);
				var evt:Event = new Event("Fechar");
				dispatchEvent(evt);
			}
		}
		public function Advance(me:MouseEvent){
			this.removeEventListener(MouseEvent.CLICK,Advance);
			SoundEngine.tocarEfeito(new somFechaRoleta());
			play();
		}
	}
}