/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package dados.basicas;

import java.util.List;

import model.Livro;

/**
 *
 * @author José Alexandre
 */
public interface LivroDao {

    public void save(Livro livro);
    public Livro getLivro(long id);
    public List<Livro> list();
    public void remove(Livro livro);
    public void update(Livro livro);

}
