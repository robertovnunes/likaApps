package Minigames.CacaPalavra{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import Minigames.CacaPalavra.Letra;
	
	public class GameCacaPalavra extends MovieClip{
		private var letras:Array;
		private var palavras:Array;
		private var dicas:Array;
		private var sel1:Letra;
		private var palavrasFaltando:int;
		private var altura:int=12;
		private var largura:int=12;
		
		private var movimentoSeta:int;
		private var listaAlinY:int;
		public var vitoria:Boolean;
		public function GameCacaPalavra() {
			criaGrade();
			sorteiaPalavras();
			preencheVazio();
			adicionarEvents();
			relogio.setTime(90*1000);
			relogio.addEventListener("TempoZero",acabaTempo);
			movimentoSeta=0;
			listaAlinY=0;
			acima.addEventListener(MouseEvent.MOUSE_OVER,moveSetas);
			acima.addEventListener(MouseEvent.MOUSE_OUT,moveSetas);
			abaixo.addEventListener(MouseEvent.MOUSE_OVER,moveSetas);
			abaixo.addEventListener(MouseEvent.MOUSE_OUT,moveSetas);
			addEventListener(Event.ENTER_FRAME,loop);
			sel1 = null;
		}
		public function loop(e:Event){
			listaAlinY+=movimentoSeta;
			if (listaAlinY>0){
				listaAlinY=0;
				movimentoSeta=0;
			} if (listaAlinY<-65){
				listaAlinY=-65;
				movimentoSeta=0;
			} else {
				for (var i=0;i<dicas.length;i++){
					dicas[i].y+=movimentoSeta;
				}
			}
		}
		public function moveSetas(e:MouseEvent){
			if (e.type==MouseEvent.MOUSE_OUT){
				movimentoSeta=0;
			} else {
				if (e.currentTarget==acima){
					movimentoSeta=5;
				} else {
					movimentoSeta=-5;
				}
			}
		}
		public function acabaTempo(e:Event){
			vitoria=false;
			finalizarJogo();
		}
		public function finalizarJogo(){
			for (var i:int=0;i<letras.length;i++){
				letras[i].removeEventListener(MouseEvent.MOUSE_DOWN,letraClick);
				letras[i].removeEventListener(MouseEvent.MOUSE_MOVE,letraMove);
				letras[i].addEventListener(MouseEvent.MOUSE_UP,letraUp);
			}
			relogio.removeEventListener("TempoZero",acabaTempo);
			acima.removeEventListener(MouseEvent.MOUSE_OVER,moveSetas);
			acima.removeEventListener(MouseEvent.MOUSE_OUT,moveSetas);
			abaixo.removeEventListener(MouseEvent.MOUSE_OVER,moveSetas);
			abaixo.removeEventListener(MouseEvent.MOUSE_OUT,moveSetas);
			removeEventListener(Event.ENTER_FRAME,loop);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		private function letraClick(e:MouseEvent){
			var letra:Letra = Letra(e.currentTarget);
			SoundEngine.tocarEfeito(new somCPalavraClick());
			limparSelecao();
			sel1=letra;
			letra.gotoAndStop(2);
		}
		private function limparSelecao(){
			for (var i:int=0;i<largura;i++){
				for (var i2:int=0;i2<altura;i2++){
					var letra:Letra = letras[i*altura+i2];
					if (!letra.marcado){
						letra.gotoAndStop(1);
					}
				}
			}
		}
		private function letraMove(e:MouseEvent){
			var letra:Letra = Letra(e.currentTarget);
			if (sel1==null){
				limparSelecao();
				letra.gotoAndStop(2);
			} else {
				var i:int;
				limparSelecao();
				if (letra.x==sel1.x){
					for (i=0;i<letras.length;i++){
						if (!letras[i].marcado && letras[i].x==sel1.x && ((letras[i].y>=sel1.y && letras[i].y<=letra.y) || (letras[i].y<=sel1.y && letras[i].y>=letra.y))){
							letras[i].gotoAndStop(2);
						}
					}
				} else if (letra.y==sel1.y){
					for (i=0;i<letras.length;i++){
						if (!letras[i].marcado && letras[i].y==sel1.y && ((letras[i].x>=sel1.x && letras[i].x<=letra.x) || (letras[i].x<=sel1.x && letras[i].x>=letra.x))){
							letras[i].gotoAndStop(2);
						}
					}
				}
			}
		}
		private function adicionarEvents(){
			for (var i:int=0;i<largura;i++){
				for (var i2:int=0;i2<altura;i2++){
					var letra:Letra = letras[i*altura+i2];
					letra.addEventListener(MouseEvent.MOUSE_DOWN,letraClick);
					letra.addEventListener(MouseEvent.MOUSE_MOVE,letraMove);
					letra.addEventListener(MouseEvent.MOUSE_UP,letraUp);
				}
			}
		}
		private function letraUp(e:MouseEvent){
			var i:int;
			var palavra:String = "";
			var achou:Boolean = false;
			var letra:Letra = Letra(e.currentTarget);
			if (letra.x==sel1.x){
				for (i=0;i<letras.length;i++){
					if (letras[i].x==sel1.x && ((letras[i].y>=sel1.y && letras[i].y<=letra.y) || (letras[i].y<=sel1.y && letras[i].y>=letra.y))){
						palavra = palavra + letras[i].letra.currentLabel;
					}
				}
				for (i=0;i<palavras.length;i++){
					if (palavra==palavras[i]){
						dicas[i].ok.alpha=1;
						achou=true;
						break;
					}
				}
				if (achou){
					SoundEngine.tocarEfeito(new somCPalavraAcerto());
					for (i=0;i<letras.length;i++){
						if (letras[i].x==sel1.x && ((letras[i].y>=sel1.y && letras[i].y<=letra.y) || (letras[i].y<=sel1.y && letras[i].y>=letra.y))){
							letras[i].gotoAndStop(3);
							letras[i].marcado=true;
							letras[i].removeEventListener(MouseEvent.MOUSE_DOWN,letraClick);
							letras[i].removeEventListener(MouseEvent.MOUSE_MOVE,letraMove);
							letras[i].removeEventListener(MouseEvent.MOUSE_UP,letraMove);
						}
					}
					palavrasFaltando--;
				} else {
					SoundEngine.tocarEfeito(new somCPalavraErro());
				}
			} else if (letra.y==sel1.y){
				for (i=0;i<letras.length;i++){
					if (letras[i].y==sel1.y && ((letras[i].x>=sel1.x && letras[i].x<=letra.x) || (letras[i].x<=sel1.x && letras[i].x>=letra.x))){
						palavra = palavra + letras[i].letra.currentLabel;
					}
				}
				for (i=0;i<palavras.length;i++){
					if (palavra==palavras[i]){
						dicas[i].ok.alpha=1;
						achou=true;
						break;
					}
				}
				if (achou){
					SoundEngine.tocarEfeito(new somCPalavraAcerto());
					for (i=0;i<letras.length;i++){
						if (letras[i].y==sel1.y && ((letras[i].x>=sel1.x && letras[i].x<=letra.x) || (letras[i].x<=sel1.x && letras[i].x>=letra.x))){
							letras[i].gotoAndStop(3);
							letras[i].marcado=true;
							letras[i].removeEventListener(MouseEvent.CLICK,letraClick);
							letras[i].removeEventListener(MouseEvent.MOUSE_MOVE,letraMove);
						}
					}
					palavrasFaltando--;
				} else {
					SoundEngine.tocarEfeito(new somCPalavraErro());
				}
			}
			if (palavrasFaltando<=0){
				vitoria=true;
				finalizarJogo();
			}
			sel1=null;
			limparSelecao();
		}
		private function preencheVazio(){
			for (var i:int=0;i<largura;i++){
				for (var i2:int=0;i2<altura;i2++){
					var letra:Letra = letras[i*altura+i2];
					if (!letra.preenchido){
						var indice:int = Math.random()*26;
						letra.letra.gotoAndStop(indice);
					}
				}
			}
		}
		private function sorteiaPalavras(){
			var i:int;
			palavras = new Array();
			dicas = new Array();
			while (palavras.length<5){
				var r:int =  Math.random()*10;
				var palavra:String;
				switch (r){
					case 0:palavra="prontidao";break;
					case 1:palavra="ambulancia";break;
					case 2:palavra="atendente";break;
					case 3:palavra="cruz";break;
					case 4:palavra="hospital";break;
					case 5:palavra="sirene";break;
					case 6:palavra="socorrista";break;
					case 7:palavra="trote";break;
					case 8:palavra="coração";break;
					case 9:palavra="motolancia";break;
				}
				palavra=palavra.toUpperCase();
				var achou:Boolean = false;
				var temp:Letra
				for (i=0;i<palavras.length;i++){
					if (palavra==palavras[i]){
						achou=true;
						break;
					}
				}
				if (!achou){
					var posicionou:Boolean = false;
					var px:int = Math.random()*largura;
				 	var py:int = Math.random()*altura;
					while (!posicionou){
						var orientacao:Boolean = Math.random()>0.5;
						posicionou = true;
						px = Math.random()*largura;
				 		py = Math.random()*altura;
						if (orientacao){
							if (px+palavra.length<=largura){
								for (i=0;i<palavra.length;i++){
									temp = letras[(i+px)*altura+py];
									if (temp.preenchido){
										posicionou=false;
										break;
									}
								}
							} else {
								posicionou=false;
							}
						} else {
							if (py+palavra.length<=altura){
								for (i=0;i<palavra.length;i++){
									temp = letras[px*altura+(i+py)];
									if (temp.preenchido){
										posicionou=false;
										break;
									}
								}
							} else {
								posicionou=false;
							}
						}
					}
					if (orientacao){
						if (px+palavra.length<=largura){
							for (i=0;i<palavra.length;i++){
								temp = letras[(i+px)*altura+py];
								temp.preenchido = true;
								temp.letra.gotoAndStop(palavra.charAt(i));
							}
						}
					} else {
						if (py+palavra.length<=altura){
							for (i=0;i<palavra.length;i++){
								temp = letras[px*altura+(i+py)];
								temp.preenchido = true;
								temp.letra.gotoAndStop(palavra.charAt(i));
							}
						}
					}
					var mcdica:Dica = new Dica();
					mcdica.x=33;
					mcdica.y=palavras.length*67;
					mcdica.ok.alpha=0;
					mcdica.gotoAndStop(r+1);
					listaIcones.addChild(mcdica);
					dicas.push(mcdica);
					palavras.push(palavra);
				}
			}
			palavrasFaltando = palavras.length;
		}
		private function criaGrade(){
			letras = new Array();
			for (var i:int=0;i<largura;i++){
				for (var i2:int=0;i2<altura;i2++){
					var letra:Letra = new Letra();
					letra.stop();
					letra.x=i*27+272;
					letra.y=i2*27+10;
					addChild(letra);
					letras.push(letra);
				}
			}
		}
	}
}