package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class OrangeHouses extends MovieClip
	{
		private var houseInfo:int = 0;
		private var lockFrames:Boolean = false;
		public function OrangeHouses()
		{
			lockFrames = false;
			this.gotoAndPlay(1);
			switch (Data.playerAtual.posicaoAtual){
				case 4:houseInfo = 1;break;
				case 8:houseInfo = 2;break;
				case 13:houseInfo = 3;break;
				case 15:houseInfo = 4;break;
				case 20:houseInfo = 5;break;
				case 22:houseInfo = 6;break;
				case 26:houseInfo = 7;break;
				case 34:houseInfo = 8;break;
				case 40:houseInfo = 9;break;
				case 44:houseInfo = 10;break;
				case 47:houseInfo = 11;break;
			}
			this.addEventListener(Event.ENTER_FRAME, OrangeHousesEnterFrame);
		}
		public function OrangeHousesEnterFrame(e:Event){
			if (lockFrames)this.gotoAndStop(currentFrame);
			if (!lockFrames)this.play();
			if (this.currentFrame==1){
				SoundEngine.tocarEfeito(new somAbreRoleta());
			} else if (this.currentFrame==9){
				lockFrames=true;
			} else if (this.currentFrame==10){
				if (houseInfo==1){
					this.gotoAndStop(11);
					SoundEngine.ReproduzirFala("SinalVerde");
				}else if (houseInfo==2){
					this.gotoAndStop(12);
					SoundEngine.ReproduzirFala("SinalVermelho");
				}else if (houseInfo==3){
					this.gotoAndStop(13);
					SoundEngine.ReproduzirFala("ErrouRua");
				}else if (houseInfo==4){
					this.gotoAndStop(14);
					SoundEngine.ReproduzirFala("ChamadoEmergencia");
				}else if (houseInfo==5){
					this.gotoAndStop(15);
					SoundEngine.ReproduzirFala("PneuFurado");
				}else if (houseInfo==6){
					this.gotoAndStop(16);
					SoundEngine.ReproduzirFala("SinalVerde");
				}else if (houseInfo==7){
					this.gotoAndStop(17);
					SoundEngine.ReproduzirFala("SinalAmarelo");
				}else if (houseInfo==8){
					this.gotoAndStop(18);
					SoundEngine.ReproduzirFala("SinalVerde");
				}else if (houseInfo==9){
					this.gotoAndStop(19);
					SoundEngine.ReproduzirFala("AtendeuTrote");
				}else if (houseInfo==10){
					this.gotoAndStop(20);
					SoundEngine.ReproduzirFala("SinalVerde");
				}else if (houseInfo==11){
					this.gotoAndStop(21);
					SoundEngine.ReproduzirFala("SemGasolina");
				}
				if (this.currentFrame>=11 && this.currentFrame<=22){
					this.addEventListener(MouseEvent.CLICK, Return);
				}
			}
			if (this.currentFrame==32){
				this.removeEventListener(Event.ENTER_FRAME, OrangeHousesEnterFrame);
				switch (houseInfo){
					case 1:avancar(2);break;
					case 2:ganhaRodadas(-1);break;
					case 3:avancar(-2);break;
					case 4:avancar(3);break;
					case 5:ganhaRodadas(-1);break;
					case 6:avancar(2);break;
					case 7:proximoMovimento(2);break;
					case 8:avancar(2);break;
					case 9:ganhaRodadas(-1);break;
					case 10:avancar(2);break;
					case 11:ganhaRodadas(-2);break;
				}
				Data.closeAdvise = true;
				stop();
			}
		}
		private function avancar(nCasas:int){
			Data.playerAtual.novaPosicao+=nCasas;
		}
		private function ganhaRodadas(nRodadas:int){
			Data.playerAtual.jogadas=nRodadas;
		}
		private function proximoMovimento(movimento:int){
			Data.playerAtual.proximoMovimento=movimento;
		}
		public function Return(me:MouseEvent){
			this.removeEventListener(MouseEvent.CLICK, Return);
			SoundEngine.tocarEfeito(new somFechaRoleta());
			lockFrames = false;
			this.gotoAndPlay(23);	
		}
	}
}