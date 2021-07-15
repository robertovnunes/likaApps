package controller;


import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.event.ActionEvent;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import model.Livro;

import dados.basicas.LivroDao;
import dados.hibernate.conteudo.LivroHibernateDAO;

@ManagedBean(name = "livroController")
@SessionScoped
public class LivroController {

    private Livro livro;
    private DataModel<Livro> listaLivros;

    public DataModel<Livro> getListarLivros() {
        List<Livro> lista = new LivroHibernateDAO().list();
        listaLivros = new ListDataModel<Livro>(lista);
        return listaLivros;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    public void prepararAdicionarLivro(ActionEvent actionEvent){
        livro = new Livro();
    }

    public void prepararAlterarLivro(ActionEvent actionEvent){
        livro = (Livro)(listaLivros.getRowData());
    }

    public String excluirLivro(){

        Livro livroTemp = (Livro)(listaLivros.getRowData());
        LivroDao dao = new LivroHibernateDAO();
        dao.remove(livroTemp);
        return "index";

    }

    public void adicionarLivro(ActionEvent actionEvent){

        LivroDao dao = new LivroHibernateDAO();
        dao.save(livro);
        
    }

    public void alterarLivro(ActionEvent actionEvent){

        LivroDao dao = new LivroHibernateDAO();
        dao.update(livro);

    }

}
