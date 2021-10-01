package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.system.fscommand;


	public class MainClass extends MovieClip
	{
		public function MainClass()
		{
			//fscommand ("fullscreen","true");
			fscommand ("allowscale", "false");
			this.addEventListener(Event.ENTER_FRAME, MainClassEnterFrame);
			if (Data.creditsOn) {
				Data.credits = new Credits();
				this.addChild(Data.credits);
			} else {
				if (Data.intro1On)
				{
					Data.intro1 = new Intro1();
					this.addChild(Data.intro1);
				} else {
					Data.splashScreen = new SplashScreen();
					this.addChild(Data.splashScreen);
					Data.splashScreen.playBtn.addEventListener(MouseEvent.CLICK, AdvanceGame);
				}
			}
		}
		public function AdvanceGame(me:MouseEvent)
		{
			this.removeChild(Data.splashScreen);
			Data.gameEngine = new GameEngine();
			this.addChild(Data.gameEngine);
			Data.hud = new GameTime();
			this.addChild(Data.hud);
		}
		public function MainClassEnterFrame(e:Event)
		{
			if (Data.openOptions){
				Data.configScreen = new Config();
				this.addChild(Data.configScreen);
				Data.openOptions = false;
			}
			if (Data.closeOptions){
				this.removeChild(Data.configScreen);
				Data.closeOptions = false;
			}
			if (Data.showInfografico){
				this.removeChild(Data.credits);
				this.removeEventListener(Event.ENTER_FRAME, Data.credits.CreditsEnterFrame);
				Data.infografico = new Infografico();
				this.addChild(Data.infografico);
				Data.showInfografico = false;
			}
			if (Data.showIntro1)
			{
				SoundEngine.tocarMusica("Menu");
				this.removeChild(Data.infografico);
				this.removeEventListener(Event.ENTER_FRAME, Data.infografico.InfograficoEnterFrame);
				if (Data.intro1On) {
					Data.intro1 = new Intro1();
					this.addChild(Data.intro1);
				} else {
					Data.splashScreen = new SplashScreen();
					this.addChild(Data.splashScreen);
				}
				Data.showIntro1 = false;
			}
			if (Data.showTutorial){
				if (Data.intro1On){
					this.removeChild(Data.intro1);
				}
				Data.MC_tutorial = new NewClassTutorial();
				this.addChild(Data.MC_tutorial);
				Data.showTutorial = false;
			}
			if (Data.showRealMenu){
				this.removeChild(Data.MC_tutorial);
				Data.tutorial = new Tutorial();
				this.addChild(Data.tutorial);
				Data.showRealMenu = false;
			}
			if (Data.showGameEngine)
			{
				Data.palco = this.stage;
				if (Data.tutorialOn){
					this.removeChild(Data.tutorial);
				}
				Data.gameEngine = new GameEngine();
				this.addChild(Data.gameEngine);
				Data.hud = new GameTime();
				this.addChild(Data.hud);
				Data.showGameEngine = false;
			}
			if (Data.showResults){
				if (Data.ppl1 || Data.bot1){
					Data.ppl1 = false;
					Data.bot1 = false;
				}
				if (Data.ppl2 || Data.bot2){
					Data.ppl2 = false;
					Data.bot2 = false;
				}
				if (Data.ppl3 || Data.bot3){
					Data.ppl3 = false;
					Data.bot3 = false;
				}
				if (Data.ppl4 || Data.bot4){
					Data.ppl4 = false;
					Data.bot4 = false;
				}
				Data.gameEngine.removeChild(Data.scenario);
				this.removeChild(Data.gameEngine);
				Data.gameEngine.removeEventListener(Event.ENTER_FRAME, Data.gameEngine.GameEngineEnterFrame);
				this.removeChild(Data.hud);
				Data.results = new Results();
				SoundEngine.tocarMusica("Menu");
				this.addChild(Data.results);
				Data.Reset();
				Data.showResults = false;
			}
			if (Data.backToSelection){
				this.removeChild(Data.results);
				Data.intro1 = new Intro1();
				this.addChild(Data.intro1);
				Data.backToSelection = false;
			}
		}
	}
}