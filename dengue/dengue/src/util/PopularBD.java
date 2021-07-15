package util;

import java.io.FileInputStream;
import java.io.InputStream;

import model.endereco.Logradouro;
import model.endereco.Pais;
import model.endereco.Residencia;
import model.sistema.Arquivo;
import model.usuario.Usuario;

import org.apache.commons.io.IOUtils;
import org.hibernate.SessionFactory;

import dados.hibernate.HibernateUtil;
import fachada.Fachada;

public class PopularBD {

	/**
	 * @param args
	 */
	public static void main(String[] args) {


//		inserirUsuarioPaulo();
		inserirUsuarioRosalie();

	}

	private static void inserirUsuarioPaulo() {
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		
		InputStream input;
		
		try{
		Arquivo arqv1 = new Arquivo();
		
		Fachada fachada = Fachada.getInstancia();
		arqv1.setExtensao("application/pdf");
		arqv1.setNomeArqv("caderneta_saude_crianca.pdf");
		input = new FileInputStream("C:\\LIKA\\Dengue\\FernandoPessoaAssinatura.png");
		byte[] arraybytes = IOUtils.toByteArray(input);
		arqv1.setDadosArqv(arraybytes);
		
		Residencia residencia = new Residencia();
		Pais paisTemp = new Pais();
		paisTemp.setNumeroCodificacao(Integer.parseInt("1058"));
		
		Logradouro logradouroTemp = fachada.getLogradouroPorCep("53439110");
		
		Residencia enderecoUsuario = new Residencia(logradouroTemp,"180","06","",null,null,paisTemp);

		enderecoUsuario =  fachada.inserirResidencia(enderecoUsuario);
		Usuario usuario = new Usuario();
		usuario.setResidencia(enderecoUsuario);
		usuario.setNome("Paulo Diniz");
		usuario.setLogin("paulo");
		usuario.setEmail("paulo.otavio01@gmail.com");
		usuario.setCelular("81 95210119");
		usuario.setCpf("07676438446");
		usuario.setSenha("paulo123");
		usuario.setTelefone("81 34342190");
		usuario.setSexo("Masculino");
		usuario.setAssinatura(arqv1);
		usuario = fachada.insertUsuario(usuario);
		
		
		sf.getCurrentSession().getTransaction().commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void inserirUsuarioRosalie() {
		SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		sf.getCurrentSession().beginTransaction();
		
		InputStream input;
		
		try{
		Arquivo arqv1 = new Arquivo();
		
		Fachada fachada = Fachada.getInstancia();
		arqv1.setExtensao("application/pdf");
		arqv1.setNomeArqv("caderneta_saude_crianca.pdf");
		input = new FileInputStream("C:\\LIKA\\Dengue\\assinatura.png");
		byte[] arraybytes = IOUtils.toByteArray(input);
		arqv1.setDadosArqv(arraybytes);
		
		Residencia residencia = new Residencia();
		Pais paisTemp = new Pais();
		paisTemp.setNumeroCodificacao(Integer.parseInt("1058"));
		
		Logradouro logradouroTemp = fachada.getLogradouroPorCep("53439110");
		
		Residencia enderecoUsuario = new Residencia(logradouroTemp,"180","06","",null,null,paisTemp);

		enderecoUsuario =  fachada.inserirResidencia(enderecoUsuario);
		Usuario usuario = new Usuario();
		usuario.setResidencia(enderecoUsuario);
		usuario.setNome("Rosalie Belian");
		usuario.setLogin("rosalie");
		usuario.setEmail("rosalie.belian@gmail.com");
		usuario.setCelular("81 95210119");
		usuario.setCpf("07676438446");
		usuario.setSenha("paulo123");
		usuario.setTelefone("81 34342190");
		usuario.setSexo("Feminino");
		usuario.setAssinatura(arqv1);
		usuario = fachada.insertUsuario(usuario);
		
		
		sf.getCurrentSession().getTransaction().commit();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
