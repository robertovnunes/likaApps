package dados.basicas;

import java.util.List;

import dados.DAOGenerico;
import model.curso.matricula.arcomaguerez.HyperLink;

public interface HyperLinkDAO extends DAOGenerico<HyperLink, Integer> {

	public List<HyperLink> getTodosHyperLinks();
}
