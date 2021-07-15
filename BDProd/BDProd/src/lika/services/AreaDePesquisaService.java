package lika.services;

import java.util.List;

import lika.model.AreaDePesquisa;
import lika.model.SubAreaDePesquisa;

public interface AreaDePesquisaService extends CRUDInterface<AreaDePesquisa> {

	List<SubAreaDePesquisa> listarSubAreas(AreaDePesquisa area);

}
