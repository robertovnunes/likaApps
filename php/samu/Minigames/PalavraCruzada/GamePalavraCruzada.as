package Minigames.PalavraCruzada {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;

	public class GamePalavraCruzada extends MovieClip {
		private var casas:Array;
		private var selCasa:Casa=null;
		private var palavras:Array;
		private var imagens:Array;
		private var selPalavra:Array;
		private var selImagem:MovieClip;
		public var vitoria:Boolean;
		public function GamePalavraCruzada() {
			montar();
			relogio.setTime(90*1000);
			relogio.addEventListener("TempoZero",acabaTempo);
			Data.palco.addEventListener(KeyboardEvent.KEY_UP,teclar);
		}
		public function acabaTempo(e:Event){
			vitoria=false;
			finalizarJogo();
		}
		private function montar(){
			var r:int = Math.random()*2;
			casas = new Array();
			palavras = new Array();
			imagens = new Array();
			switch (r){
				case 0:cenario2();break;
				case 1:cenario2();break;
			}
		}
		private function cenario1(){
			adicionarPalavra(false,"motolancia",1,2);
			adicionarPalavra(true,"sirene",9,1);
			adicionarPalavra(true,"ambulancia",6,2);
			adicionarPalavra(false,"cruz",6,9);
			adicionarImagem(12,1,1);
			adicionarImagem(11,5,11);
			adicionarImagem(5,13,3);
			adicionarImagem(2,8,7);
		}
		private function cenario2(){
			adicionarPalavra(true,"coracao",14,4);
			adicionarPalavra(false,"atendente",1,9);
			adicionarPalavra(true,"placa",1,5);
			adicionarPalavra(true,"trote",9,5);
			adicionarPalavra(false,"hospital",8,7);
			adicionarImagem(13,0,15);
			adicionarImagem(0,11,4);
			adicionarImagem(0,1,2);
			adicionarImagem(8,1,14);
			adicionarImagem(4,5,9);
		}
		private function adicionarImagem(x:int,y:int,indice:int){
			var temp:Dica=new Dica();
			temp.mcok.gotoAndStop(0);
			temp.gotoAndStop(indice);
			temp.x=x*20+145;
			temp.y=y*20+15;
			imagens.push(temp);
			addChild(temp);
		}
		private function adicionarPalavra(vertical:Boolean,palavra:String,px:int,py:int){
			palavra=palavra.toUpperCase();
			var sequencia = new Array();
			for (var i:int=0;i<palavra.length;i++){
				var casa:Casa;
				if (vertical){
					casa = new Casa(px,py+i);//
				} else {
					casa = new Casa(px+i,py);
				}
				casa.conteudo=palavra.charAt(i);
				var achou:Boolean = false;
				for (var i2:int=0;i2<casas.length;i2++){
					if (casas[i2].px==casa.px && casas[i2].py==casa.py){
						achou=true;
						sequencia.push(casas[i2]);
						break;
					}
				}
				if (!achou){
					casa.addEventListener(MouseEvent.CLICK,clickCasa);
					casas.push(casa);
					sequencia.push(casa);
					gameLayer.addChild(casa);
				}
			}
			palavras.push(sequencia);
		}
		public function clickCasa(e:MouseEvent){
			if (selCasa!=null){
				selCasa.gotoAndStop(1);
			}
			var casa:Casa = Casa(e.currentTarget);
			casa.gotoAndStop(2);
			selCasa = casa;
			var sair:Boolean=false;
			for (var i:int=0;i<palavras.length;i++){
				for (var i2:int=0;i2<palavras[i].length;i2++){
					if (palavras[i][i2]==selCasa){
						selPalavra=palavras[i];
						selImagem=imagens[i];
						sair=true;
						break;
					}
				}
				if (sair) break;
			}
		}
		public function teclar(e:KeyboardEvent){
			var n:int = e.charCode;
			if (n>=97 && n<=122 && selCasa!=null){
				var c:String = String.fromCharCode(e.charCode).toUpperCase();
				if (!selCasa.travado){
					selCasa.letra.gotoAndStop(c);
					var marcar:Boolean=false;
					for (var i:int=0;i<selPalavra.length;i++){
						if (marcar && !selPalavra[i].travado){
							selCasa.gotoAndStop(1);
							selCasa=selPalavra[i];
							selCasa.gotoAndStop(2);
							break;
						}
						if (selPalavra[i]==selCasa){
							marcar=true;
						}
					}
					verificaPalavra();
				}
			}
		}
		private function verificaPalavra(){
			var situacao:int=1;//0 - incompleto, 1 - certo, 2 - errado
			for (var i:int=0;i<selPalavra.length;i++){
				if (selPalavra[i].letra.currentLabel=="vazio"){
					situacao=0;
					break;
				} else if (selPalavra[i].conteudo!=selPalavra[i].letra.currentLabel){
					situacao=2;
				}
			}
			selImagem.mcok.gotoAndStop(situacao+1);
			switch (situacao){
				case 0:
					SoundEngine.tocarEfeito(new somPCruzadaLetra());
				break;
				case 1:
					SoundEngine.tocarEfeito(new somDragDropCerto());
					for (var i:int=0;i<selPalavra.length;i++){
						selPalavra[i].travado=true;
					}
					verificaFim();
				break;
				case 2:
					SoundEngine.tocarEfeito(new somDragDropErrado());
					for (var i:int=0;i<selPalavra.length;i++){
						if (!selPalavra[i].travado){
							selPalavra[i].letra.gotoAndStop("vazio");
						}
					}
					selCasa.gotoAndStop(1);
					selCasa=selPalavra[0];
					selCasa.gotoAndStop(2);
				break;
			}
			
		}
		private function verificaFim(){
			var terminou = true;
			for (var i:int=0;i<casas.length;i++){
				if (casas[i].conteudo!=casas[i].letra.currentLabel){
					terminou=false;
					break;
				}
			}
			if (terminou){
				vitoria=true;
				finalizarJogo();
			}
		}
		public function finalizarJogo(){
			for (var i:int=0;i<casas.length;i++){
				casas[i].removeEventListener(MouseEvent.CLICK,clickCasa);
			}
			Data.palco.removeEventListener(KeyboardEvent.KEY_UP,teclar);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
	}
}