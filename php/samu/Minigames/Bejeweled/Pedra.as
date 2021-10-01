package Minigames.Bejeweled{
	import flash.display.MovieClip;
	import flash.media.Sound;
	public class Pedra extends MovieClip{
		var situacao:int;//0 -normal, 1- caindo, 2 - trocando, 3 -destrocando, 4 - destruindo
		var tempo:int;
		var vy:Number=0;
		var vx:Number=0;
		var casa:Casa;
		var pedTroca:Pedra;
		var tipo:int;
		public function Pedra(casa:Casa){
			this.x=casa.x;
			this.y=casa.y-40;
			this.vy=0;
			this.casa=casa;
			this.situacao=1;
			tipo = Math.random()*6+1;
			gotoAndStop(tipo);
		}
		public function mover(){
			switch (situacao){
				case 0:
					if (casa.abaixo!=null && casa.abaixo.pedra==null){
						situacao=1;
					}
				break;
				case 1:
					if (y<casa.y){
						vy+=1;
						y+=vy;
					}
					if (y>=casa.y){
						if (casa.abaixo!=null && casa.abaixo.pedra==null){
							casa.abaixo.adicionaPedra(this);
							casa=casa.abaixo;
						} else {
							y=casa.y;
							vy=0;
							situacao=0;
							casa.verificaCombinacoes();
						}
					}
				break;
				case 2:
					x+=vx;
					y+=vy;
					pedTroca.x-=vx;
					pedTroca.y-=vy;
					if (x==pedTroca.casa.x && y==pedTroca.casa.y){
						situacao=0;
						var desTrocando:Boolean=true;
						if (casa.verificaCombinacoes()){
							desTrocando=false;
						}
						if (pedTroca.casa.verificaCombinacoes()){
							desTrocando=false;
						}
						if (!desTrocando){
							vx=0;
							vy=0;
							pedTroca.vx=0;
							pedTroca.vy=0;
							var aux:Casa = casa;
							casa = pedTroca.casa;
							pedTroca.casa = aux;
						} else {
							SoundEngine.tocarEfeito(new somBjErro());
							situacao=3;
						}
					}
				break;
				case 3:
					x-=vx;
					y-=vy;
					pedTroca.x+=vx;
					pedTroca.y+=vy;
					if (x==casa.x && y==casa.y){		
						desTrocando=false;
						Dado.limparSelecao();
						casa.pedra=this;
						pedTroca.casa.pedra=pedTroca;
						situacao=0;
					}
				break;
				case 4:
					tempo++;
					if (tempo>=10){
						situacao=0;
						casa.pedra=null;
						Dado.mcPedras.removeChild(this);
					}
				break;
			} 
		}
		public function trocar(destino:Casa){
			pedTroca=destino.pedra;
			if (x>pedTroca.x){
				vx=-5;
			} else if (x<pedTroca.x){
				vx=5;
			} else {
				vx=0;
			}
			if (y>pedTroca.y){
				vy=-5;
			} else if (y<pedTroca.y){
				vy=5;
			} else {
				vy=0;
			}
			pedTroca.casa.pedra=this;
			casa.pedra=pedTroca;
			situacao=2;
		}
		public function destruir(){
			situacao=4;
			gotoAndStop(7);
			tempo=0;
		}
	}
}