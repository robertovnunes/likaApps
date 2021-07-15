package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-10-10T18:39:53.207-0300")
@StaticMetamodel(AlunoEstudoCaso.class)
public class AlunoEstudoCaso_ {
	public static volatile SingularAttribute<AlunoEstudoCaso, Aluno> aluno;
	public static volatile SetAttribute<AlunoEstudoCaso, Avaliacao> avaliacaos;
	public static volatile SetAttribute<AlunoEstudoCaso, DiagnosticoAluno> diagnosticoalunos;
	public static volatile SingularAttribute<AlunoEstudoCaso, EstudoCaso> estudocaso;
	public static volatile SingularAttribute<AlunoEstudoCaso, Integer> faseAtual;
	public static volatile SingularAttribute<AlunoEstudoCaso, Integer> id;
	public static volatile SetAttribute<AlunoEstudoCaso, PontoChaveAluno> pontochavealunos;
	public static volatile SetAttribute<AlunoEstudoCaso, Referencia> referencias;
}
