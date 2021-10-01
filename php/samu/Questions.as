package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class Questions extends MovieClip {
		private var lockFrames:Boolean = false;
		private var resposta:int;
		var certo:Boolean;
		public function Questions() {
			// constructor code
			certo = false;
			this.addEventListener(Event.ENTER_FRAME, EnterFrame);
		}
		public function EnterFrame(e:Event){
			if (currentFrame==1){
				SoundEngine.tocarEfeito(new somAbreRoleta());
			} else if (this.currentFrame==34){
				sorteiaPergunta();
				preparaBotoes();
			} else if (this.currentFrame==754){
				if (certo){
					SoundEngine.tocarEfeito(new somDragDropCerto());
					Data.playerAtual.novaPosicao+=2;
					resultado.gotoAndStop(1);
				} else {
					SoundEngine.tocarEfeito(new somDragDropErrado());
					Data.playerAtual.novaPosicao-=2;
					resultado.gotoAndStop(2);
				}
				limparBotoes();
				switch (resposta){
					case 1:
						btRespostaA.gotoAndStop(3);
						btRespostaB.gotoAndStop(4);
						btRespostaC.gotoAndStop(4);
					break;
					case 2:
						btRespostaA.gotoAndStop(4);
						btRespostaB.gotoAndStop(3);
						btRespostaC.gotoAndStop(4);
					break;
					case 3:
						btRespostaA.gotoAndStop(4);
						btRespostaB.gotoAndStop(4);
						btRespostaC.gotoAndStop(3);
					break;
				}
			} else if (this.currentFrame==783){
				SoundEngine.tocarEfeito(new somFechaRoleta());
			} else if (this.currentFrame==794){
				stop();
				Data.closeQuestion=true;
				Data.playerAtual.iniciarMovimento();
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		public function responder(e:MouseEvent){
			if (e.currentTarget==btRespostaA && resposta==1){
				certo=true;
			} else if (e.currentTarget==btRespostaB && resposta==2){
				certo=true;
			} else if (e.currentTarget==btRespostaC && resposta==3){
				certo=true;
			}
			gotoAndPlay(753);
		}
		private function limparBotoes(){
			btRespostaA.removeEventListener(MouseEvent.CLICK,responder);
			btRespostaB.removeEventListener(MouseEvent.CLICK,responder);
			btRespostaC.removeEventListener(MouseEvent.CLICK,responder);
			btRespostaA.removeEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaB.removeEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaC.removeEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaA.removeEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
			btRespostaB.removeEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
			btRespostaC.removeEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
		}
		private function preparaBotoes(){
			btRespostaA.gotoAndStop(1);
			btRespostaB.gotoAndStop(1);
			btRespostaC.gotoAndStop(1);
			btRespostaA.addEventListener(MouseEvent.CLICK,responder);
			btRespostaB.addEventListener(MouseEvent.CLICK,responder);
			btRespostaC.addEventListener(MouseEvent.CLICK,responder);
			btRespostaA.addEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaB.addEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaC.addEventListener(MouseEvent.MOUSE_OVER,AcendeBotao);
			btRespostaA.addEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
			btRespostaB.addEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
			btRespostaC.addEventListener(MouseEvent.MOUSE_OUT,ApagaBotao);
		}
		public function ApagaBotao(e:MouseEvent){
			e.currentTarget.gotoAndStop(1);
		}
		public function AcendeBotao(e:MouseEvent){
			e.currentTarget.gotoAndStop(2);
		}
		private function sorteiaPergunta(){
			var sorteio:int = (Math.random()*14)+1;
			//sorteio=1;
			switch (sorteio){
				case 0:
					questionText.text = "Qual a atitude que você deve tomar diante de uma pessoa vítima de violência e que está ferida?";
					btRespostaA.resposta.text = "Realiza os primeiros socorros sem pedir ajuda" ;
					btRespostaB.resposta.text = "Pede ajuda ao SAMU 192 e acalma a vítima ";
					btRespostaC.resposta.text = "Foge do local, afinal você não tem nada com isso ";
					resposta = 2;
				break;
				case 1:
					questionText.text = "O que pode acontecer com a criança que passa trote?";
					btRespostaA.resposta.text = "nada, somente se divertir";
					btRespostaB.resposta.text = "os pais serem responsabilizados pela atitude do filho na Justiça";
					btRespostaC.resposta.text = "ficar conhecido como uma pessoa divertida pelos colegas";
					resposta = 2; 
				break;
				case 2:
					questionText.text = "Quando você liga para o SAMU para ajudar alguém,  você está sendo solidário. O trote atrapalha o SAMU porque:";
					btRespostaA.resposta.text = "quando você liga pedindo ajuda, o telefone estará ocupado com o trote";
					btRespostaB.resposta.text = "não atrapalha, porque o SAMU tem muitas telefonistas atendendo";
					btRespostaC.resposta.text = "não atrapalha, pois é apenas uma brincadeira";
					resposta = 1; 
				break;
				case 3:
					questionText.text = "O que você pode fazer para evitar que o SAMU receba  trotes:";
					btRespostaA.resposta.text = "conversar com meus colegas sobre  como o trote prejudica o trabalho do SAMU";
					btRespostaB.resposta.text = "não posso fazer nada, isso é problema do SAMU";
					btRespostaC.resposta.text = "ligar  para 193 Bombeiro, para brincar com eles"; 
					resposta = 1;
				break;
				case 4:
					questionText.text = "Qual o significado da sigla do SUS?";
					btRespostaA.resposta.text = "Sistema Unitário de Saúde";
					btRespostaB.resposta.text = "Sistema Único de Saúde";
					btRespostaC.resposta.text = "Sistema Unificado de Saúde"; 
					resposta = 2; 
				break;
				case 5:
					questionText.text = "Dentre as ações e programas voltados para a população está o SAMU, o que essa sigla significa?";
					btRespostaA.resposta.text = "Serviço de Atendimento Móvel de Urgência";
					btRespostaB.resposta.text = "Serviço de Atendimento Médico  Urbano";
					btRespostaC.resposta.text = "Serviço de Atendimento Médico de Urgência"; 
					resposta = 1; 
				break;
				case 6:
					questionText.text = "Qual o horário de funcionamento do SAMU?";
					btRespostaA.resposta.text = "Somente durante o dia";
					btRespostaB.resposta.text = "Somente durante a noite"; 
					btRespostaC.resposta.text = "24h por dia";
					resposta = 3; 
				break;
				case 7:
					questionText.text = "Onde o SAMU está presente no Brasil?";
					btRespostaA.resposta.text = "Em todos os estados brasileiros"; 
					btRespostaB.resposta.text = "Nos estados mais populosos";
					btRespostaC.resposta.text = "Na maior parte dos estados brasileiros"; 
					resposta = 1; 
				break;
				case 8:
					questionText.text = "O SAMU realiza o atendimento de urgência e emergência em qualquer lugar: residências, locais de trabalho e vias públicas, 24 horas por dia. Qual o telefone do SAMU?";
					btRespostaA.resposta.text = "180";
					btRespostaB.resposta.text = "192";
					btRespostaC.resposta.text = "190";
					resposta = 2; 
				break;
				case 9:
					questionText.text = "Que tipo de atendimento o SAMU não realiza?";
					btRespostaA.resposta.text = "Atropelamento, vítimas de acidente de carro";
					btRespostaB.resposta.text = "Falta de ar, dor no peito e desmaio";
					btRespostaC.resposta.text = "Pesar, medir e vacinar";
					resposta = 3; 
				break;
				case 10:
					questionText.text = "Onde o SAMU pode realizar atendimento?";
					btRespostaA.resposta.text = "Apenas em vias públicas";
					btRespostaB.resposta.text = "Apenas em casa";
					btRespostaC.resposta.text = "Em qualquer lugar";
					resposta = 3; 
				break;
				case 11:
					questionText.text = "A fim de levar atendimento a todas as partes do país, o SAMU conta com os seguintes veículos de salvamento:";
					btRespostaA.resposta.text = "Ambulâncias";
					btRespostaB.resposta.text = "Ambulâncias, motolâncias e helicópteros";
					btRespostaC.resposta.text = "Ambulâncias, motolâncias, ambulanchas e helicópteros";
					resposta = 3; 
				break;
				case 12:
					questionText.text = "Qual o profissional que atende primeiro as ligações feitas ao SAMU?";
					btRespostaA.resposta.text = "Médico";
					btRespostaB.resposta.text = "Telefonista";
					btRespostaC.resposta.text = "Enfermeiro";
					resposta = 2; 
				break;
				case 13:
					questionText.text = "Qual dos veículos abaixo não é utilizado pelo SAMU?";
					btRespostaA.resposta.text = "Ônibus";
					btRespostaB.resposta.text = "Moto";
					btRespostaC.resposta.text = "Lancha";  
					resposta = 1;
				break;
				case 14:
					questionText.text = "Na ambulância do SAMU, o paciente:";
					btRespostaA.resposta.text = "Assiste vídeos educativos";
					btRespostaB.resposta.text = "Recebe os primeiros socorros antes de chegar ao hospital"; 
					btRespostaC.resposta.text = "Recebe apenas instruções de como se cuidar";
					resposta = 2;
				break;
			}
		}
	}
}
