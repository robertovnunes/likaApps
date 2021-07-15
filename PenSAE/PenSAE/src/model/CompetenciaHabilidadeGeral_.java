package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.643-0300")
@StaticMetamodel(CompetenciaHabilidadeGeral.class)
public class CompetenciaHabilidadeGeral_ {
	public static volatile SingularAttribute<CompetenciaHabilidadeGeral, String> descricao;
	public static volatile SetAttribute<CompetenciaHabilidadeGeral, EstudoCaso> estudocasos;
	public static volatile SingularAttribute<CompetenciaHabilidadeGeral, Integer> id;
}
