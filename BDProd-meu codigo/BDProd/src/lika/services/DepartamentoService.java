package lika.services;

import java.util.List;

import lika.model.Departamento;

public interface DepartamentoService extends CRUDInterface<Departamento> {

	public List<Departamento> listarDepartamentos();

}
