package  {
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.events.Event;
	
	public class SoundEngine {
		static private var mouseClick:Sound = new Sound(new URLRequest("Sound/Menu/mouseclick.mp3"));
		//musicas
		static private var menuSound:Sound = new Sound(new URLRequest("Sound/Menu/WelcomeMrMr.mp3"));
		static private var gameSound:Sound = new Sound(new URLRequest("Sound/Menu/GrassClassicTripping.mp3"));
		//musicas dos minigames
		static private var forca:Sound = new Sound(new URLRequest("Sound/Minigames/Freedom.mp3"));
		static private var dragndrop:Sound = new Sound(new URLRequest("Sound/Minigames/SoftMachine.mp3"));
		static private var unblock:Sound = new Sound(new URLRequest("Sound/Minigames/TheBlock.mp3"));
		static private var memoria:Sound = new Sound(new URLRequest("Sound/Minigames/Vivaldino.mp3"));
		static private var cacapalavras:Sound = new Sound(new URLRequest("Sound/Minigames/MilesHigh.mp3"));
		static private var moto:Sound = new Sound(new URLRequest("Sound/Minigames/NorteBurguerBlues.mp3"));
		static private var SeteErros:Sound = new Sound(new URLRequest("Sound/Minigames/SeteErros.mp3"));
		static private var caminho:Sound = new Sound(new URLRequest("Sound/Minigames/BGLeFunk.mp3"));
		static private var helicoptero:Sound = new Sound(new URLRequest("Sound/Minigames/HelloCopter.mp3"));
		static private var palavracruzada:Sound = new Sound(new URLRequest("Sound/Minigames/ATVDeNoe.mp3"));
		static private var bejeweled:Sound = new Sound(new URLRequest("Sound/Minigames/OReinoDoJoinhas.mp3"));
		//Explicação dos minigames
		static private var vozcacapalavras:Sound = new Sound(new URLRequest("Sound/Voz/cacapalavras.mp3"));
		static private var vozforca:Sound = new Sound(new URLRequest("Sound/Voz/forca.mp3"));
		static private var vozjoias:Sound = new Sound(new URLRequest("Sound/Voz/joias.mp3"));
		static private var vozmemoria:Sound = new Sound(new URLRequest("Sound/Voz/memoria.mp3"));
		static private var vozpalavracruzada:Sound = new Sound(new URLRequest("Sound/Voz/palavracruzada.mp3"));
		static private var vozseteerros:Sound = new Sound(new URLRequest("Sound/Voz/seteerros.mp3"));
		static private var vozdragndrop:Sound = new Sound(new URLRequest("Sound/Voz/dragndrop.mp3"));
		static private var vozunblock:Sound = new Sound(new URLRequest("Sound/Voz/unblock.mp3"));
		static private var vozsamuacaminho:Sound = new Sound(new URLRequest("Sound/Voz/samuacaminho.mp3"));
		static private var vozhelicoptero:Sound = new Sound(new URLRequest("Sound/Voz/helicoptero.mp3"));
		static private var vozurgencia:Sound = new Sound(new URLRequest("Sound/Voz/urgencia.mp3"));
		//Explicações na abertura
		static private var vozabertura1:Sound = new Sound(new URLRequest("Sound/Voz/abertura1.mp3"));
		static private var vozabertura2:Sound = new Sound(new URLRequest("Sound/Voz/abertura2.mp3"));
		static private var vozabertura3:Sound = new Sound(new URLRequest("Sound/Voz/abertura3.mp3"));
		static private var vozabertura4:Sound = new Sound(new URLRequest("Sound/Voz/abertura4.mp3"));
		
		//Voz das Tirinhas
		static private var vt1:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha1.mp3"));
		static private var vt2:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha2.mp3"));
		static private var vt3:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha3.mp3"));
		static private var vt4:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha4.mp3"));
		static private var vt5:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha5.mp3"));
		static private var vt6:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha6.mp3"));
		static private var vt8:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha8.mp3"));
		static private var vt9:Sound = new Sound(new URLRequest("Sound/Tirinhas/Tirinha9.mp3"));
		
		//Voz das casas de consequencia
		static private var vc1:Sound = new Sound(new URLRequest("Sound/Consequencias/AtendeuTrote.mp3"));
		static private var vc2:Sound = new Sound(new URLRequest("Sound/Consequencias/ChamadoEmergencia.mp3"));
		static private var vc3:Sound = new Sound(new URLRequest("Sound/Consequencias/ErrouRua.mp3"));
		static private var vc4:Sound = new Sound(new URLRequest("Sound/Consequencias/SemGasolina.mp3"));
		static private var vc5:Sound = new Sound(new URLRequest("Sound/Consequencias/PneuFurado.mp3"));
		static private var vc6:Sound = new Sound(new URLRequest("Sound/Consequencias/SinalAmarelo.mp3"));
		static private var vc7:Sound = new Sound(new URLRequest("Sound/Consequencias/SinalVermelho.mp3"));
		static private var vc8:Sound = new Sound(new URLRequest("Sound/Consequencias/SinalVerde.mp3"));
		
		static private var soundChannel1:SoundChannel = new SoundChannel();//Trilha principal
		static private var soundChannel2:SoundChannel = new SoundChannel();//Efeitos especiais como click
		static public var volumeChannel1:int=4;
		static public var volumeChannel2:int=4;
		static public function volumeMusica(volume:int){
			volumeChannel1 = volume;
			soundChannel1.soundTransform = new SoundTransform(volumeChannel1/4,0);
		}
		static public function volumeEfeitos(volume:int){
			volumeChannel2 = volume;
			soundChannel2.soundTransform = new SoundTransform(volumeChannel2/4,0);
		}
		static public function tocarMusica(nomeMusica:String){
			soundChannel1.stop();
			try {
				switch (nomeMusica){
					case "Menu":soundChannel1 = menuSound.play(0,100);break;
					case "Tabuleiro":soundChannel1 = gameSound.play(0,100);break;
					case "Forca":soundChannel1 = forca.play(0,100);break;
					case "DragDrop":soundChannel1 = dragndrop.play(0,100);break;
					case "Unblock":soundChannel1 = unblock.play(0,100);break;
					case "Memoria":soundChannel1 = memoria.play(0,100);break;
					case "CacaPalavra":soundChannel1 = cacapalavras.play(0,100);break;
					case "Urgencia":soundChannel1 = moto.play(0,100);break;
					case "SeteErros":soundChannel1 = SeteErros.play(0,100);break;
					case "Caminho":soundChannel1 = caminho.play(0,100);break;
					case "Helicoptero":soundChannel1 = helicoptero.play(0,100);break;
					case "PalavraCruzada":soundChannel1 = palavracruzada.play(0,100);break;
					case "Bejeweled":soundChannel1 = bejeweled.play(0,100);break;
				}
				soundChannel1.soundTransform = new SoundTransform(volumeChannel1/4,0);
			} catch(e:Error) {
				trace("Erro na musica "+nomeMusica);
			}
		}
		static public function ReproduzirFala(nomeFala:String){
			soundChannel2.stop();
			try{
				soundChannel2.soundTransform = new SoundTransform(volumeChannel2/4,0);
				switch(nomeFala){					
					case "VozCP":soundChannel2 = vozcacapalavras.play(0,1);break;
					case "VozForca":soundChannel2 = vozforca.play(0,1);break;
					case "VozJoias":soundChannel2 = vozjoias.play(0,1);break;
					case "VozMemoria":soundChannel2 = vozmemoria.play(0,1);break;
					case "VozPC":soundChannel2 = vozpalavracruzada.play(0,1);break;
					case "VozErros":soundChannel2 = vozseteerros.play(0,1);break;
					case "VozDragndrop":soundChannel2 = vozseteerros.play(0,1);break;
					case "VozUnblock":soundChannel2 = vozunblock.play(0,1);break;
					case "VozSamuacaminho":soundChannel2 = vozsamuacaminho.play(0,1);break
					case "VozHelicoptero":soundChannel2 = vozhelicoptero.play(0,1);break;
					case "VozUrgencia":soundChannel2 = vozurgencia.play(0,1);break;
					case "VozAbertura1":soundChannel2 = vozabertura1.play(0,1);break
					case "VozAbertura2":soundChannel2 = vozabertura2.play(0,1);break;
					case "VozAbertura3":soundChannel2 = vozabertura3.play(0,1);break;
					case "VozAbertura4":soundChannel2 = vozabertura4.play(0,1);break;					
					case "VozTirinha1":soundChannel2 = vt1.play(0,1);break
					case "VozTirinha2":soundChannel2 = vt2.play(0,1);break;
					case "VozTirinha3":soundChannel2 = vt3.play(0,1);break;
					case "VozTirinha4":soundChannel2 = vt4.play(0,1);break;
					case "VozTirinha5":soundChannel2 = vt5.play(0,1);break;
					case "VozTirinha6":soundChannel2 = vt6.play(0,1);break;
					case "VozTirinha8":soundChannel2 = vt8.play(0,1);break;
					case "VozTirinha9":soundChannel2 = vt9.play(0,1);break;
					
					case "AtendeuTrote":soundChannel2 = vc1.play(0,1);break;
					case "ChamadoEmergencia":soundChannel2 = vc2.play(0,1);break;
					case "ErrouRua":soundChannel2 = vc3.play(0,1);break;
					case "FicouGasolina":soundChannel2 = vc4.play(0,1);break;
					case "PneuFurado":soundChannel2 = vc5.play(0,1);break;
					case "SinalAmarelo":soundChannel2 = vc6.play(0,1);break;
					case "SinalVermelho":soundChannel2 = vc7.play(0,1);break;
					case "SinalVerde":soundChannel2 = vc8.play(0,1);break;
					
				}
				if (volumeChannel1>0.25){
					soundChannel1.soundTransform = new SoundTransform(0.25,0);
					soundChannel2.addEventListener(Event.SOUND_COMPLETE, retornaVolumeMusica);
				}
			}catch(e:Error){
				trace("Erro na voz "+nomeFala);
			}
		}
		static public function retornaVolumeMusica(e:Event){
			soundChannel2.removeEventListener(Event.SOUND_COMPLETE, retornaVolumeMusica);
			soundChannel1.soundTransform = new SoundTransform(volumeChannel1/4,0);
		}
		static public function StopSC1(){
			soundChannel1.stop();
		}
		static public function tocarEfeito(som:Sound){
			soundChannel2.stop();
			soundChannel2 = som.play(0,1);
			soundChannel2.soundTransform = new SoundTransform(volumeChannel2/4,0);
		}
		static public function loopEfeito(som:Sound){
			soundChannel2.stop();
			soundChannel2 = som.play(0,100);
			soundChannel2.soundTransform = new SoundTransform(volumeChannel2/4,0);
		}
		static public function pararLoopEfeito(){
			soundChannel2.stop();
		}
	}
	
}
