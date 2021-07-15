package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.661-0300")
@StaticMetamodel(UsuarioHasIdioma.class)
public class UsuarioHasIdioma_ {
	public static volatile SingularAttribute<UsuarioHasIdioma, UsuarioHasIdiomaPK> id;
	public static volatile SingularAttribute<UsuarioHasIdioma, Idioma> idioma;
	public static volatile SingularAttribute<UsuarioHasIdioma, Integer> score;
	public static volatile SingularAttribute<UsuarioHasIdioma, Usuario> usuario;
}
