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
		
//		Curso curso1 = new Curso(0, "O Processo de Enfermagem Aplicado ???? Crian????a de 0 a 2 anos", "Este curso tem por objetivo desenvolver no aluno compet????ncias e habilidades relacionadas ao exerc????cio do Processo de Enfermagem no atendimento ???? crian????a de 0 a 2 anos. O curso est???? estruturado no m????todo de ensino do Arco de Charles Maguerez (Metodologia da Problematiza????????o), sendo formado por tr????s cen????rios educativos (situa????????es-problemas) de n????veis de complexidade progressivos. Durante o curso o aluno contextualizar???? a aprendizagem para a realidade social da crian????a atendida no servi????o de puericultura, propondo um planejamento do cuidado ???? luz da Classifica????????o Internacional de Pr????ticas de Enfermagem em Sa????de Coletiva (CIPESC).",
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
//		Material mat3 = new Material("Mesa cl????nica",Material.GERAL);
//		Material mat4 = new Material("Arm????rio para guardar os prontu????rios e receitu????rios",Material.GERAL);
//		Material mat5 = new Material("Computador e impressora",Material.GERAL);
//		Material mat6 = new Material("Fog????o",Material.GERAL);
//		Material mat7 = new Material("Abajur",Material.GERAL);
//		Material mat8 = new Material("Geladeira",Material.GERAL);
//		Material mat9 = new Material("Televis????o",Material.GERAL);
//		Material mat10 = new Material("Aparelho de DVD/BLU-RAY",Material.GERAL);
//		Material mat11 = new Material("Suporte para ?????lcool gel/sab????o l????quido",Material.GERAL);
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
//		Material mate2 = new Material("?????lcool 70%",Material.USO_CORRENTE);
//		Material mate3 = new Material("Algod????o",Material.USO_CORRENTE);
//		Material mate4 = new Material("Papel of????cio",Material.USO_CORRENTE);
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
		
//		Material mater1 = new Material("Balan????a pedi????trica",Material.USO_CLINICO);
//		Material mater2 = new Material("R????gua antropom????trica",Material.USO_CLINICO);
//		Material mater3 = new Material("Estetosc????pio com duas pe????as tor????cicas (diafragma e camp????nula)",Material.USO_CLINICO);
//		Material mater4 = new Material("Esfigmoman????metro",Material.USO_CLINICO);
//		Material mater5 = new Material("Monitor card????aco",Material.USO_CLINICO);
//		Material mater6 = new Material("Term????metro",Material.USO_CLINICO);
//		Material mater7 = new Material("Eletrocardi????grafo",Material.USO_CLINICO);
//		Material mater8 = new Material("Glicos????metro",Material.USO_CLINICO);
//		Material mater9 = new Material("Fita m????trica",Material.USO_CLINICO);
//		Material mater10 = new Material("Lanterna",Material.USO_CLINICO);
//		Material mater11 = new Material("Otosc????pio",Material.USO_CLINICO);
//		Material mater12 = new Material("Ventilador mec????nico",Material.USO_CLINICO);
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
			
