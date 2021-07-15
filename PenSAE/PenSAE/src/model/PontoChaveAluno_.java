package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.656-0300")
@StaticMetamodel(PontoChaveAluno.class)
public class PontoChaveAluno_ {
	public static volatile SingularAttribute<PontoChaveAluno, AlunoEstudoCaso> alunoestudocaso;
	public static volatile SetAttribute<PontoChaveAluno, DiagnosticoAluno> diagnosticoalunos;
	public static volatile SingularAttribute<PontoChaveAluno, Integer> id;
	public static volatile SingularAttribute<PontoChaveAluno, String> justificativa;
	public static volatile SingularAttribute<PontoChaveAluno, String> nome;
}
