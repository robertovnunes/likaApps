package lika.services;

import lika.model.Equipamento;

public interface EquipamentoService extends CRUDInterface<Equipamento> {

	public void refresh(Equipamento p);

}
