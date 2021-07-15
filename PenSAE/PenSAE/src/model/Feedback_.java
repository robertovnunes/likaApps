package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-10-28T19:57:07.863-0300")
@StaticMetamodel(Feedback.class)
public class Feedback_ {
	public static volatile SingularAttribute<Feedback, Aluno> aluno;
	public static volatile SingularAttribute<Feedback, Curso> curso;
	public static volatile SingularAttribute<Feedback, Date> data;
	public static volatile SingularAttribute<Feedback, Integer> idAvaliacao;
	public static volatile SingularAttribute<Feedback, String> respostaDois;
	public static volatile SingularAttribute<Feedback, String> respostaUm;
}
