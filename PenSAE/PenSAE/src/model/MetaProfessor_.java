package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.655-0300")
@StaticMetamodel(MetaProfessor.class)
public class MetaProfessor_ {
	public static volatile SingularAttribute<MetaProfessor, String> descricao;
	public static volatile SetAttribute<MetaProfessor, DiagnosticoProfessor> diagnosticoprofessors;
	public static volatile SingularAttribute<MetaProfessor, Integer> id;
	public static volatile SetAttribute<MetaProfessor, IntervencaoProfessor> intervencaoprofessors;
}
