package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.641-0300")
@StaticMetamodel(Cipe.class)
public class Cipe_ {
	public static volatile SingularAttribute<Cipe, Integer> codigo;
	public static volatile SingularAttribute<Cipe, String> descricaoConceito;
	public static volatile SetAttribute<Cipe, DiagnosticoAluno> diagnosticoalunos;
	public static volatile SetAttribute<Cipe, DiagnosticoProfessor> diagnosticoprofessors;
	public static volatile SingularAttribute<Cipe, String> eixo;
	public static volatile SingularAttribute<Cipe, Integer> idcipe;
	public static volatile SetAttribute<Cipe, IntervencaoAluno> intervencaoalunos;
	public static volatile SetAttribute<Cipe, IntervencaoProfessor> intervencaoprofessors;
	public static volatile SingularAttribute<Cipe, String> termo;
	public static volatile SingularAttribute<Cipe, String> versao;
}
