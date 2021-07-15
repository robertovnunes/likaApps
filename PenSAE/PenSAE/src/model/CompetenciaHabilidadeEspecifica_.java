package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2013-09-29T14:46:03.642-0300")
@StaticMetamodel(CompetenciaHabilidadeEspecifica.class)
public class CompetenciaHabilidadeEspecifica_ {
	public static volatile SingularAttribute<CompetenciaHabilidadeEspecifica, String> descricao;
	public static volatile SetAttribute<CompetenciaHabilidadeEspecifica, EstudoCaso> estudocasos;
	public static volatile SingularAttribute<CompetenciaHabilidadeEspecifica, Integer> id;
}
