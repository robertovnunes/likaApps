package util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.hibernate.SessionFactory;

import dados.hibernate.HibernateUtil;
import fachada.Fachada;
import model.Endereco;
import model.curso.Curso;
import model.curso.EstudoDeCaso;
import model.curso.matricula.AvaliacaoProfessor;
import model.curso.matricula.arcomaguerez.Implementacao;
import model.curso.matricula.arcomaguerez.Planejamento;
import model.curso.matricula.arcomaguerez.ResultadosEsperados;
import model.sistema.Arquivo;
import model.usuario.Administrador;
import model.usuario.Aluno;
import model.usuario.Professor;

public class MainPopulaBD {
	
	public static void execCriarArqvsCurso(){
		
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		
		InputStream input;
		try {
			Arquivo arqv1 = new Arquivo();
			Arquivo arqv2 = new Arquivo();
			Arquivo arqv3 = new Arquivo();
			Arquivo arqv4 = new Arquivo();
			Arquivo arqv5 = new Arquivo();
			Arquivo arqv6 = new Arquivo();
			Arquivo arqv7 = new Arquivo();
			Arquivo arqv8 = new Arquivo();
			
			arqv1.setExtensao("application/pdf");
			arqv1.setNomeArqv("caderneta_saude_crianca.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\caderneta_saude_crianca.pdf");
			byte[] arraybytes = IOUtils.toByteArray(input);
			arqv1.setDadosArqv(arraybytes);
			
			arqv2.setExtensao("application/pdf");
			arqv2.setNomeArqv("caderneta_saude_crianca_menina_7ed.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\caderneta_saude_crianca_menina_7ed.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv2.setDadosArqv(arraybytes);
			
			arqv3.setExtensao("application/pdf");
			arqv3.setNomeArqv("caderneta_saude_crianca_menino_7ed.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\caderneta_saude_crianca_menino_7ed.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv3.setDadosArqv(arraybytes);
			
			arqv4.setExtensao("application/pdf");
			arqv4.setNomeArqv("caderno_de_atencao_basica_crescimento_e_desenvolvimento_infantil.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\caderno_de_atencao_basica_crescimento_e_desenvolvimento_infantil.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv4.setDadosArqv(arraybytes);
			
			arqv5.setExtensao("application/pdf");
			arqv5.setNomeArqv("curvas_oms_2006_2007.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\curvas_oms_2006_2007.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv5.setDadosArqv(arraybytes);
			
			arqv6.setExtensao("application/pdf");
			arqv6.setNomeArqv("estatuto_crianca_adolescente_10ed.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\estatuto_crianca_adolescente_10ed.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv6.setDadosArqv(arraybytes);
			
			arqv7.setExtensao("application/pdf");
			arqv7.setNomeArqv("Organizacao_dos_cuidados_e_a_parceria_com_os_pais_em_pediatria_2012.pdf");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\Organizacao_dos_cuidados_e_a_parceria_com_os_pais_em_pediatria_2012.pdf");
			arraybytes = IOUtils.toByteArray(input);
			arqv7.setDadosArqv(arraybytes);
			
			arqv8.setExtensao("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			arqv8.setNomeArqv("Links_para_videos.docx");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Comuns aos 3 estudos de caso\\Links_para_videos.docx");
			arraybytes = IOUtils.toByteArray(input);
			arqv8.setDadosArqv(arraybytes);
			
			List<Arquivo> listaArqv = new ArrayList<Arquivo>();
			listaArqv.add(arqv1);
			listaArqv.add(arqv2);
			listaArqv.add(arqv3);
			listaArqv.add(arqv4);
			listaArqv.add(arqv5);
			listaArqv.add(arqv6);
			listaArqv.add(arqv7);
			listaArqv.add(arqv8);
			Fachada.getInstancia().inserirArquivosCurso(listaArqv);
			
			sf.getCurrentSession().getTransaction().commit();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	public static void execMainPopulaBD(){
		

		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		Endereco end = new Endereco("Rua Arcoverde","180","Janga","53439110","Paulista","PE","Ponto de Referencia");
		Endereco end2 = new Endereco("Rua Arcoverde","180","Janga","53439110","Paulista","PE","Ponto de Referencia");
		Endereco end3= new Endereco("Rua Arcoverde","180","Janga","53439110","Paulista","PE","Ponto de Referencia");
		Endereco end4= new Endereco("Rua Arcoverde","180","Janga","53439110","Paulista","PE","Ponto de Referencia");
		
//		Aluno alunoAsd = new Aluno("Paulo Diniz","01234567891",end,"asd","asd","podd@cin.ufpe.br", "Masculino", 0, "UFPE");
//		Fachada.getInstancia().criarUsuarioAluno(alunoAsd);
		
//		Aluno aluno = new Aluno("Paulo Diniz","01234567891",end2,"aluno","aluno","tesra@gmail.com", "Masculino", 0, "UFPE");
//		Fachada.getInstancia().criarUsuarioAluno(aluno);
//		
//		Professor professor = new Professor("Rosalie Belian","01234567891",end3,"professor","professor","rosalie.belian@gmail.com", "Feminino", 0, "UFPE");
//		Fachada.getInstancia().criarUsuarioProfessor(professor);
//		
//		Administrador admin = new Administrador("Administrador Sistema","01234567891",end4,"admin","admin","tffesra@gmail.com", "Masculino", 0);
//		Fachada.getInstancia().criarUsuarioAdministrador(admin);
		
//		Curso curso1 = new Curso(0, "O Processo de Enfermagem Aplicado Ã  CrianÃ§a de 0 a 2 anos", "Este curso tem por objetivo desenvolver no aluno competÃªncias e habilidades relacionadas ao exercÃ­cio do Processo de Enfermagem no atendimento Ã  crianÃ§a de 0 a 2 anos. O curso estÃ¡ estruturado no mÃ©todo de ensino do Arco de Charles Maguerez (Metodologia da ProblematizaÃ§Ã£o), sendo formado por trÃªs cenÃ¡rios educativos (situaÃ§Ãµes-problemas) de nÃ­veis de complexidade progressivos. Durante o curso o aluno contextualizarÃ¡ a aprendizagem para a realidade social da crianÃ§a atendida no serviÃ§o de puericultura, propondo um planejamento do cuidado Ã  luz da ClassificaÃ§Ã£o Internacional de PrÃ¡ticas de Enfermagem em SaÃºde Coletiva (CIPESC).",
//				"",
//				new Date(2014,4,7), new Date(2014,4,29), Curso.ANDAMENTO, professor, null);
//		
//		
//		curso1 = Fachada.getInstancia().inserirCurso(curso1);
//		
//		List<Curso> cursos = new ArrayList<Curso>();
//		cursos.add(curso1);
		
//		Fachada.getInstancia().matricularAlunoCursos(alunoAsd, cursos);
		
		sf.getCurrentSession().getTransaction().commit();
		
	}
	
	public static void execPopulaMateriais(){
		

		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		
//		Material mat1 = new Material("Mesa e cadeira para o profissional",Material.GERAL);
//		Material mat2 = new Material("Porta retrato",Material.GERAL);
//		Material mat3 = new Material("Mesa clÃ­nica",Material.GERAL);
//		Material mat4 = new Material("ArmÃ¡rio para guardar os prontuÃ¡rios e receituÃ¡rios",Material.GERAL);
//		Material mat5 = new Material("Computador e impressora",Material.GERAL);
//		Material mat6 = new Material("FogÃ£o",Material.GERAL);
//		Material mat7 = new Material("Abajur",Material.GERAL);
//		Material mat8 = new Material("Geladeira",Material.GERAL);
//		Material mat9 = new Material("TelevisÃ£o",Material.GERAL);
//		Material mat10 = new Material("Aparelho de DVD/BLU-RAY",Material.GERAL);
//		Material mat11 = new Material("Suporte para Ã�lcool gel/sabÃ£o lÃ­quido",Material.GERAL);
//		Material mat12 = new Material("Lixeira para lixo comum",Material.GERAL);
//		Material mat13 = new Material("Suporte para papel toalha",Material.GERAL);
//		Material mat14 = new Material("Lixeira para lixo contaminado",Material.GERAL);
//		
//		
//		Fachada.getInstancia().cadastrarMaterial(mat1);
//		Fachada.getInstancia().cadastrarMaterial(mat2);
//		Fachada.getInstancia().cadastrarMaterial(mat3);
//		Fachada.getInstancia().cadastrarMaterial(mat4);
//		Fachada.getInstancia().cadastrarMaterial(mat5);
//		Fachada.getInstancia().cadastrarMaterial(mat6);
//		Fachada.getInstancia().cadastrarMaterial(mat7);
//		Fachada.getInstancia().cadastrarMaterial(mat8);
//		Fachada.getInstancia().cadastrarMaterial(mat9);
//		Fachada.getInstancia().cadastrarMaterial(mat10);
//		Fachada.getInstancia().cadastrarMaterial(mat11);
//		Fachada.getInstancia().cadastrarMaterial(mat12);
//		Fachada.getInstancia().cadastrarMaterial(mat13);
//		Fachada.getInstancia().cadastrarMaterial(mat14);

		
//		Material mate1 = new Material("Papel Toalha",Material.USO_CORRENTE);
//		Material mate2 = new Material("Ã�lcool 70%",Material.USO_CORRENTE);
//		Material mate3 = new Material("AlgodÃ£o",Material.USO_CORRENTE);
//		Material mate4 = new Material("Papel ofÃ­cio",Material.USO_CORRENTE);
//		Material mate5 = new Material("Caneta",Material.USO_CORRENTE);
//		Material mate6 = new Material("Lupa",Material.USO_CORRENTE);
//		
//		Fachada.getInstancia().cadastrarMaterial(mate1);
//		Fachada.getInstancia().cadastrarMaterial(mate2);
//		Fachada.getInstancia().cadastrarMaterial(mate3);
//		Fachada.getInstancia().cadastrarMaterial(mate4);
//		Fachada.getInstancia().cadastrarMaterial(mate5);
//		Fachada.getInstancia().cadastrarMaterial(mate6);
//		
		
//		Material mater1 = new Material("BalanÃ§a pediÃ¡trica",Material.USO_CLINICO);
//		Material mater2 = new Material("RÃ©gua antropomÃ©trica",Material.USO_CLINICO);
//		Material mater3 = new Material("EstetoscÃ³pio com duas peÃ§as torÃ¡cicas (diafragma e campÃ¢nula)",Material.USO_CLINICO);
//		Material mater4 = new Material("EsfigmomanÃ´metro",Material.USO_CLINICO);
//		Material mater5 = new Material("Monitor cardÃ­aco",Material.USO_CLINICO);
//		Material mater6 = new Material("TermÃ´metro",Material.USO_CLINICO);
//		Material mater7 = new Material("EletrocardiÃ³grafo",Material.USO_CLINICO);
//		Material mater8 = new Material("GlicosÃ­metro",Material.USO_CLINICO);
//		Material mater9 = new Material("Fita mÃ©trica",Material.USO_CLINICO);
//		Material mater10 = new Material("Lanterna",Material.USO_CLINICO);
//		Material mater11 = new Material("OtoscÃ³pio",Material.USO_CLINICO);
//		Material mater12 = new Material("Ventilador mecÃ¢nico",Material.USO_CLINICO);
//		
//		
//		Fachada.getInstancia().cadastrarMaterial(mater1);
//		Fachada.getInstancia().cadastrarMaterial(mater2);
//		Fachada.getInstancia().cadastrarMaterial(mater3);
//		Fachada.getInstancia().cadastrarMaterial(mater4);
//		Fachada.getInstancia().cadastrarMaterial(mater5);
//		Fachada.getInstancia().cadastrarMaterial(mater6);
//		Fachada.getInstancia().cadastrarMaterial(mater7);
//		Fachada.getInstancia().cadastrarMaterial(mater8);
//		Fachada.getInstancia().cadastrarMaterial(mater9);
//		Fachada.getInstancia().cadastrarMaterial(mater10);
//		Fachada.getInstancia().cadastrarMaterial(mater11);
//		Fachada.getInstancia().cadastrarMaterial(mater12);
		
		sf.getCurrentSession().getTransaction().commit();
	
	}
	
	public static void execCadastrarEstudosDeCasos(){
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		try {
			Curso curso = new Curso(1);
			InputStream input;
			
			List<Arquivo> imagensEc1 = new ArrayList<Arquivo>();
			List<Arquivo> imagensEc2 = new ArrayList<Arquivo>();
			List<Arquivo> imagensEc3 = new ArrayList<Arquivo>();
			List<Arquivo> imgsAux1 = new ArrayList<Arquivo>();
			List<Arquivo> imgsAux2 = new ArrayList<Arquivo>();
			List<Arquivo> imgsAux3 = new ArrayList<Arquivo>();
			
			Arquivo arqv = new Arquivo();
			arqv.setExtensao("image/jpeg");
			arqv.setNomeArqv("estudoDeCasoI.jpg");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Imagem do caso\\estudoDeCasoI.jpg");
			byte[] arraybytes = IOUtils.toByteArray(input);
			arqv.setDadosArqv(arraybytes);
			imagensEc1.add(arqv);
			
			Arquivo arqv3 = new Arquivo();
			arqv3.setExtensao("image/jpeg");
			arqv3.setNomeArqv("estudoDeCasoII.jpg");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Imagem do caso\\estudoDeCasoII.jpg");
			arraybytes = IOUtils.toByteArray(input);
			arqv3.setDadosArqv(arraybytes);
			imagensEc2.add(arqv3);
			
			Arquivo arqv4 = new Arquivo();
			arqv4.setExtensao("image/jpeg");
			arqv4.setNomeArqv("estudoDeCasoIII.jpg");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Imagem do caso\\estudoDeCasoIII.jpg");
			arraybytes = IOUtils.toByteArray(input);
			arqv4.setDadosArqv(arraybytes);
			imagensEc3.add(arqv4);
			
			Arquivo arqvEc1Aux1 = new Arquivo();
			arqvEc1Aux1.setExtensao("image/png");
			arqvEc1Aux1.setNomeArqv("photo01.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.45.58.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux1.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux1);
			Arquivo arqvEc1Aux2 = new Arquivo();
			arqvEc1Aux2.setExtensao("image/png");
			arqvEc1Aux2.setNomeArqv("photo02.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.03.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux2.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux2);
			Arquivo arqvEc1Aux3 = new Arquivo();
			arqvEc1Aux3.setExtensao("image/png");
			arqvEc1Aux3.setNomeArqv("photo03.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.10.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux3.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux3);
			Arquivo arqvEc1Aux4 = new Arquivo();
			arqvEc1Aux4.setExtensao("image/png");
			arqvEc1Aux4.setNomeArqv("photo04.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.17.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux4.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux4);
			Arquivo arqvEc1Aux5 = new Arquivo();
			arqvEc1Aux5.setExtensao("image/png");
			arqvEc1Aux5.setNomeArqv("photo05.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.24.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux5.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux5);
			Arquivo arqvEc1Aux6 = new Arquivo();
			arqvEc1Aux6.setExtensao("image/png");
			arqvEc1Aux6.setNomeArqv("photo06.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.30.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux6.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux6);
			Arquivo arqvEc1Aux7 = new Arquivo();
			arqvEc1Aux7.setExtensao("image/png");
			arqvEc1Aux7.setNomeArqv("photo07.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.41.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux7.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux7);
			Arquivo arqvEc1Aux8 = new Arquivo();
			arqvEc1Aux8.setExtensao("image/png");
			arqvEc1Aux8.setNomeArqv("photo08.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.47.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux8.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux8);
			Arquivo arqvEc1Aux9 = new Arquivo();
			arqvEc1Aux9.setExtensao("image/png");
			arqvEc1Aux9.setNomeArqv("photo09.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso I\\Captura de tela 2014-01-15 12.46.52.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc1Aux9.setDadosArqv(arraybytes);
			imgsAux1.add(arqvEc1Aux9);
			
			Arquivo arqvEc2Aux1 = new Arquivo();
			arqvEc2Aux1.setExtensao("image/png");
			arqvEc2Aux1.setNomeArqv("photo01.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.48.21.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux1.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux1);
			Arquivo arqvEc2Aux2 = new Arquivo();
			arqvEc2Aux2.setExtensao("image/png");
			arqvEc2Aux2.setNomeArqv("photo02.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.48.48.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux2.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux2);
			Arquivo arqvEc2Aux3 = new Arquivo();
			arqvEc2Aux3.setExtensao("image/png");
			arqvEc2Aux3.setNomeArqv("photo03.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.50.17.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux3.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux3);
			Arquivo arqvEc2Aux4 = new Arquivo();
			arqvEc2Aux4.setExtensao("image/png");
			arqvEc2Aux4.setNomeArqv("photo04.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.50.43.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux4.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux4);
			Arquivo arqvEc2Aux5 = new Arquivo();
			arqvEc2Aux5.setExtensao("image/png");
			arqvEc2Aux5.setNomeArqv("photo05.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.50.55.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux5.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux5);
			Arquivo arqvEc2Aux6 = new Arquivo();
			arqvEc2Aux6.setExtensao("image/png");
			arqvEc2Aux6.setNomeArqv("photo06.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso II\\Captura de tela 2014-01-14 11.52.09.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc2Aux6.setDadosArqv(arraybytes);
			imgsAux2.add(arqvEc2Aux6);
			
			Arquivo arqvEc3Aux1 = new Arquivo();
			arqvEc3Aux1.setExtensao("image/png");
			arqvEc3Aux1.setNomeArqv("photo01.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.37.23.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux1.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux1);
			Arquivo arqvEc3Aux2 = new Arquivo();
			arqvEc3Aux2.setExtensao("image/png");
			arqvEc3Aux2.setNomeArqv("photo02.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.37.41.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux2.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux2);
			Arquivo arqvEc3Aux3 = new Arquivo();
			arqvEc3Aux3.setExtensao("image/png");
			arqvEc3Aux3.setNomeArqv("photo03.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.37.47.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux3.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux3);
			Arquivo arqvEc3Aux4 = new Arquivo();
			arqvEc3Aux4.setExtensao("image/png");
			arqvEc3Aux4.setNomeArqv("photo04.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.37.53.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux4.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux4);
			Arquivo arqvEc3Aux5 = new Arquivo();
			arqvEc3Aux5.setExtensao("image/png");
			arqvEc3Aux5.setNomeArqv("photo05.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.38.00.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux5.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux5);
			Arquivo arqvEc3Aux6 = new Arquivo();
			arqvEc3Aux6.setExtensao("image/png");
			arqvEc3Aux6.setNomeArqv("photo06.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.38.08.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux6.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux6);
			Arquivo arqvEc3Aux7 = new Arquivo();
			arqvEc3Aux7.setExtensao("image/png");
			arqvEc3Aux7.setNomeArqv("photo07.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.38.18.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux7.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux7);
			Arquivo arqvEc3Aux8 = new Arquivo();
			arqvEc3Aux8.setExtensao("image/png");
			arqvEc3Aux8.setNomeArqv("photo08.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.38.26.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux8.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux8);
			Arquivo arqvEc3Aux9 = new Arquivo();
			arqvEc3Aux9.setExtensao("image/png");
			arqvEc3Aux9.setNomeArqv("photo09.png");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\Captura de tela 2014-01-15 12.38.32.png");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux9.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux9);
			Arquivo arqvEc3Aux10 = new Arquivo();
			arqvEc3Aux10.setExtensao("image/jpeg");
			arqvEc3Aux10.setNomeArqv("photo10.jpg");
			input = new FileInputStream("C:\\Users\\Paulo\\Dropbox\\Objetos de aprendizagem (1)\\Imagens auxiliares dos estudos de caso\\Imagens_estudo de caso III\\ferida_estudo III.jpg");
			arraybytes = IOUtils.toByteArray(input);
			arqvEc3Aux10.setDadosArqv(arraybytes);
			imgsAux3.add(arqvEc3Aux10);
			
//			EstudoDeCaso estudo = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "AtenÃ§Ã£o de Enfermagem Ã  CrianÃ§a Sadia", "Objetivos Gerais do Estudo de Caso", "Objetivos EspecÃ­ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "MARIA RODRIGUES LIMA, FEMININA, NASCIDA A TERMO COM 3.250g E APGAR NO PRIMEIRO E QUINTO MINUTOS DE 8 E 10 RESPECTIVAMENTE, Ã‰ ACOMPANHADA DESDE O PRIMEIRO MÃŠS DE VIDA PELA ENFERMEIRA NO SERVIÃ‡O DE PUERICULTURA. A MÃƒE DE MARIA SEMPRE SE MOSTROU INTERESSADA EM SEGUIR AS ORIENTAÃ‡Ã•ES DA ENFERMEIRA. ELA NUNCA FALTOU A UMA CONSULTA E SEU ESPOSO, SEMPRE QUANDO NÃƒO ESTÃ� TRABALHANDO, ACOMPANHA A FAMÃ�LIA. AOS 4 MESES DE VIDA MARIA FOI LEVADA POR SUA MÃƒE PARA MAIS UMA CONSULTA DE ROTINA. A ENFERMEIRA RESPONSÃ�VEL PELO SERVIÃ‡O PERGUNTOU A GENITORA SOBRE O ESTADO DE SAÃšDE ATUAL DA CRIANÃ‡A. â€œMINHA FILHA VAI MUITO BEM GRAÃ‡AS A DEUS, ELA AINDA NÃƒO SABE O QUE Ã‰ UMA GRIPE E NEM O QUE Ã‰ UMA DOR DE BARRIGA...â€� (SIC). PREOCUPADA COM O TEMPO PARA PREENCHER AS FICHAS DA PUERICULTURA, A ENFERMEIRA INTERROMPEU A ANAMNESE E INICIOU A AVALIAÃ‡ÃƒO DO CRESCIMENTO INFANTIL, OBTENDO ASSIM OS SEGUINTES DADOS: PESO DE 6.950g; 41 CM DE PERÃ�METRO CEFÃ�LICO; 65 CM DE COMPRIMENTO; Ã�NDICE DE MASSA CORPORAL (IMC) DE 16,4; PERÃ�METRO BRAQUIAL DE 14 CM; PREGA CUTÃ‚NEA TRICIPITAL DE 9,8 MM E PREGA CUTÃ‚NEA SUBESCAPULAR DE 9,2 MM. A ENFERMEIRA TAMBÃ‰M VERIFICOU QUE MARIA APRESENTAVA OS SEGUINTES MARCOS DO DESENVOLVIMENTO: RESPONDIA ATIVAMENTE AO CONTATO SOCIAL; EMITIA E LOCALIZAVA SONS;  SUSTENTAVA A CABEÃ‡A QUANDO EM DECÃšBITO DORSAL E VENTRAL; MUDAVA DE POSIÃ‡ÃƒO ATIVAMENTE (ROLAVA QUANDO DEITADA EM SUPERFÃ�CIE PLANA); PEGAVA PEQUENOS OBJETOS, TRANSFERIA-OS DE UMA MÃƒO PARA A OUTRA E LEVAVA OS OBJETOS Ã€ BOCA. O CALENDÃ�RIO VACINAL ANALISADO PELA ENFERMEIRA DEMONSTRAVA QUE MARIA ESTAVA EM DIA COM AS VACINAS RECOMENDADAS PARA A IDADE CONFORME O PROGRAMA NACIONAL DE IMUNIZAÃ‡ÃƒO. ELA JÃ� HAVIA RECEBIDO UMA DOSE DE BCG, HEPATITE B, A 1Âª DOSE DA VACINA MENINGOCÃ“CICA C (CONJUGADA) E A 1Âª E 2Âª DOSES DAS VACINAS: PENTAVALENTE (DTP+ Hib+ HB), VACINA INATIVADA POLIOMIELITE (VIP), VACINA ORAL CONTRA O ROTAVÃ�RUS HUMANO (VORH) E PNEUMOCÃ“CICA 10 (CONJUGADA). A ENFERMEIRA APROVEITOU A OPORTUNIDADE PARA PARABENIZAR A MÃƒE E ORIENTÃ�-LA QUANTO AO AGENDAMENTO DAS PRÃ“XIMAS VACINAS. AO EXAME FÃ�SICO MARIA MOSTROU-SE: ATIVA, AFEBRIL (36.4Â°C), NORMOCORADA, PELE Ã�NTEGRA, FONTANELA ANTERIOR ABERTA (NORMOTENSA) E POSTERIOR FECHADA. PAVILHÃƒO AURICULAR INDOLOR Ã€ PRESSÃƒO NA REGIÃƒO DO TRAGUS, AUSÃŠNCIA DE SECREÃ‡ÃƒO NO CONDUTO AUDITIVO EXTERNO. SUSTENTAÃ‡ÃƒO DO PESCOÃ‡O COMPATÃ�VEL COM A IDADE E SEM ANORMALIDADES. TÃ“RAX SIMÃ‰TRICO COM EXPANSÃƒO BILATERAL, EUPNEICO (FR 35 RPM), PRESENÃ‡A DE MURMÃšRIOS VESICULARES EM AMBOS OS HEMITÃ“RAX SEM RUÃ�DOS ADVENTÃ�CIOS. NORMOCÃ�RDICO (FC 136 BPM), ABDÃ”MEM PLANO, TIMPÃ‚NICO, CICATRIZ UMBILICAL Ã�NTEGRA. GENITÃ�LIA TÃ�PICA FEMININA SEM ANORMALIDADES. ", 
//					imagensEc1, imgsAux1, "", curso);
//			Fachada.getInstancia().cadastrarEstudoDeCaso(estudo);
//			
//			EstudoDeCaso estudo2 = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "AtenÃ§Ã£o de Enfermagem Ã  CrianÃ§a em SituaÃ§Ã£o de Risco", "Objetivos Gerais do Estudo de Caso", "Objetivos EspecÃ­ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "PEDRO HENRIQUE DA COSTA, 2 MESES, FOI LEVADO POR SUA MÃƒE AO SERVIÃ‡O DE PEURICULTURA PARA MAIS UMA CONSULTA DE ROTINA. DURANTE O ATENDIMENTO A ENFERMEIRA PERCEBEU QUE A MÃƒE DE PEDRO SE ENCONTRAVA INQUIETA E PREOCUPADA. AO SER QUESTIONADA, A GENITORA DISSE QUE ESTAVA ANSIOSA, POIS TEMIA CHEGAR ATRASADA AO TRABALHO: â€œHOJE DE MANHÃƒ ACORDEI JÃ� APERRIADA... PROCUREI ALGUÃ‰M QUE PUDESSE TRAZER MEU FILHO Ã€ CONSULTA PARA NÃƒO ME ATRASAR NO SERVIÃ‡O, MAS NÃƒO TEVE JEITO...NINGUÃ‰M PÃ”DE ME AJUDAR...â€� (SIC). A ENFERMEIRA NOTOU QUE A CRIANÃ‡A TINHA BAIXA FIXAÃ‡ÃƒO OCULAR, INTERAGIA POUCO, NÃƒO SORRIA SOCIALMENTE QUANDO ESTIMULADA, ABRIA AS MÃƒOS ESPONTANEAMENTE, MOVIMENTAVA ATIVAMENTE OS MEMBROS E EMITIA SONS (BALBUCIO) COM POUCA FREQUÃŠNCIA. TAMBÃ‰M VERIFICOU QUE A MESMA SE ENCONTRAVA COM 4.200g DE PESO; 55 CM DE COMPRIMENTO;  IMC DE 13,5 E 38,5 CM DE PERÃ�METRO CEFÃ�LICO. A MÃƒE EXPLICOU QUE HÃ� UM MÃŠS, ANTES DE INICIAR NO TRABALHO, AMAMENTAVA SEU FILHO DIARIAMENTE, MAS QUE AGORA NÃƒO TINHA MAIS TEMPO, POR ISSO OFERECIA OUTROS ALIMENTOS: â€œNÃƒO TIVE DIREITO A LICENÃ‡A MATERNIDADE, PORQUE MEU SERVIÃ‡O Ã‰ INFORMAL, PRECISO TRABALHAR PELA MANHÃƒ E A TARDE PARA PODER PAGAR AS CONTAS. NÃƒO TENHO MARIDO, MORO SOZINHA COM MINHA TIA QUE JÃ� Ã‰ IDOSA E NÃƒO TEM MAIS PACIÃŠNCIA PARA CUIDAR DE CRIANÃ‡A. NÃƒO POSSO DEIXAR MEU FILHO COM FOME O DIA INTEIRO, POR ISSO MINHA TIA ME AJUDA DANDO LEITE DE VACA, Ã�GUA E SUCO PARA ELE. SÃ“ A NOITE, QUANDO CHEGO DO SERVIÃ‡O, Ã‰ QUE TENHO CONDIÃ‡Ã•ES DE AMAMENTAR, MESMO ASSIM SINTO QUE PEDRO NÃƒO SEGURA DIREITO O BICO DO MEU SEIO... SABE, DESDE QUE COMECEI A TRABALHAR SINTO FALTA DOS MOMENTOS QUE INTERAGIA COM ELEâ€�(SIC).  IGNORANDO AS QUEIXAS DA MÃƒE SOBRE A DEFICIÃŠNCIA NA REDE DE APOIO SOCIAL E VÃ�NCULO COM O BÃŠBE, A ENFERMEIRA APENAS ORIENTOU-A QUANTO A IMPORTÃ‚NCIA DO ALEITAMENTO MATERNO EXCLUSIVO E A POSIÃ‡ÃƒO CORRETA DA PEGA DA CRIANÃ‡A AO SEIO.  TAMBÃ‰M FOI ENSINADO COMO RETIRAR E ESTOCAR O LEITE COM SEGURANÃ‡A PARA OFERECER NOS HORÃ�RIOS DE TRABALHO. A GENITORA SURPRESA, AFIRMOU QUE NÃƒO TINHA CONHECIMENTO DESTAS INFORMAÃ‡Ã•ES.  DURANTE O EXAME FÃ�SICO PEDRO MOSTROU-SE: INQUIETO, IRRITADO, AFEBRIL (36.5Â°C), NORMOCORADO, PELE Ã�NTEGRA, FONTANELAS ANTERIOR E POSTERIOR ABERTAS (NORMOTENSA). PUPILAS ISOCÃ“RICAS, FOTORREAGENTES, ESCLERÃ“TICA ANICTÃ‰RICA, PAVILHÃƒO AURICULAR INDOLOR Ã€ PRESSÃƒO NA REGIÃƒO DO TRAGUS, AUSÃŠNCIA DE SECREÃ‡ÃƒO NO CONDUTO AUDITIVO EXTERNO. CAVIDADE ORAL SEM ANORMALIDADES, GENGIVAS NORMOCORADAS. LINFONODOS AURICULARES, OCCIPITAIS, SUBMANDIBULARES, CERVICAIS, AXILARES E INGUINAIS IMPALPÃ�VEIS. TÃ“RAX SIMÃ‰TRICO COM EXPANSÃƒO BILATERAL, EUPNEICO (FR 33 RPM), PRESENÃ‡A DE MURMÃšRIOS VESICULARES EM AMBOS OS HEMITÃ“RAX SEM RUÃ�DOS ADVENTÃ�CIOS. NORMOCÃ�RDICO (FC 138 BPM), RITMO CARDÃ�ACO REGULAR, BULHAS NORMOFONÃ‰TICAS EM 2 TEMPOS, BOA PERFUSÃƒO TISSULAR PERIFÃ‰RICA. ABDÃ”MEM PLANO, TIMPÃ‚NICO, INDOLOR Ã€ PALPAÃ‡ÃƒO, RUÃ�DOS HIDROÃ�REOS PRESENTES, CICATRIZ UMBILICAL Ã�NTEGRA. MEMBROS SUPERIORES E INFERIORES SIMÃ‰TRICOS COM TONO E FORÃ‡A MUSCULARES PRESERVADOS. GENITÃ�LIA TÃ�PICA MASCULINA SEM ANORMALIDADES. ", 
//					imagensEc2, imgsAux2, "", curso);
//			Fachada.getInstancia().cadastrarEstudoDeCaso(estudo2);
//			
//			EstudoDeCaso estudo3 = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "AtenÃ§Ã£o de Enfermagem Ã  CrianÃ§a VÃ­tima de ViolÃªncia", "Objetivos Gerais do Estudo de Caso", "Objetivos EspecÃ­ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "GABRIELA SOARES SANTOS, 1 ANO E 7 MESES, RESIDE COM SUA MÃƒE, PADRASTO E 4 IRMÃƒOS NA PERIFERIA DA CIDADE DO RECIFE. JOSÃ‰ FREITAS, PADRASTO DE GABRIELA, Ã‰ SERVENTE DE PEDREIRO. SUA MÃƒE, ANTÃ”NIA SOARES, ESTÃ� DESEMPREGADA HÃ� MAIS DE 5 MESES. DESDE QUE GABRIELA NASCEU, ANTÃ”NIA COMEÃ‡OU A INGERIR BEBIDAS ALCOÃ“LICAS. POR DUAS VEZES FOI CONDUZIDA AO SERVIÃ‡O DE REABILITAÃ‡ÃƒO PARA DEPENDENTES QUÃ�MICOS, MAS NUNCA CONCLUIU O TRATAMENTO. QUASE TODOS OS DIAS ANTÃ”NIA DEIXA OS SEUS FILHOS SOZINHOS EM CASA PARA BEBER NOS BARES DA REGIÃƒO. A AGENTE DE SAÃšDE DA FAMÃ�LIA POR VÃ�RIAS VEZES TENTOU VISITAR A RESIDÃŠNCIA DE ANTÃ”NIA. JÃ� FAZIA UM MESES QUE ELA NÃƒO LEVAVA GABRIELA AO SERVIÃ‡O DE PUERICULTURA, SENDO SOLICITADA SUA BUSCA ATIVA. EM UMA DAS VISITAS, A AGENTE DE SAÃšDE ENCONTROU GABRIELA SOZINHA EM CASA COM SEUS 4 IRMÃƒOS. A CASA ESTAVA DESORGANIZADA E EM MÃ�S CONDIÃ‡Ã•ES DE HIGIENE. A CRIANÃ‡A TINHA FEZES RESSECADAS, INDICANDO QUE HAVIA EVACUADO HÃ� ALGUMAS HORAS ATRÃ�S. A REGIÃƒO GLÃšTEA ESTAVA LESIONADA POR EXPOSIÃ‡ÃƒO CONSTANTE DA PELE Ã€S SUBSTÃ‚NCIAS IRRITANTES DAS FEZES. HAVIA HEMATOMAS NOS BRAÃ‡OS E NAS PERNAS E O CALENDÃ�RIO VACINAL DA CRIANÃ‡A ESTAVA ATRASADO.  DURANTE A VISITA, GABRIELA SE MOSTROU INQUIETA E IRRITADA, CHORANDO MUITO. A IRMÃƒ MAIS VELHA DE 8 ANOS EXPLICOU QUE SUA  MÃƒE SAIU CEDO PARA BEBER E QUE GABRIELA ESTAVA SEM COMER HÃ� MAIS DE 4 HORAS, PARA â€œENGANAR A FOMEâ€� (SIC) FOI OFERECIDO A ELA REFRIGERANTE E SALGADINHOS. â€œMINHA MÃƒE SAI SEMPRE CEDO DE CASA E VOLTA NO FINAL DA TARDE BÃŠBADA. Ã€S VEZES, ELA ESTÃ� CALMA, MAS TEM VEZES QUE ELA ESTÃ� IRRITADA E BATE NA GENTE QUANDO CHEGA DA RUA. NOSSA VIZINHA Ã‰ QUEM CUIDA DE MIM E DOS MEUS IRMÃƒOSâ€� (SIC). AO TOMAR CONHECIMENTO DO FATO, A ENFERMEIRA DA UNIDADE DE SAÃšDE REUNIU A EQUIPE MULTIPROFISSIONAL PARA DISCUTIR O ASSUNTO. ALÃ‰M DOS PROFISSIONAIS DE SAÃšDE, PARTICIPARAM DA REUNIÃƒO OS EDUCADORES DA COMUNIDADE, OS QUAIS DEBATERAM COM A EQUIPE ESTRATÃ‰GIAS PARA O MONITORAMENTO DA FREQUÃŠNCIA E RENDIMENTO ESCOLAR DAS CRIANÃ‡AS VÃ�TIMAS DE MAUS-TRATOS.  A ENFERMEIRA AGENDOU VISITAS DOMICILIARES PARA ACOMPANHAMENTO DA FAMÃ�LIA DE ANTÃ”NIA PELA PSICÃ“LOGA E A ASSISTENTE SOCIAL. VIABILIZOU O ATENDIMENTO DE GABRIELA AO SERVIÃ‡O DE PUERICULTURA E ENCAMINHOU ANTÃ”NIA AO PROGRAMA COMUNITÃ�RIO DE AUXÃ�LIO, ORIENTAÃ‡ÃƒO E TRATAMENTO A ALCOÃ“LATRAS. POR SE TRATAR DE UM CASO DE NEGLIGÃŠNCIA E VIOLÃŠNCIA FÃ�SICA CONTRA A CRIANÃ‡A, O CONSELHO TUTELAR FOI NOTIFICADO. EM UMA DAS CONSULTAS DE GABRIELA AO SERVIÃ‡O DE PUERICULTURA A ENFERMEIRA OBSERVOU QUE A CRIANÃ‡A AINDA NÃƒO FALAVA PALAVRAS COMPREENSÃ�VEIS, TINHA DIFICULDADE PARA CONSTRUIR TORRE DE TRÃŠS CUBOS E APONTAR PARA OBJETOS OU FIGURAS PRÃ“XIMAS. GABRIELA ESTAVA COM 9300g DE PESO; 79 CM DE COMPRIMENTO; Ã�NDICE DE MASSA CORPORAL DE 14,9; PERÃ�METRO CEFÃ�LICO DE 46 CM; PERÃ�METRO BRAQUIAL DE 12,7 CM; PREGA CUTÃ‚NEA TRICIPITAL DE 8,3 MM E PREGA CUTÃ‚NEA SUBESCAPULAR DE 7,5 MM.  AO EXAME FÃ�SICO, GABRIELA MOSTROU-SE: INQUIETA, IRRITADA, AFEBRIL (36.2Â°C), HIPOCORADA (+/4+), PUPILAS ISOCÃ“RICAS, FOTORREAGENTES, ESCLERÃ“TICA ANICTÃ‰RICA. PAVILHÃƒO AURICULAR INDOLOR Ã€ PRESSÃƒO NA REGIÃƒO DO TRAGUS, AUSÃŠNCIA DE SECREÃ‡ÃƒO NO CONDUTO AUDITIVO EXTERNO. CAVIDADE ORAL SEM ANORMALIDADES, GENGIVAS HIPOCORADAS (+/4+). LINFONODOS AURICULARES, OCCIPITAIS, SUBMANDIBULARES, CERVICAIS, AXILARES E INGUINAIS IMPALPÃ�VEIS. TÃ“RAX SIMÃ‰TRICO COM EXPANSÃƒO BILATERAL, EUPNEICA (FR 29 RPM), PRESENÃ‡A DE MURMÃšRIOS VESICULARES EM AMBOS OS HEMITÃ“RAX SEM RUÃ�DOS ADVENTÃ�CIOS. NORMOCÃ�RDICA (FC 110 BPM), RITMO CARDÃ�ACO REGULAR, BULHAS NORMOFONÃ‰TICAS EM 2 TEMPOS, BOA PERFUSÃƒO TISSULAR PERIFÃ‰RICA. ABDÃ”MEM PLANO, TIMPÃ‚NICO, INDOLOR Ã€ PALPAÃ‡ÃƒO, RUÃ�DOS HIDROÃ�REOS PRESENTES, CICATRIZ UMBILICAL Ã�NTEGRA. MEMBROS SUPERIORES E INFERIORES SIMÃ‰TRICOS COM TONO E FORÃ‡A MUSCULARES PRESERVADOS. PRESENÃ‡A DE HEMATOMAS EM AMBOS OS BRAÃ‡OS E PERNAS. GENITÃ�LIA TÃ�PICA FEMININA SEM ANORMALIDADES. ÃšLCERAS CONFLUENTES COM MODERADA EXSUDAÃ‡ÃƒO EM REGIÃƒO GLÃšTEA, ESTÃ�GIO III, CICATRIZANDO POR 2Âª INTENÃ‡ÃƒO, REGIÃƒO PERILESIONAL MACERADA COM Ã�REAS DE EPITELIZAÃ‡ÃƒO, BORDAS IRREGULARES COM MARGENS ADERIDAS, LEITO COM PRESENÃ‡A DE TECIDO DE GRANULAÃ‡ÃƒO.", 
//					imagensEc3, imgsAux3, "", curso);
//			Fachada.getInstancia().cadastrarEstudoDeCaso(estudo3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		sf.getCurrentSession().getTransaction().commit();
	}
	
	public static void execCadastrarDeterminateHiposteses(){
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		try {
			
//			DeterminanteHipoteses det = new DeterminanteHipoteses("Aleitamento materno misto e complementado", new EstudoDeCaso(2));
//			DeterminanteHipoteses det2 = new DeterminanteHipoteses("TÃ©cnica segura de amamentaÃ§Ã£o", new EstudoDeCaso(2));
//			DeterminanteHipoteses det3 = new DeterminanteHipoteses("O cuidado centrado na famÃ­lia e na crianÃ§a", new EstudoDeCaso(2));
//			DeterminanteHipoteses det4 = new DeterminanteHipoteses("FormaÃ§Ã£o de rede de apoio social", new EstudoDeCaso(2));
//			DeterminanteHipoteses det5 = new DeterminanteHipoteses("Desenvolvimento da relaÃ§Ã£o de vÃ­nculo/apego", new EstudoDeCaso(2));
//			DeterminanteHipoteses det6 = new DeterminanteHipoteses("NutriÃ§Ã£o inadequada do lactente e sua relaÃ§Ã£o com o atraso no crescimento e desenvolvimento infantil", new EstudoDeCaso(2));
//			
//			
//			DeterminanteHipoteses det7 = new DeterminanteHipoteses("ViolÃªncia intradomiciliar", new EstudoDeCaso(3));
//			DeterminanteHipoteses det8 = new DeterminanteHipoteses("As aÃ§Ãµes da equipe multiprofissional no acolhimento e cuidado das crianÃ§as vÃ­timas de violÃªncia", new EstudoDeCaso(3));
//			DeterminanteHipoteses det9 = new DeterminanteHipoteses("Atraso no crescimento e desenvolvimento infantil e sua relaÃ§Ã£o com a violÃªncia intradomiciliar", new EstudoDeCaso(3));
//			DeterminanteHipoteses det13 = new DeterminanteHipoteses("LesÃ£o de pele", new EstudoDeCaso(3));
//			DeterminanteHipoteses det23 = new DeterminanteHipoteses("DependÃªncia quÃ­mica (Ã¡lcool)", new EstudoDeCaso(3));
//			DeterminanteHipoteses det33 = new DeterminanteHipoteses("FormaÃ§Ã£o de rede de proteÃ§Ã£o social", new EstudoDeCaso(3));
//			DeterminanteHipoteses det43 = new DeterminanteHipoteses("Cuidado centrado na famÃ­lia", new EstudoDeCaso(3));
//			DeterminanteHipoteses det53 = new DeterminanteHipoteses("NutriÃ§Ã£o da crianÃ§a inadequada", new EstudoDeCaso(3));
//			DeterminanteHipoteses det63 = new DeterminanteHipoteses("Higiene do ambiente e do corpo", new EstudoDeCaso(3));
//			DeterminanteHipoteses det73 = new DeterminanteHipoteses("CalendÃ¡rio vacinal da crianÃ§a", new EstudoDeCaso(3));
//			
//			
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det2);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det3);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det4);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det5);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det6);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det7);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det8);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det9);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det13);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det23);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det33);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det43);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det53);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det63);
//			Fachada.getInstancia().adicionarDeterminanteHipoteses(det73);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		sf.getCurrentSession().getTransaction().commit();
	}
	
	public static void execCadastrarFeedBacksProfessor(){
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		try {
			Planejamento pontos = new Planejamento();
			pontos.setId(1);
			AvaliacaoProfessor avaliacao = new AvaliacaoProfessor("A", "Lorem Ipsum Ã© simplesmente uma simulaÃ§Ã£o de texto da indÃºstria tipogrÃ¡fica e de impressos, e vem sendo utilizado desde o sÃ©culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
			pontos.setAvaliacaoProfessor(avaliacao);
			
			AvaliacaoProfessor avaliacao2 = new AvaliacaoProfessor("C", "Lorem Ipsum Ã© simplesmente uma simulaÃ§Ã£o de texto da indÃºstria tipogrÃ¡fica e de impressos, e vem sendo utilizado desde o sÃ©culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
			Implementacao teorizacao = new Implementacao();
			teorizacao.setId(1);
			teorizacao.setAvaliacaoProfessor(avaliacao2);
			
			AvaliacaoProfessor avaliacao3 = new AvaliacaoProfessor("B", "Lorem Ipsum Ã© simplesmente uma simulaÃ§Ã£o de texto da indÃºstria tipogrÃ¡fica e de impressos, e vem sendo utilizado desde o sÃ©culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
			ResultadosEsperados hipoteses = new ResultadosEsperados();
			hipoteses.setId(1);
			hipoteses.setAvaliacaoProfessor(avaliacao3);
			
			Fachada.getInstancia().inserirAvaliacaoProfessor(avaliacao);
			Fachada.getInstancia().inserirAvaliacaoProfessor(avaliacao2);
			Fachada.getInstancia().inserirAvaliacaoProfessor(avaliacao3);
//			Fachada.getInstancia().atualizarPontosChave(pontos);
//			Fachada.getInstancia().atualizarTeorizacao(teorizacao);
//			Fachada.getInstancia().atualizarHipotesesDeSolucao(hipoteses);
		}catch(Exception e){
			e.printStackTrace();
		}
		sf.getCurrentSession().getTransaction().commit();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		MainPopulaBD.execMainPopulaBD();
//		MainPopulaBD.execPopulaMateriais();
//		MainPopulaBD.execCriarArqvsCurso();
//		MainPopulaBD.execCadastrarEstudosDeCasos();
//		MainPopulaBD.execCadastrarDeterminateHiposteses();
//		MainPopulaBD.execCadastrarFeedBacksProfessor();
	}

}