//			EstudoDeCaso estudo = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "Aten????????o de Enfermagem ???? Crian????a Sadia", "Objetivos Gerais do Estudo de Caso", "Objetivos Espec????ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "MARIA RODRIGUES LIMA, FEMININA, NASCIDA A TERMO COM 3.250g E APGAR NO PRIMEIRO E QUINTO MINUTOS DE 8 E 10 RESPECTIVAMENTE, ????? ACOMPANHADA DESDE O PRIMEIRO M????S DE VIDA PELA ENFERMEIRA NO SERVI?????O DE PUERICULTURA. A M????E DE MARIA SEMPRE SE MOSTROU INTERESSADA EM SEGUIR AS ORIENTA??????????ES DA ENFERMEIRA. ELA NUNCA FALTOU A UMA CONSULTA E SEU ESPOSO, SEMPRE QUANDO N????O EST????? TRABALHANDO, ACOMPANHA A FAM?????LIA. AOS 4 MESES DE VIDA MARIA FOI LEVADA POR SUA M????E PARA MAIS UMA CONSULTA DE ROTINA. A ENFERMEIRA RESPONS?????VEL PELO SERVI?????O PERGUNTOU A GENITORA SOBRE O ESTADO DE SA????DE ATUAL DA CRIAN?????A. ???????MINHA FILHA VAI MUITO BEM GRA?????AS A DEUS, ELA AINDA N????O SABE O QUE ????? UMA GRIPE E NEM O QUE ????? UMA DOR DE BARRIGA...???????? (SIC). PREOCUPADA COM O TEMPO PARA PREENCHER AS FICHAS DA PUERICULTURA, A ENFERMEIRA INTERROMPEU A ANAMNESE E INICIOU A AVALIA?????????O DO CRESCIMENTO INFANTIL, OBTENDO ASSIM OS SEGUINTES DADOS: PESO DE 6.950g; 41 CM DE PER?????METRO CEF?????LICO; 65 CM DE COMPRIMENTO; ?????NDICE DE MASSA CORPORAL (IMC) DE 16,4; PER?????METRO BRAQUIAL DE 14 CM; PREGA CUT?????NEA TRICIPITAL DE 9,8 MM E PREGA CUT?????NEA SUBESCAPULAR DE 9,2 MM. A ENFERMEIRA TAMB?????M VERIFICOU QUE MARIA APRESENTAVA OS SEGUINTES MARCOS DO DESENVOLVIMENTO: RESPONDIA ATIVAMENTE AO CONTATO SOCIAL; EMITIA E LOCALIZAVA SONS;  SUSTENTAVA A CABE?????A QUANDO EM DEC????BITO DORSAL E VENTRAL; MUDAVA DE POSI?????????O ATIVAMENTE (ROLAVA QUANDO DEITADA EM SUPERF?????CIE PLANA); PEGAVA PEQUENOS OBJETOS, TRANSFERIA-OS DE UMA M????O PARA A OUTRA E LEVAVA OS OBJETOS ????? BOCA. O CALEND?????RIO VACINAL ANALISADO PELA ENFERMEIRA DEMONSTRAVA QUE MARIA ESTAVA EM DIA COM AS VACINAS RECOMENDADAS PARA A IDADE CONFORME O PROGRAMA NACIONAL DE IMUNIZA?????????O. ELA J????? HAVIA RECEBIDO UMA DOSE DE BCG, HEPATITE B, A 1???? DOSE DA VACINA MENINGOC?????CICA C (CONJUGADA) E A 1???? E 2???? DOSES DAS VACINAS: PENTAVALENTE (DTP+ Hib+ HB), VACINA INATIVADA POLIOMIELITE (VIP), VACINA ORAL CONTRA O ROTAV?????RUS HUMANO (VORH) E PNEUMOC?????CICA 10 (CONJUGADA). A ENFERMEIRA APROVEITOU A OPORTUNIDADE PARA PARABENIZAR A M????E E ORIENT?????-LA QUANTO AO AGENDAMENTO DAS PR?????XIMAS VACINAS. AO EXAME F?????SICO MARIA MOSTROU-SE: ATIVA, AFEBRIL (36.4????C), NORMOCORADA, PELE ?????NTEGRA, FONTANELA ANTERIOR ABERTA (NORMOTENSA) E POSTERIOR FECHADA. PAVILH????O AURICULAR INDOLOR ????? PRESS????O NA REGI????O DO TRAGUS, AUS????NCIA DE SECRE?????????O NO CONDUTO AUDITIVO EXTERNO. SUSTENTA?????????O DO PESCO?????O COMPAT?????VEL COM A IDADE E SEM ANORMALIDADES. T?????RAX SIM?????TRICO COM EXPANS????O BILATERAL, EUPNEICO (FR 35 RPM), PRESEN?????A DE MURM????RIOS VESICULARES EM AMBOS OS HEMIT?????RAX SEM RU?????DOS ADVENT?????CIOS. NORMOC?????RDICO (FC 136 BPM), ABD?????MEM PLANO, TIMP?????NICO, CICATRIZ UMBILICAL ?????NTEGRA. GENIT?????LIA T?????PICA FEMININA SEM ANORMALIDADES. ", 
//					imagensEc1, imgsAux1, "", curso);
//			Fachada.getInstancia().cadastrarEstudoDeCaso(estudo);
//			
//			EstudoDeCaso estudo2 = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "Aten????????o de Enfermagem ???? Crian????a em Situa????????o de Risco", "Objetivos Gerais do Estudo de Caso", "Objetivos Espec????ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "PEDRO HENRIQUE DA COSTA, 2 MESES, FOI LEVADO POR SUA M????E AO SERVI?????O DE PEURICULTURA PARA MAIS UMA CONSULTA DE ROTINA. DURANTE O ATENDIMENTO A ENFERMEIRA PERCEBEU QUE A M????E DE PEDRO SE ENCONTRAVA INQUIETA E PREOCUPADA. AO SER QUESTIONADA, A GENITORA DISSE QUE ESTAVA ANSIOSA, POIS TEMIA CHEGAR ATRASADA AO TRABALHO: ???????HOJE DE MANH???? ACORDEI J????? APERRIADA... PROCUREI ALGU?????M QUE PUDESSE TRAZER MEU FILHO ????? CONSULTA PARA N????O ME ATRASAR NO SERVI?????O, MAS N????O TEVE JEITO...NINGU?????M P?????DE ME AJUDAR...???????? (SIC). A ENFERMEIRA NOTOU QUE A CRIAN?????A TINHA BAIXA FIXA?????????O OCULAR, INTERAGIA POUCO, N????O SORRIA SOCIALMENTE QUANDO ESTIMULADA, ABRIA AS M????OS ESPONTANEAMENTE, MOVIMENTAVA ATIVAMENTE OS MEMBROS E EMITIA SONS (BALBUCIO) COM POUCA FREQU????NCIA. TAMB?????M VERIFICOU QUE A MESMA SE ENCONTRAVA COM 4.200g DE PESO; 55 CM DE COMPRIMENTO;  IMC DE 13,5 E 38,5 CM DE PER?????METRO CEF?????LICO. A M????E EXPLICOU QUE H????? UM M????S, ANTES DE INICIAR NO TRABALHO, AMAMENTAVA SEU FILHO DIARIAMENTE, MAS QUE AGORA N????O TINHA MAIS TEMPO, POR ISSO OFERECIA OUTROS ALIMENTOS: ???????N????O TIVE DIREITO A LICEN?????A MATERNIDADE, PORQUE MEU SERVI?????O ????? INFORMAL, PRECISO TRABALHAR PELA MANH???? E A TARDE PARA PODER PAGAR AS CONTAS. N????O TENHO MARIDO, MORO SOZINHA COM MINHA TIA QUE J????? ????? IDOSA E N????O TEM MAIS PACI????NCIA PARA CUIDAR DE CRIAN?????A. N????O POSSO DEIXAR MEU FILHO COM FOME O DIA INTEIRO, POR ISSO MINHA TIA ME AJUDA DANDO LEITE DE VACA, ?????GUA E SUCO PARA ELE. S????? A NOITE, QUANDO CHEGO DO SERVI?????O, ????? QUE TENHO CONDI??????????ES DE AMAMENTAR, MESMO ASSIM SINTO QUE PEDRO N????O SEGURA DIREITO O BICO DO MEU SEIO... SABE, DESDE QUE COMECEI A TRABALHAR SINTO FALTA DOS MOMENTOS QUE INTERAGIA COM ELE????????(SIC).  IGNORANDO AS QUEIXAS DA M????E SOBRE A DEFICI????NCIA NA REDE DE APOIO SOCIAL E V?????NCULO COM O B????BE, A ENFERMEIRA APENAS ORIENTOU-A QUANTO A IMPORT?????NCIA DO ALEITAMENTO MATERNO EXCLUSIVO E A POSI?????????O CORRETA DA PEGA DA CRIAN?????A AO SEIO.  TAMB?????M FOI ENSINADO COMO RETIRAR E ESTOCAR O LEITE COM SEGURAN?????A PARA OFERECER NOS HOR?????RIOS DE TRABALHO. A GENITORA SURPRESA, AFIRMOU QUE N????O TINHA CONHECIMENTO DESTAS INFORMA??????????ES.  DURANTE O EXAME F?????SICO PEDRO MOSTROU-SE: INQUIETO, IRRITADO, AFEBRIL (36.5????C), NORMOCORADO, PELE ?????NTEGRA, FONTANELAS ANTERIOR E POSTERIOR ABERTAS (NORMOTENSA). PUPILAS ISOC?????RICAS, FOTORREAGENTES, ESCLER?????TICA ANICT?????RICA, PAVILH????O AURICULAR INDOLOR ????? PRESS????O NA REGI????O DO TRAGUS, AUS????NCIA DE SECRE?????????O NO CONDUTO AUDITIVO EXTERNO. CAVIDADE ORAL SEM ANORMALIDADES, GENGIVAS NORMOCORADAS. LINFONODOS AURICULARES, OCCIPITAIS, SUBMANDIBULARES, CERVICAIS, AXILARES E INGUINAIS IMPALP?????VEIS. T?????RAX SIM?????TRICO COM EXPANS????O BILATERAL, EUPNEICO (FR 33 RPM), PRESEN?????A DE MURM????RIOS VESICULARES EM AMBOS OS HEMIT?????RAX SEM RU?????DOS ADVENT?????CIOS. NORMOC?????RDICO (FC 138 BPM), RITMO CARD?????ACO REGULAR, BULHAS NORMOFON?????TICAS EM 2 TEMPOS, BOA PERFUS????O TISSULAR PERIF?????RICA. ABD?????MEM PLANO, TIMP?????NICO, INDOLOR ????? PALPA?????????O, RU?????DOS HIDRO?????REOS PRESENTES, CICATRIZ UMBILICAL ?????NTEGRA. MEMBROS SUPERIORES E INFERIORES SIM?????TRICOS COM TONO E FOR?????A MUSCULARES PRESERVADOS. GENIT?????LIA T?????PICA MASCULINA SEM ANORMALIDADES. ", 
//					imagensEc2, imgsAux2, "", curso);
//			Fachada.getInstancia().cadastrarEstudoDeCaso(estudo2);
//			
//			EstudoDeCaso estudo3 = new EstudoDeCaso(EstudoDeCaso.ANDAMENTO, "Aten????????o de Enfermagem ???? Crian????a V????tima de Viol????ncia", "Objetivos Gerais do Estudo de Caso", "Objetivos Espec????ficos do Estudo de Caso",
//					EstudoDeCaso.ALTO, "GABRIELA SOARES SANTOS, 1 ANO E 7 MESES, RESIDE COM SUA M????E, PADRASTO E 4 IRM????OS NA PERIFERIA DA CIDADE DO RECIFE. JOS????? FREITAS, PADRASTO DE GABRIELA, ????? SERVENTE DE PEDREIRO. SUA M????E, ANT?????NIA SOARES, EST????? DESEMPREGADA H????? MAIS DE 5 MESES. DESDE QUE GABRIELA NASCEU, ANT?????NIA COME?????OU A INGERIR BEBIDAS ALCO?????LICAS. POR DUAS VEZES FOI CONDUZIDA AO SERVI?????O DE REABILITA?????????O PARA DEPENDENTES QU?????MICOS, MAS NUNCA CONCLUIU O TRATAMENTO. QUASE TODOS OS DIAS ANT?????NIA DEIXA OS SEUS FILHOS SOZINHOS EM CASA PARA BEBER NOS BARES DA REGI????O. A AGENTE DE SA????DE DA FAM?????LIA POR V?????RIAS VEZES TENTOU VISITAR A RESID????NCIA DE ANT?????NIA. J????? FAZIA UM MESES QUE ELA N????O LEVAVA GABRIELA AO SERVI?????O DE PUERICULTURA, SENDO SOLICITADA SUA BUSCA ATIVA. EM UMA DAS VISITAS, A AGENTE DE SA????DE ENCONTROU GABRIELA SOZINHA EM CASA COM SEUS 4 IRM????OS. A CASA ESTAVA DESORGANIZADA E EM M?????S CONDI??????????ES DE HIGIENE. A CRIAN?????A TINHA FEZES RESSECADAS, INDICANDO QUE HAVIA EVACUADO H????? ALGUMAS HORAS ATR?????S. A REGI????O GL????TEA ESTAVA LESIONADA POR EXPOSI?????????O CONSTANTE DA PELE ?????S SUBST?????NCIAS IRRITANTES DAS FEZES. HAVIA HEMATOMAS NOS BRA?????OS E NAS PERNAS E O CALEND?????RIO VACINAL DA CRIAN?????A ESTAVA ATRASADO.  DURANTE A VISITA, GABRIELA SE MOSTROU INQUIETA E IRRITADA, CHORANDO MUITO. A IRM???? MAIS VELHA DE 8 ANOS EXPLICOU QUE SUA  M????E SAIU CEDO PARA BEBER E QUE GABRIELA ESTAVA SEM COMER H????? MAIS DE 4 HORAS, PARA ???????ENGANAR A FOME???????? (SIC) FOI OFERECIDO A ELA REFRIGERANTE E SALGADINHOS. ???????MINHA M????E SAI SEMPRE CEDO DE CASA E VOLTA NO FINAL DA TARDE B????BADA. ?????S VEZES, ELA EST????? CALMA, MAS TEM VEZES QUE ELA EST????? IRRITADA E BATE NA GENTE QUANDO CHEGA DA RUA. NOSSA VIZINHA ????? QUEM CUIDA DE MIM E DOS MEUS IRM????OS???????? (SIC). AO TOMAR CONHECIMENTO DO FATO, A ENFERMEIRA DA UNIDADE DE SA????DE REUNIU A EQUIPE MULTIPROFISSIONAL PARA DISCUTIR O ASSUNTO. AL?????M DOS PROFISSIONAIS DE SA????DE, PARTICIPARAM DA REUNI????O OS EDUCADORES DA COMUNIDADE, OS QUAIS DEBATERAM COM A EQUIPE ESTRAT?????GIAS PARA O MONITORAMENTO DA FREQU????NCIA E RENDIMENTO ESCOLAR DAS CRIAN?????AS V?????TIMAS DE MAUS-TRATOS.  A ENFERMEIRA AGENDOU VISITAS DOMICILIARES PARA ACOMPANHAMENTO DA FAM?????LIA DE ANT?????NIA PELA PSIC?????LOGA E A ASSISTENTE SOCIAL. VIABILIZOU O ATENDIMENTO DE GABRIELA AO SERVI?????O DE PUERICULTURA E ENCAMINHOU ANT?????NIA AO PROGRAMA COMUNIT?????RIO DE AUX?????LIO, ORIENTA?????????O E TRATAMENTO A ALCO?????LATRAS. POR SE TRATAR DE UM CASO DE NEGLIG????NCIA E VIOL????NCIA F?????SICA CONTRA A CRIAN?????A, O CONSELHO TUTELAR FOI NOTIFICADO. EM UMA DAS CONSULTAS DE GABRIELA AO SERVI?????O DE PUERICULTURA A ENFERMEIRA OBSERVOU QUE A CRIAN?????A AINDA N????O FALAVA PALAVRAS COMPREENS?????VEIS, TINHA DIFICULDADE PARA CONSTRUIR TORRE DE TR????S CUBOS E APONTAR PARA OBJETOS OU FIGURAS PR?????XIMAS. GABRIELA ESTAVA COM 9300g DE PESO; 79 CM DE COMPRIMENTO; ?????NDICE DE MASSA CORPORAL DE 14,9; PER?????METRO CEF?????LICO DE 46 CM; PER?????METRO BRAQUIAL DE 12,7 CM; PREGA CUT?????NEA TRICIPITAL DE 8,3 MM E PREGA CUT?????NEA SUBESCAPULAR DE 7,5 MM.  AO EXAME F?????SICO, GABRIELA MOSTROU-SE: INQUIETA, IRRITADA, AFEBRIL (36.2????C), HIPOCORADA (+/4+), PUPILAS ISOC?????RICAS, FOTORREAGENTES, ESCLER?????TICA ANICT?????RICA. PAVILH????O AURICULAR INDOLOR ????? PRESS????O NA REGI????O DO TRAGUS, AUS????NCIA DE SECRE?????????O NO CONDUTO AUDITIVO EXTERNO. CAVIDADE ORAL SEM ANORMALIDADES, GENGIVAS HIPOCORADAS (+/4+). LINFONODOS AURICULARES, OCCIPITAIS, SUBMANDIBULARES, CERVICAIS, AXILARES E INGUINAIS IMPALP?????VEIS. T?????RAX SIM?????TRICO COM EXPANS????O BILATERAL, EUPNEICA (FR 29 RPM), PRESEN?????A DE MURM????RIOS VESICULARES EM AMBOS OS HEMIT?????RAX SEM RU?????DOS ADVENT?????CIOS. NORMOC?????RDICA (FC 110 BPM), RITMO CARD?????ACO REGULAR, BULHAS NORMOFON?????TICAS EM 2 TEMPOS, BOA PERFUS????O TISSULAR PERIF?????RICA. ABD?????MEM PLANO, TIMP?????NICO, INDOLOR ????? PALPA?????????O, RU?????DOS HIDRO?????REOS PRESENTES, CICATRIZ UMBILICAL ?????NTEGRA. MEMBROS SUPERIORES E INFERIORES SIM?????TRICOS COM TONO E FOR?????A MUSCULARES PRESERVADOS. PRESEN?????A DE HEMATOMAS EM AMBOS OS BRA?????OS E PERNAS. GENIT?????LIA T?????PICA FEMININA SEM ANORMALIDADES. ????LCERAS CONFLUENTES COM MODERADA EXSUDA?????????O EM REGI????O GL????TEA, EST?????GIO III, CICATRIZANDO POR 2???? INTEN?????????O, REGI????O PERILESIONAL MACERADA COM ?????REAS DE EPITELIZA?????????O, BORDAS IRREGULARES COM MARGENS ADERIDAS, LEITO COM PRESEN?????A DE TECIDO DE GRANULA?????????O.", 
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
//			DeterminanteHipoteses det2 = new DeterminanteHipoteses("T????cnica segura de amamenta????????o", new EstudoDeCaso(2));
//			DeterminanteHipoteses det3 = new DeterminanteHipoteses("O cuidado centrado na fam????lia e na crian????a", new EstudoDeCaso(2));
//			DeterminanteHipoteses det4 = new DeterminanteHipoteses("Forma????????o de rede de apoio social", new EstudoDeCaso(2));
//			DeterminanteHipoteses det5 = new DeterminanteHipoteses("Desenvolvimento da rela????????o de v????nculo/apego", new EstudoDeCaso(2));
//			DeterminanteHipoteses det6 = new DeterminanteHipoteses("Nutri????????o inadequada do lactente e sua rela????????o com o atraso no crescimento e desenvolvimento infantil", new EstudoDeCaso(2));
//			
//			
//			DeterminanteHipoteses det7 = new DeterminanteHipoteses("Viol????ncia intradomiciliar", new EstudoDeCaso(3));
//			DeterminanteHipoteses det8 = new DeterminanteHipoteses("As a????????es da equipe multiprofissional no acolhimento e cuidado das crian????as v????timas de viol????ncia", new EstudoDeCaso(3));
//			DeterminanteHipoteses det9 = new DeterminanteHipoteses("Atraso no crescimento e desenvolvimento infantil e sua rela????????o com a viol????ncia intradomiciliar", new EstudoDeCaso(3));
//			DeterminanteHipoteses det13 = new DeterminanteHipoteses("Les????o de pele", new EstudoDeCaso(3));
//			DeterminanteHipoteses det23 = new DeterminanteHipoteses("Depend????ncia qu????mica (????lcool)", new EstudoDeCaso(3));
//			DeterminanteHipoteses det33 = new DeterminanteHipoteses("Forma????????o de rede de prote????????o social", new EstudoDeCaso(3));
//			DeterminanteHipoteses det43 = new DeterminanteHipoteses("Cuidado centrado na fam????lia", new EstudoDeCaso(3));
//			DeterminanteHipoteses det53 = new DeterminanteHipoteses("Nutri????????o da crian????a inadequada", new EstudoDeCaso(3));
//			DeterminanteHipoteses det63 = new DeterminanteHipoteses("Higiene do ambiente e do corpo", new EstudoDeCaso(3));
//			DeterminanteHipoteses det73 = new DeterminanteHipoteses("Calend????rio vacinal da crian????a", new EstudoDeCaso(3));
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
			AvaliacaoProfessor avaliacao = new AvaliacaoProfessor("A", "Lorem Ipsum ???? simplesmente uma simula????????o de texto da ind????stria tipogr????fica e de impressos, e vem sendo utilizado desde o s????culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
			pontos.setAvaliacaoProfessor(avaliacao);
			
			AvaliacaoProfessor avaliacao2 = new AvaliacaoProfessor("C", "Lorem Ipsum ???? simplesmente uma simula????????o de texto da ind????stria tipogr????fica e de impressos, e vem sendo utilizado desde o s????culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
			Implementacao teorizacao = new Implementacao();
			teorizacao.setId(1);
			teorizacao.setAvaliacaoProfessor(avaliacao2);
			
			AvaliacaoProfessor avaliacao3 = new AvaliacaoProfessor("B", "Lorem Ipsum ???? simplesmente uma simula????????o de texto da ind????stria tipogr????fica e de impressos, e vem sendo utilizado desde o s????culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. ");
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
