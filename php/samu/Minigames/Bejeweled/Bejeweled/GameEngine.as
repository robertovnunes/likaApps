package{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	//import flash.globalization.DateTimeFormatter;

	public class GameEngine extends MovieClip{
		public function GameEngine(){
			stop();
			Dado.mcCasas=casas;
			Dado.mcPedras=pedras;
			Dado.palco=this;
			iniciar();
			addEventListener(Event.ENTER_FRAME,loopPrincipal);
		}
		function loopPrincipal(evt:Event){
			var i:int=0;
			for (i=0;i<Dado.casas.length;i++){
				Dado.casas[i].update();
			}
			for (i=Dado.aniPontos.length-1;i>=0;i--){
				Dado.aniPontos[i].update();
				if (Dado.aniPontos[i].apagar){
					removeChild(Dado.aniPontos[i]);
					Dado.aniPontos.splice(i,1);
				}
			}
			if (Dado.travado){
				var achou:Boolean=false;
				for (i=0;i<Dado.casas.length;i++){
					if (Dado.casas[i].pedra==null || Dado.casas[i].pedra.situacao!=0){
						achou=true;
						break;
					}
				}
				if (!achou){
					Dado.travado=false;
					Dado.combo=0;
				}
			}
			edPontos.text=Dado.pontos+"";
			var agora:Date=new Date();
			Dado.tempo.setTime(Dado.tempo.getTime()-agora.getTime()+Dado.ultimoTick.getTime());
			Dado.ultimoTick=agora;
			
			//var dtf:DateTimeFormatter = new DateTimeFormatter("en-US");
			//dtf.setDateTimePattern("mm:ssa");

			edTempo.text=Dado.tempo.getMinutes()+":"+Dado.tempo.getSeconds();
			if (Dado.tempo.getTime()<=0){
				iniciar();
			}
		}
		function clickCasa(evt:MouseEvent){
			if (!Dado.travado && evt.currentTarget as Casa){
				var casa:Casa = Casa(evt.currentTarget)
				if (Dado.selCasa1==null){
					casa.primeiraSelecao();
				} else {
					casa.segundaSelecao();
				}
			}
		}
		function iniciar(){
			Dado.limparSelecao();
			Dado.pontos=0;
			Dado.combo=0;
			Dado.ultimoTick=new Date();
			Dado.tempo=new Date();
			Dado.tempo.setTime(180000);
			var i:int=0;
			var i2:int=0;
			if (Dado.casas==null){
				Dado.aniPontos=new Array();
				Dado.casas=new Array();
				//criando casas
				for (i=0;i < 8; i++){
					for (i2=0;i2 < 8;i2++){
						Dado.casas.push(new Casa(i*40+20,i2*40+20));
					}
				}
				//ligando e adicionando as casas a tela
				for (i=0;i<Dado.casas.length;i++){
					for (i2=0;i2<Dado.casas.length;i2++){
						if (Dado.casas[i].x+40==Dado.casas[i2].x && Dado.casas[i].y==Dado.casas[i2].y){
							Dado.casas[i].ligarDireita(Dado.casas[i2]);
						}
						if (Dado.casas[i].y+40==Dado.casas[i2].y && Dado.casas[i].x==Dado.casas[i2].x){
							Dado.casas[i].ligarAbaixo(Dado.casas[i2]);
						}
					}
					Dado.mcCasas.addChild(Dado.casas[i]);
					Dado.casas[i].addEventListener(MouseEvent.MOUSE_UP,clickCasa);
				}
			} else {
				for (i=0;i<Dado.casas.length;i++){
					if (Dado.casas[i].pedra!=null){
						Dado.mcPedras.removeChild(Dado.casas[i].pedra);
						Dado.casas[i].pedra=null;
					}
				}
				for (i=0;i<Dado.aniPontos.length;i++){
					Dado.palco.removeChild(Dado.aniPontos[i]);
					Dado.aniPontos.splice(i,1);
				}
			}
		}
	}
}