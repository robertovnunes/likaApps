package Minigames.Caminho {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class GameCaminho extends MovieClip {
		public var vitoria:Boolean;
		private var ligacoes:Array;
		private var travado:Boolean;
		private var ambulancia:Ambulancia;
		public function GameCaminho() {
			travado=false;
			relogio.setTime(90*1000);
			addEventListener(Event.ENTER_FRAME,loop);
			criarLigacoes();
		}
		public function finalizarJogo(){
			for (var i:int=0;i<ligacoes.length;i++){
				ligacoes[i].removeEventListener(MouseEvent.CLICK,girarLigacao);
			}
			removeEventListener(Event.ENTER_FRAME,loop);
			var evt:Event = new Event("GameOver");
			dispatchEvent(evt);
		}
		public function loop(e:Event){
			if (travado){
				var destino:Ligacao=ambulancia.rota[ambulancia.posicao];
				if (ambulancia.x>destino.x){
					ambulancia.x-=5;
				}	if (ambulancia.x<destino.x){
					ambulancia.x+=5;
				}
				if (ambulancia.y>destino.y){
					ambulancia.y-=5;
				}	if (ambulancia.y<destino.y){
					ambulancia.y+=5;
				}
				if (ambulancia.x==destino.x && ambulancia.y==destino.y){
					ambulancia.posicao--;
					if (ambulancia.posicao<0){
						SoundEngine.pararLoopEfeito();
						vitoria = true;
						finalizarJogo();
					} else {
						var novoDestino:Ligacao=ambulancia.rota[ambulancia.posicao];
						if (destino.direita==novoDestino){
							ambulancia.gotoAndStop(1);
						} else if (destino.esquerda==novoDestino){
							ambulancia.gotoAndStop(2);
						} else if (destino.acima==novoDestino){
							ambulancia.gotoAndStop(3);
						} else if (destino.abaixo==novoDestino){
							ambulancia.gotoAndStop(4);
						} 
					}
				}
			} else if (relogio.tempo.time<=0){
				vitoria = false;
				finalizarJogo();
			}
		}
		public function girarLigacao(e:MouseEvent){
			if (!travado){
				SoundEngine.tocarEfeito(new somCaminhoGiro());
				var temp:Ligacao=Ligacao(e.target);
				temp.rotation+=90;
				if (temp.rotation>=360){
					temp.rotation=0;
				}
				andar();
			}
		}
		private function procurarSaida(ligacao:Ligacao):Array{
			var retorno:Array = null;
			var temp:Array;
			if (ligacao.tipo==5){
				ligacao.ligado=true;
				retorno=new Array();
				retorno.push(ligacao);
			} else if (!ligacao.ligado){
				ligacao.ligado=true;
				if (ligacao.ligacaoAbaixo()){
					temp = procurarSaida(ligacao.abaixo);
					if (temp!=null){
						retorno = temp;
					}
				}
				if (ligacao.ligacaoAcima()){
					temp = procurarSaida(ligacao.acima);
					if (temp!=null){
						retorno=temp;
					}
				}
				if (ligacao.ligacaoDireita()){
					temp = procurarSaida(ligacao.direita);
					if (temp!=null){
						retorno = temp;
					}
				}
				if (ligacao.ligacaoEsquerda()){
					temp = procurarSaida(ligacao.esquerda);
					if (temp!=null){
						retorno=temp;
					}
				}
				if (retorno!=null){
					retorno.push(ligacao);
				}
			}
			return retorno;
		}
		public function andar(){
			if (!travado){
				var i:int;
				for (i=0;i<ligacoes.length;i++){
					ligacoes[i].ligado=false;
				}
				var rota:Array = procurarSaida(ligacoes[0]);
				if (rota!=null){
					travado=true;
					ambulancia.rota=rota;
					ambulancia.posicao=rota.length-1;
					SoundEngine.loopEfeito(new somMovimentoAmbulancia());
				} else {
					SoundEngine.tocarEfeito(new som7ErrosErro());
				}
			}
		}
		public function criarLigacoes(){
			ligacoes = new Array();
			var i:int;
			for (i=0;i<8;i++){
				for (var i2:int=0;i2<8;i2++){
					var temp:Ligacao = new Ligacao();
					temp.x = i*40+160;
					temp.y = i2*40+30;
					ligacoes.push(temp);
					addChild(temp);
					if (i>0){
						temp.esquerda=ligacoes[(i-1)*8+i2];
						temp.esquerda.direita=temp;
					}
					if (i2>0){
						temp.acima=ligacoes[(i*8+i2-1)];
						temp.acima.abaixo=temp;
					}
				}
			}
			ligacoes[0].tipo=4;
			ligacoes[0].gotoAndStop(4);
			ligacoes[0].rotation=0;
			ligacoes[ligacoes.length-1].tipo=5;
			ligacoes[ligacoes.length-1].gotoAndStop(5);
			ligacoes[ligacoes.length-1].rotation=0;
			ambulancia = new Ambulancia(ligacoes[0]);
			addChild(ambulancia);
			for (i=1;i<ligacoes.length-1;i++){
				ligacoes[i].addEventListener(MouseEvent.CLICK,girarLigacao);
			}
		}
	}
}
