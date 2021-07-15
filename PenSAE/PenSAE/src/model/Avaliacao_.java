package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.640-0300")
@StaticMetamodel(Avaliacao.class)
public class Avaliacao_ {
	public static volatile SingularAttribute<Avaliacao, AlunoEstudoCaso> alunoestudocaso;
	public static volatile SingularAttribute<Avaliacao, String> comentarioFinal;
	public static volatile SingularAttribute<Avaliacao, String> comentarioHipoteses;
	public static volatile SingularAttribute<Avaliacao, String> comentarioObservacao;
	public static volatile SingularAttribute<Avaliacao, String> comentarioPlanoCuidados;
	public static volatile SingularAttribute<Avaliacao, String> comentarioPontoChave;
	public static volatile SingularAttribute<Avaliacao, String> comentarioTeorizacao;
	public static volatile SingularAttribute<Avaliacao, Integer> id;
	public static volatile SingularAttribute<Avaliacao, Integer> notaFinal;
	public static volatile SingularAttribute<Avaliacao, Integer> notaHipoteses;
	public static volatile SingularAttribute<Avaliacao, Integer> notaObservacao;
	public static volatile SingularAttribute<Avaliacao, Integer> notaPlanoCuidados;
	public static volatile SingularAttribute<Avaliacao, Integer> notaPontoChave;
	public static volatile SingularAttribute<Avaliacao, Integer> notaTeorizacao;
}
