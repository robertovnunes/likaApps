package  {
	import flash.display.DisplayObject;
	
	public class Data {
		static public var credits:Credits;// 1 - Tela de patrocinadores
		static public var infografico:Infografico;
		static public var intro1:Intro1;// 2 - Splashscreen
		static public var splashScreen:SplashScreen;// 3 - Menu posterior ao splashscreen
		static public var intro2:Intro2;// 5 - Tutorial
		static public var tutorial:Tutorial;// 4 - Seleção de players
		static public var gameEngine:GameEngine;// 7 - Game Engine
		static public var MC_tutorial:NewClassTutorial;// 3 - Tutorial
		static public var hud:GameTime;
		static public var scenario:Scenario;
		static public var configScreen:Config;
		static public var gameScreen:GameScreen;
		static public var questions:Questions;
		static public var results:Results;
		static public var orangeHouses:OrangeHouses;
		static public var palco:DisplayObject;
		static public var gameResult:GameResult;
		//Controle de exibição
		static public var creditsOn:Boolean = true;
		static public var intro1On:Boolean = true;
		static public var splashScreenOn:Boolean = true;
		static public var intro2On:Boolean = false;
		static public var tutorialOn:Boolean = true;
		//Controle do enter frame
		static public var showCredits:Boolean = false;
		static public var showInfografico:Boolean = false;
		static public var showIntro1:Boolean = false;
		static public var showSplashScreen:Boolean = false;
		static public var showSplashScreen2:Boolean = false;
		static public var showIntro2:Boolean = false;
		static public var showTutorial:Boolean = false;
		static public var showGameEngine:Boolean = false;
		static public var showResults:Boolean = false;
		static public var backToSelection:Boolean = false;
		static public var showRealMenu:Boolean = false;
		//Menu de opções JOAO PEDRO
		static public var openOptions:Boolean = false;
		static public var closeOptions:Boolean = false;
		
		//Variáveis do jogo
		//Jogadores
		static public var minigameScore:int = 0;
		static public var playerAtual:Player;
		static public var players:Array;
		static public var player1Name:String = new String();
		static public var player2Name:String = new String();
		static public var player3Name:String = new String();
		static public var player4Name:String = new String();
		static public var playerWalking:Boolean = false;
		//Novas variáveis de modo de jogo
		static public var ppl1:Boolean = false;
		static public var ppl2:Boolean = false;
		static public var ppl3:Boolean = false;
		static public var ppl4:Boolean = false;
		static public var bot1:Boolean = false;
		static public var bot2:Boolean = false;
		static public var bot3:Boolean = false;
		static public var bot4:Boolean = false;
		static public var bot1on:Boolean = false;
		static public var bot2on:Boolean = false;
		static public var bot3on:Boolean = false;
		static public var bot4on:Boolean = false;
		//Posição dos jogadores
		static public var player1Position:int = 1;
		static public var player2Position:int = 1;
		static public var player3Position:int = 1;
		static public var player4Position:int = 1;
		static public var player1FinalPosition:int = 0;
		static public var player2FinalPosition:int = 0;
		static public var player3FinalPosition:int = 0;
		static public var player4FinalPosition:int = 0;
		//Rodada dos jogadores
		static public var player1Round:Boolean = false;
		static public var player2Round:Boolean = false;
		static public var player3Round:Boolean = false;
		static public var player4Round:Boolean = false;
		static public var player1SS:int = 0;
		static public var player2SS:int = 0;
		static public var player3SS:int = 0;
		static public var player4SS:int = 0;
		static public var player1Debuff:Boolean = false;
		static public var player2Debuff:Boolean = false;
		static public var player3Debuff:Boolean = false;
		static public var player4Debuff:Boolean = false;
		//Variáveis do tabuleiro
		static public var squares:Array;
		static public var rolldiceResult:Number = 0;
		static public var launchGame:int = 0;
		static public var closeMiniGame:Boolean = false;
		static public var turns:int = 0;
		static public var closeAdvise:Boolean = false;
		static public var closeQuestion:Boolean = false;
		static public var closeRedAdvise:Boolean = false;
		static public var closeBotAdvise:Boolean = false;
		static public var closeMiniGameAdvise:Boolean = false;
		//Variáveis de rodada
		static public var playerWin:Boolean = false;
		static public var endMiniGame:Boolean = false;

		public function Data() {
			// constructor code
		}
		static public function Reset(){
		showCredits = false;
		showIntro1 = false;
		showSplashScreen = false;
		showIntro2 = false;
		showTutorial = false;
		showGameEngine = false;
		showResults = false;
		minigameScore = 0;
		player1Position = 1;
		player2Position = 1;
		player3Position = 1;
		player4Position = 1;
		player1FinalPosition = 0;
		player2FinalPosition = 0;
		player3FinalPosition = 0;
		player4FinalPosition = 0;
		player1SS = 0;
		player2SS = 0;
		player3SS = 0;
		player4SS = 0;
		player1Round = false;
		player2Round = false;
		player3Round = false;
		player4Round = false;
		player1Name = "";
		player2Name = "";
		player3Name = "";
		player4Name = "";
		turns = 0;
		//Novas variáveis de modo de jogo
		ppl1 = false;
		ppl2 = false;
		ppl3 = false;
		ppl4 = false;
		bot1 = false;
		bot2 = false;
		bot3 = false;
		bot4 = false;
		bot1on = false;
		bot2on = false;
		bot3on = false;
		bot4on = false;
		player1Debuff = false;
		player2Debuff = false;
		player3Debuff = false;
		player4Debuff = false;
		rolldiceResult = 0;
		launchGame = 0;
		playerWin = false;
		endMiniGame = false;
		}

	}
	
}
