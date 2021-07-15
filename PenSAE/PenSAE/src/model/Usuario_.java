package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-10-28T20:00:38.178-0300")
@StaticMetamodel(Usuario.class)
public class Usuario_ {
	public static volatile SetAttribute<Usuario, Aluno> alunos;
	public static volatile SingularAttribute<Usuario, Boolean> cadastroLiberado;
	public static volatile SingularAttribute<Usuario, Date> dataCadastro;
	public static volatile SingularAttribute<Usuario, Date> dataNascimento;
	public static volatile SingularAttribute<Usuario, String> email;
	public static volatile SingularAttribute<Usuario, Integer> estadoCivil;
	public static volatile SetAttribute<Usuario, Glossario> glossarios;
	public static volatile SingularAttribute<Usuario, Integer> id;
	public static volatile SingularAttribute<Usuario, String> instituicao;
	public static volatile SingularAttribute<Usuario, String> login;
	public static volatile SingularAttribute<Usuario, String> nome;
	public static volatile SingularAttribute<Usuario, Integer> numFilhos;
	public static volatile SingularAttribute<Usuario, Integer> perfil;
	public static volatile SetAttribute<Usuario, Professor> professors;
	public static volatile SingularAttribute<Usuario, Integer> rendaFamiliar;
	public static volatile SingularAttribute<Usuario, String> senha;
	public static volatile SingularAttribute<Usuario, Integer> sexo;
	public static volatile SetAttribute<Usuario, UsuarioHasIdioma> usuarioHasIdiomas;
}
