package Minigames.Bejeweled{
	import flash.display.MovieClip;
	public class Casa extends MovieClip{
		public var acima:Casa;
		public var abaixo:Casa;
		public var esquerda:Casa;
		public var direita:Casa;
		public var pedra:Pedra;
		public function Casa(x:int,y:int){
			this.x=x;
			this.y=y;
			this.acima=null;
			this.abaixo=null;
			this.esquerda=null;
			this.direita=null;
			this.pedra=null;
			stop();
		}
		public function ligarDireita(vizinho:Casa){
			this.direita=vizinho;
			vizinho.esquerda=this;
		}
		public function ligarAbaixo(vizinho:Casa){
			this.abaixo=vizinho;
			vizinho.acima=this;
		}
		public function primeiraSelecao(){
			gotoAndStop(2);
			Dado.selCasa1=this;
		}
		public function segundaSelecao(){
			if (Dado.selCasa1.esquerda==this || Dado.selCasa1.direita==this || Dado.selCasa1.abaixo==this || Dado.selCasa1.acima==this){
				gotoAndStop(2);
				Dado.selCasa2=this;
				Dado.travado=true;
				pedra.trocar(Dado.selCasa1);
			} else {
				Dado.limparSelecao();
				primeiraSelecao();
			}
		}
		public function verificaSemelhanca(orientacao:int,tipo:int):Casa{
			var retorno:Casa=null;
			if (pedra!=null && pedra.tipo==tipo && pedra.situacao==0){
				switch (orientacao){
					case 0:
						if (acima!=null){
							retorno=acima.verificaSemelhanca(orientacao,tipo);
						}
					break;
					case 1:
						if (abaixo!=null){
							retorno=abaixo.verificaSemelhanca(orientacao,tipo);
						}
					break;
					case 2:
						if (esquerda!=null){
							retorno=esquerda.verificaSemelhanca(orientacao,tipo);
						}
					break;
					case 3:
						if (direita!=null){
							retorno=direita.verificaSemelhanca(orientacao,tipo);
						}
					break;
				}
				if (retorno==null){
					retorno=this;
				}
			}
			return retorno;
		}
		public function destroiSequencias(orientacao:int,tipo:int){
			switch (orientacao){
				case 0:
					if (acima!=null && acima.pedra!=null && acima.pedra.situacao==0 && acima.pedra.tipo==tipo){
						acima.pedra.destruir();
						acima.destroiSequencias(orientacao,tipo);
					}
				break;
				case 1:
					if (abaixo!=null && abaixo.pedra!=null && abaixo.pedra.situacao==0 && abaixo.pedra.tipo==tipo){
						abaixo.pedra.destruir();
						abaixo.destroiSequencias(orientacao,tipo);
					}
				break;
				case 2:
					if (esquerda!=null && esquerda.pedra!=null && esquerda.pedra.situacao==0 && esquerda.pedra.tipo==tipo){
						esquerda.pedra.destruir();
						esquerda.destroiSequencias(orientacao,tipo);
					}
				break;
				case 3:
					if (direita!=null && direita.pedra!=null && direita.pedra.situacao==0 && direita.pedra.tipo==tipo){
						direita.pedra.destruir();
						direita.destroiSequencias(orientacao,tipo);
					}
				break;
			}
		}
		public function verificaCombinacoes():Boolean{
			var limiteAcima:Casa = verificaSemelhanca(0,pedra.tipo);
			var limiteAbaixo:Casa = verificaSemelhanca(1,pedra.tipo);
			var limiteEsquerda:Casa = verificaSemelhanca(2,pedra.tipo);
			var limiteDireita:Casa = verificaSemelhanca(3,pedra.tipo);
			var retorno:Boolean = false;
			if (limiteAcima.y+80<=limiteAbaixo.y){
				Dado.pontuar(limiteAcima.x,(limiteAcima.y+limiteAbaixo.y)/2,(limiteAbaixo.y-limiteAcima.y)/40);
				destroiSequencias(0,pedra.tipo);
				destroiSequencias(1,pedra.tipo);
				pedra.destruir();
				retorno = true;
			}
			if (limiteEsquerda.x+80<=limiteDireita.x){
				Dado.pontuar((limiteEsquerda.x+limiteDireita.x)/2,limiteEsquerda.y,(limiteDireita.x-limiteEsquerda.x)/40);
				destroiSequencias(2,pedra.tipo);
				destroiSequencias(3,pedra.tipo);
				pedra.destruir();
				retorno = true;
			}
			if (retorno){
				Dado.limparSelecao();
			}
			return retorno;
		}
		public function update(){
			if (pedra==null && acima==null){
				pedra=new Pedra(this);
				Dado.mcPedras.addChild(pedra);
				Dado.travado=true;
			}
			if (pedra!=null){
				pedra.mover();
			}
		}
		public function adicionaPedra(pedra:Pedra){
			pedra.casa.pedra=null;
			this.pedra=pedra;
		}
	}
}