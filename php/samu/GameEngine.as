package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;

	public class GameEngine extends MovieClip
	{
		private var playerTurn:int;
		private var idDelay:int;
		private var pin:MovieClip;
		private var roleta:Roleta;
		public function GameEngine(){
			Data.scenario = new Scenario();
			addChild(Data.scenario);
			//Gerar quadrados
			addCasas();
			addJogadores();
			verificaSobreposicao();
			pin = new mcPin();
			Data.scenario.addChild(pin);
			//Randomizar quem começa a jogar
			playerTurn = Math.random() * Data.players.length;
			if (playerTurn>=Data.players.length){
				playerTurn = Data.players.length-1;
			}
			Data.playerAtual = Data.players[playerTurn];
			movePin();
			this.addEventListener(Event.ENTER_FRAME, GameEngineEnterFrame);
			SoundEngine.tocarMusica("Tabuleiro");
			AbreRoleta();
		}
		public function GameEngineEnterFrame(e:Event){
			Data.scenario.x=512-Data.playerAtual.x;
			if (Data.scenario.x>0){
				Data.scenario.x=0;
			} else if (Data.scenario.x<-256){
				Data.scenario.x=-256;
			}
			Data.scenario.y=384-Data.playerAtual.y;
			if (Data.scenario.y>0){
				Data.scenario.y=0;
			} else if (Data.scenario.y<-512){
				Data.scenario.y=-512;
			}
			movePin();
			if (Data.playerAtual.movendo){
				var deltaX:Number = Data.playerAtual.x - Data.squares[Data.playerAtual.posicaoAtual].x;
				var deltaY:Number = Data.playerAtual.y - Data.squares[Data.playerAtual.posicaoAtual].y;
				var hipo:Number = Math.sqrt(deltaX*deltaX + deltaY*deltaY);
				if (hipo < 5){
					Data.playerAtual.x = Data.squares[Data.playerAtual.posicaoAtual].x;
					Data.playerAtual.y = Data.squares[Data.playerAtual.posicaoAtual].y;
					if (Data.playerAtual.posicaoAtual==Data.squares.length-1 || Data.playerAtual.posicaoAtual==Data.playerAtual.novaPosicao){
						Data.playerAtual.movendo = false;
						EntrarNaCasa();
						verificaSobreposicao();
					} else if (Data.playerAtual.posicaoAtual<Data.playerAtual.novaPosicao){
						Data.playerAtual.posicaoAtual++;
					} else {
						Data.playerAtual.posicaoAtual--;
					}
				}
				else
				{
					Data.playerAtual.girarAmbulancia(Math.atan2(deltaY,deltaX));
					Data.playerAtual.x -=  deltaX / hipo * 5;
					Data.playerAtual.y -=  deltaY / hipo * 5;
				}
			}
			if (Data.closeMiniGame){
				Data.closeMiniGame=false;
				removeChild(Data.gameScreen);
				if (Data.playerWin){
					AbreRoleta();
				} else {
					passaVez();
				}
			}
			if (Data.closeAdvise){
				Data.closeAdvise=false;
				removeChild(Data.orangeHouses);
				if (Data.playerAtual.novaPosicao!=Data.playerAtual.posicaoAtual){
					Data.playerAtual.iniciarMovimento();
				} else {
					passaVez();
				}
			}
			if (Data.closeQuestion){
				Data.closeQuestion=false;
				removeChild(Data.questions);
			}
		}
		private function passaVez(){
			var fim:Boolean = false;
			if (Data.playerAtual.jogadas>0){
				Data.playerAtual.jogadas--;
				fim=true;
			}
			while (!fim){
				playerTurn++;
				if (playerTurn>=Data.players.length){
					playerTurn=0;
				}
				Data.playerAtual.jogouMinigame=false;
				Data.playerAtual=Data.players[playerTurn];
				if (Data.playerAtual.jogadas<0){
					Data.playerAtual.jogadas++;
				} else if (Data.playerAtual.proximoMovimento>0){
					Data.playerAtual.novaPosicao += int(Data.playerAtual.proximoMovimento);
					Data.playerAtual.proximoMovimento=0;
					Data.playerAtual.movendo=true;
					Data.playerAtual.iniciarMovimento();
					fim=true;
				} else {
					AbreRoleta();
					fim=true;
				}
			}
		}
		private function movePin(){
			pin.x=Data.playerAtual.x;
			if (Data.playerAtual.sozinho){
				pin.y=Data.playerAtual.y-45;
			} else {
				pin.y=Data.playerAtual.y-22;
			}
			for (var i:int=0;i<Data.players.length;i++){
				if (Data.players[i]==Data.playerAtual){
					Data.players[i].pinpoint.play();
				} else {
					Data.players[i].pinpoint.stop();
				}
			}
		}
		private function AbreRoleta(){
			roleta=new Roleta();
			roleta.x=312;
			roleta.y=184;
			addChild(roleta);
			roleta.addEventListener("Parou",paraRoleta);
		}
		private function paraRoleta(e:Event){
			removeChild(roleta);
			roleta.removeEventListener("Parou",paraRoleta);
			if (roleta.resultado>0){
				Data.playerAtual.novaPosicao += roleta.resultado;
				Data.playerAtual.iniciarMovimento();
			} else {
				passaVez();
			}
		}
		private function EntrarNaCasa(){
			var positionMinigames:Array = new Array(3,6,12,16,19,24,27,32,37,43);
			var positionConsequencia:Array = new Array(4,8,13,15,20,22,26,34,40,44,47);
			var positionPergunta:Array = new Array(5,10,17,23,28,33,36,42);
			if (!Data.playerAtual.jogouMinigame && positionMinigames.indexOf(Data.playerAtual.posicaoAtual)!=-1){
				Data.playerAtual.finalizaMovimento();
				Data.playerAtual.jogouMinigame=true;
				Data.gameScreen = new GameScreen(Math.random()*11);
				addChild(Data.gameScreen);
			} else if (positionConsequencia.indexOf(Data.playerAtual.posicaoAtual)!=-1){
				Data.playerAtual.finalizaMovimento();
				Data.orangeHouses = new OrangeHouses();
				addChild(Data.orangeHouses);
			} else if (positionPergunta.indexOf(Data.playerAtual.posicaoAtual)!=-1 && Data.playerAtual.humano){				
				Data.playerAtual.finalizaMovimento();
				Data.questions = new Questions();
				addChild(Data.questions);				
			} else if (Data.playerAtual.posicaoAtual == 48){
				SoundEngine.StopSC1();
				Data.showResults = true;
			} else {
				Data.playerAtual.finalizaMovimento();
				idDelay = setTimeout(delayCasaBranca, 1000);
			}
		}
		private function delayCasaBranca(){
			clearTimeout(idDelay);
			passaVez();
		}
		private function ajustaSobreposicao(tipo:int,local:int){
			var i:int;
			var i2:int;
			switch (tipo){
				case 1:
					for (i=0;i<Data.players.length;i++){
						if (Data.players[i].posicaoAtual==local){
							Data.players[i].x=Data.squares[local].x;
							Data.players[i].y=Data.squares[local].y;
							Data.players[i].sozinho=true;
							Data.players[i].finalizaMovimento();
						}
					}
				break;
				case 2:
					i2=0;
					for (i=0;i<Data.players.length;i++){
						if (Data.players[i].posicaoAtual==local){
							i2++;
							if (i2==1){
								Data.players[i].x=Data.squares[local].x-22.5;
								Data.players[i].y=Data.squares[local].y-22.5;
							} else {
 								Data.players[i].x=Data.squares[local].x+22.5;
								Data.players[i].y=Data.squares[local].y+22.5;
							}
							Data.players[i].sozinho=false;
							Data.players[i].finalizaMovimento();
						}
					}
				break;
				case 3:
					i2=0;
					for (i=0;i<Data.players.length;i++){
						if (Data.players[i].posicaoAtual==local){
							i2++;
							if (i2==1){
								Data.players[i].x=Data.squares[local].x;
								Data.players[i].y=Data.squares[local].y-22.5;
							} else if (i2==2){
 								Data.players[i].x=Data.squares[local].x-22.5;
								Data.players[i].y=Data.squares[local].y+22.5;
							} else {
								Data.players[i].x=Data.squares[local].x+22.5;
								Data.players[i].y=Data.squares[local].y+22.5;
							}
							Data.players[i].sozinho=false;
							Data.players[i].finalizaMovimento();
						}
					}
				break;
				case 4:
					i2=0;
					for (i=0;i<Data.players.length;i++){
						i2++;
						if (i2==1){
							Data.players[i].x=Data.squares[local].x-22.5;
							Data.players[i].y=Data.squares[local].y-22.5;
						} else if (i2==2){
 							Data.players[i].x=Data.squares[local].x+22.5;
							Data.players[i].y=Data.squares[local].y-22.5;
						} else if (i2==3){
							Data.players[i].x=Data.squares[local].x-22.5;
							Data.players[i].y=Data.squares[local].y+22.5;
						} else {
							Data.players[i].x=Data.squares[local].x+22.5;
							Data.players[i].y=Data.squares[local].y+22.5;
						}
						Data.players[i].sozinho=false;
						Data.players[i].finalizaMovimento();
					}
				break;
			}
		}
		private function verificaSobreposicao(){
			for (var i:int=0;i<Data.players.length;i++){
				var tipo:int=0;
				for (var i2:int=0;i2<Data.players.length;i2++){
					if (Data.players[i].posicaoAtual==Data.players[i2].posicaoAtual){
						tipo++;
					}
				}
				ajustaSobreposicao(tipo,Data.players[i].posicaoAtual);
			}
		}
		private function addJogadores(){
			Data.players = new Array();
			var player:Player;
			if (Data.ppl1){
				player=new Player(true,1);
				player.nome=Data.player1Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			} else if (Data.bot1){
				player=new Player(false,1);
				player.nome=Data.player1Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			}
			if (Data.ppl2){
				player=new Player(true,2);
				player.nome=Data.player2Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			} else if (Data.bot2){
				player=new Player(false,2);
				player.nome=Data.player2Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			}
			if (Data.ppl3){
				player=new Player(true,3);
				player.nome=Data.player3Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			} else if (Data.bot3){
				player=new Player(false,3);
				player.nome=Data.player3Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			}
			if (Data.ppl4){
				player=new Player(true,4);
				player.nome=Data.player4Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			} else if (Data.bot4){
				player=new Player(false,4);
				player.nome=Data.player4Name;
				Data.scenario.addChild(player);
				Data.players.push(player);
			}
		}
		private function addCasas(){
			var square:Square;
			Data.squares = new Array();
			//Quadrado 1
			square = new Square();
			square.stop();
			square.x = 205;
			square.y = 170;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 2;
			square = new Square();
			square.stop();
			square.x = 350;
			square.y = 170;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 3;
			square = new Square();
			square.stop();
			square.x = 450;
			square.y = 175;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 4;
			square = new Square();
			square.stop();
			square.x = 530;
			square.y = 185;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 5;
			square = new Square();
			square.stop();
			square.x = 620;
			square.y = 190;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 6;
			square = new Square();
			square.stop();
			square.x = 715;
			square.y = 200;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 7;
			square = new Square();
			square.stop();
			square.x = 800;
			square.y = 205;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 8;
			square = new Square();
			square.stop();
			square.x = 885;
			square.y = 220;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 9;
			square = new Square();
			square.stop();
			square.x = 975;
			square.y = 240;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 10;
			square = new Square();
			square.stop();
			square.x = 1065;
			square.y = 275;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 11;
			square = new Square();
			square.stop();
			square.x = 1150;
			square.y = 365;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 12;
			square = new Square();
			square.stop();
			square.x = 1055;
			square.y = 445;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 13;
			square = new Square();
			square.stop();
			square.x = 960;
			square.y = 435;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 14;
			square = new Square();
			square.stop();
			square.x = 875;
			square.y = 410;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 15;
			square = new Square();
			square.stop();
			square.x = 790;
			square.y = 385;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 16;
			square = new Square();
			square.stop();
			square.x = 700;
			square.y = 365;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 17;
			square = new Square();
			square.stop();
			square.x = 615;
			square.y = 360;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 18;
			square = new Square();
			square.stop();
			square.x = 515;
			square.y = 355;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 19;
			square = new Square();
			square.stop();
			square.x = 410;
			square.y = 370;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 20;
			square = new Square();
			square.stop();
			square.x = 315;
			square.y = 400;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 21;
			square = new Square();
			square.stop();
			square.x = 225;
			square.y = 450;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 22;
			square = new Square();
			square.stop();
			square.x = 170;
			square.y = 525;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 23;
			square = new Square();
			square.stop();
			square.x = 165;
			square.y = 615;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 24;
			square = new Square();
			square.stop();
			square.x = 220;
			square.y = 680;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 25;
			square = new Square();
			square.stop();
			square.x = 305;
			square.y = 700;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 26;
			square = new Square();
			square.stop();
			square.x = 395;
			square.y = 665;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 27;
			square = new Square();
			square.stop();
			square.x = 500;
			square.y = 620;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 28;
			square = new Square();
			square.stop();
			square.x = 605;
			square.y = 570;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 29;
			square = new Square();
			square.stop();
			square.x = 710;
			square.y = 545;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 30;
			square = new Square();
			square.stop();
			square.x = 815;
			square.y = 540;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 31;
			square = new Square();
			square.stop();
			square.x = 915;
			square.y = 560;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 32;
			square = new Square();
			square.stop();
			square.x = 1010;
			square.y = 610;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 33;
			square = new Square();
			square.stop();
			square.x = 1080;
			square.y = 670;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 34;
			square = new Square();
			square.stop();
			square.x = 1115;
			square.y = 765;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 35;
			square = new Square();
			square.stop();
			square.x = 1045;
			square.y = 845;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 36;
			square = new Square();
			square.stop();
			square.x = 955;
			square.y = 850;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 37;
			square = new Square();
			square.stop();
			square.x = 855;
			square.y = 825;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 38;
			square = new Square();
			square.stop();
			square.x = 765;
			square.y = 790;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 39;
			square = new Square();
			square.stop();
			square.x = 675;
			square.y = 775;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 40;
			square = new Square();
			square.stop();
			square.x = 590;
			square.y = 785;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 41;
			square = new Square();
			square.stop();
			square.x = 505;
			square.y = 825;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 42;
			square = new Square();
			square.stop();
			square.x = 410;
			square.y = 900;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 43;
			square = new Square();
			square.stop();
			square.x = 415;
			square.y = 1025;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 44;
			square = new Square();
			square.stop();
			square.x = 550;
			square.y = 1050;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 45;
			square = new Square();
			square.stop();
			square.x = 640;
			square.y = 1050;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 46;
			square = new Square();
			square.stop();
			square.x = 730;
			square.y = 1055;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 47;
			square = new Square();
			square.stop();
			square.x = 810;
			square.y = 1060;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 48;
			square = new Square();
			square.stop();
			square.x = 905;
			square.y = 1070;
			Data.scenario.addChild(square);
			Data.squares.push(square);
			//Quadrado 49;
			square = new Square();
			square.stop();
			square.x = 1060;
			square.y = 1070;
			Data.scenario.addChild(square);
			Data.squares.push(square);
		}
	}
}