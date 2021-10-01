package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import Minigames.Forca.GameForca;
	import Minigames.DragDrop.GameDragDrop;
	import Minigames.Unblock.GameUnblock;
	import Minigames.Memoria.GameMemoria;
	import Minigames.CacaPalavra.GameCacaPalavra;
	import Minigames.Urgencia.GameUrgencia;
	import Minigames.SeteErros.GameSeteErros;
	import Minigames.Caminho.GameCaminho;
	import Minigames.Helicoptero.GameHelicoptero;
	import Minigames.PalavraCruzada.GamePalavraCruzada;
	import Minigames.Bejeweled.GameBejeweled;
	
	public class GameScreen extends MovieClip
	{
		private var minigame:MovieClip;
		private var fundoPreto:MovieClip;
		private var resultado:MovieClip;
		private var instrucao:MovieClip;
		private var id:int;
		public var win:Boolean;
		public var score:int;
		public function GameScreen(idMiniGame:int){
			this.x = 200;
			this.y = 200;
			if (Data.playerAtual.humano){
				id=idMiniGame;
				instrucao=new GameInstrucao(idMiniGame);
				instrucao.addEventListener("Fechar",Entrar);
				addChild(instrucao);
			} else {
				Data.playerWin = Math.random()>0.5
				resultado = new GameResult();
				resultado.addEventListener("Fechar",Sair);
				addChild(resultado);
			}
		}
		public function GameOver(e:Event){
			SoundEngine.tocarMusica("Tabuleiro");
			minigame.removeEventListener("GameOver",GameOver);
			Data.playerWin = minigame.vitoria;
			addEventListener(Event.ENTER_FRAME,saidaMinigame);
		}
		public function entradaMinigame(e:Event){
			minigame.scaleX+=0.1;
			minigame.scaleY+=0.1;
			minigame.x-=30;
			minigame.y-=16.9;
			if (minigame.scaleX>=1){
				removeEventListener(Event.ENTER_FRAME,entradaMinigame);
			}
		}
		public function saidaMinigame(e:Event){
			minigame.scaleX-=0.1;
			minigame.scaleY-=0.1;
			minigame.x+=30;
			minigame.y+=16.9;
			if (minigame.scaleX<=0.1){
				removeEventListener(Event.ENTER_FRAME,saidaMinigame);
				resultado = new GameResult();
				resultado.addEventListener("Fechar",Sair);
				addChild(resultado);
				removeChild(minigame);
			}
		}
		public function Entrar(e:Event){
			instrucao.removeEventListener("Fechar",Entrar);
			//id = 4;
			switch (id){
				case 0:
					minigame = new GameForca();
					SoundEngine.tocarMusica("Forca");
				break;
				case 1:
					minigame = new GameDragDrop();
					SoundEngine.tocarMusica("DragDrop");
				break;
				case 2:
					minigame = new GameUnblock();
					SoundEngine.tocarMusica("Unblock");
				break;
				case 3:
					minigame = new GameMemoria();
					SoundEngine.tocarMusica("Memoria");
				break;
				case 4:
					minigame = new GameCacaPalavra();
					SoundEngine.tocarMusica("CacaPalavra");
				break;
				case 5:
					minigame = new GameUrgencia();
					SoundEngine.tocarMusica("Urgencia");
				break;
				case 6:
					minigame = new GameSeteErros();
					SoundEngine.tocarMusica("SeteErros");
				break;
				case 7:
					minigame = new GameCaminho();
					SoundEngine.tocarMusica("Caminho");
				break;
				case 8:
					minigame = new GameHelicoptero();
					SoundEngine.tocarMusica("Helicoptero");
				break;
				case 9:
					minigame = new GamePalavraCruzada();
					SoundEngine.tocarMusica("PalavraCruzada");
				break;
				case 10:
					minigame = new GameBejeweled();
					SoundEngine.tocarMusica("Bejeweled");
				break;
			}
			minigame.scaleX=0.1;
			minigame.scaleY=0.1;
			minigame.x=270;
			minigame.y=152.1;
			addEventListener(Event.ENTER_FRAME,entradaMinigame);
			minigame.addEventListener("GameOver",GameOver);
			addChild(minigame);
			stage.focus = null;
			removeChild(instrucao);
		}
		public function Sair(e:Event){
			resultado.removeEventListener("Fechar",Sair);
			Data.closeMiniGame = true;
		}
	}
}