package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.645-0300")
@StaticMetamodel(DiagnosticoAluno.class)
public class DiagnosticoAluno_ {
	public static volatile SingularAttribute<DiagnosticoAluno, AlunoEstudoCaso> alunoestudocaso;
	public static volatile SingularAttribute<DiagnosticoAluno, Cipe> cipe;
	public static volatile SingularAttribute<DiagnosticoAluno, String> descricao;
	public static volatile SingularAttribute<DiagnosticoAluno, Integer> id;
	public static volatile SetAttribute<DiagnosticoAluno, MetaAluno> metaalunos;
	public static volatile SingularAttribute<DiagnosticoAluno, PontoChaveAluno> pontochavealuno;
}
