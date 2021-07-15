 package br.com.lika.hpv.model.usuario;
 
 import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.Email;
import org.hibernate.validator.NotEmpty;
import org.hibernate.validator.NotNull;

import antlr.collections.impl.Vector;
import br.com.lika.hpv.model.formulario.HistoricoModificacoes;
 
 @Entity(name="usuario")
 @Inheritance(strategy=InheritanceType.SINGLE_TABLE)
 @Table(uniqueConstraints={@javax.persistence.UniqueConstraint(columnNames={"login"})})
 public class Usuario
 {
 
   @Id
   @GeneratedValue
   private Long id;
 
   @Column(length=100, nullable=false)
   private String nome;
 
   @Column(length=20)
   @NotEmpty(message="Campo de login não pode ser vazio")
   @NotNull(message="Campo de login não pode ser vazio")
   private String login;
 
   @NotEmpty(message="Campo de senha não pode ser vazio")
   @NotNull(message="Campo de senha não pode ser vazio")
   @Column(length=30, nullable=false)
   private String senha;
 
   @Column(length=50)
   @Email(message="Este não é um email válido")
   private String email;
   private Character acessoAdministrador;
   private Character acessoFormularioClinico;
   private Character acessoViralClamidia;
   private Character acessoViralHbv;
   private Character acessoViralHcv;
   private Character acessoViralHiv;
   private Character acessoViralHpv;
   private Character acessoViralSifilis;
   private Character acessoCitopato;
   private Character acessoAmostras;
   private Character acessoAnexos;

   
   @OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, targetEntity=HistoricoModificacoes.class, mappedBy="usuario")
   private List<HistoricoModificacoes> historicoModificacoes;
   
   public Usuario(){
	   this.historicoModificacoes = new ArrayList<HistoricoModificacoes>();
   }
   
   
   public Long getId()
   {
     return this.id;
   }
   public void setId(Long id) {
     this.id = id;
   }
   public String getNome() {
     return this.nome;
   }
   public void setNome(String nome) {
     this.nome = nome;
   }
   public String getLogin() {
     return this.login;
   }
   public void setLogin(String login) {
     this.login = login;
   }
   public String getSenha() {
     return this.senha;
   }
   public void setSenha(String senha) {
     this.senha = senha;
   }
   public String getEmail() {
     return this.email;
   }
   public void setEmail(String email) {
     this.email = email;
   }
   public Character getAcessoAdministrador() {
     return this.acessoAdministrador;
   }
   public void setAcessoAdministrador(Character acessoAdministrador) {
     this.acessoAdministrador = acessoAdministrador;
   }
   public Character getAcessoFormularioClinico() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoFormularioClinico;
   }
   public void setAcessoFormularioClinico(Character acessoFormularioClinico) {
     this.acessoFormularioClinico = acessoFormularioClinico;
   }
   public Character getAcessoViralClamidia() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralClamidia;
   }
   public void setAcessoViralClamidia(Character acessoViralClamidia) {
     this.acessoViralClamidia = acessoViralClamidia;
   }
   public Character getAcessoViralHbv() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralHbv;
   }
   public void setAcessoViralHbv(Character acessoViralHbv) {
     this.acessoViralHbv = acessoViralHbv;
   }
   public Character getAcessoViralHcv() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralHcv;
   }
   public void setAcessoViralHcv(Character acessoViralHcv) {
     this.acessoViralHcv = acessoViralHcv;
   }
   public Character getAcessoViralHiv() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralHiv;
   }
   public void setAcessoViralHiv(Character acessoViralHiv) {
     this.acessoViralHiv = acessoViralHiv;
   }
   public Character getAcessoViralHpv() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralHpv;
   }
   public void setAcessoViralHpv(Character acessoViralHpv) {
     this.acessoViralHpv = acessoViralHpv;
   }
   public Character getAcessoViralSifilis() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoViralSifilis;
   }
   public void setAcessoViralSifilis(Character acessoViralSifilis) {
     this.acessoViralSifilis = acessoViralSifilis;
   }
   public Character getAcessoCitopato() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoCitopato;
   }
   public void setAcessoCitopato(Character acessoCitopato) {
     this.acessoCitopato = acessoCitopato;
   }
   public Character getAcessoAmostras() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoAmostras;
   }
   public void setAcessoAmostras(Character acessoAmostras) {
     this.acessoAmostras = acessoAmostras;
   }
   public Character getAcessoAnexos() {
     if (administrador()) return Character.valueOf('Y');
     return this.acessoAnexos;
   }
   public void setAcessoAnexos(Character acessoAnexos) {
     this.acessoAnexos = acessoAnexos;
   }
 
   private boolean administrador() {
     return (this.acessoAdministrador != null) && (this.acessoAdministrador.charValue() == 'Y');
   }
 
   public boolean temAcessoAoSistema()
   {
     return ((this.acessoAdministrador != null) && (this.acessoAdministrador.charValue() == 'Y')) || 
       ((this.acessoAmostras != null) && (this.acessoAmostras.charValue() == 'Y')) || 
       ((this.acessoAnexos != null) && (this.acessoAnexos.charValue() == 'Y')) || 
       ((this.acessoCitopato != null) && (this.acessoCitopato.charValue() == 'Y')) || 
       ((this.acessoFormularioClinico != null) && (this.acessoFormularioClinico.charValue() == 'Y')) || 
       ((this.acessoViralClamidia != null) && (this.acessoViralClamidia.charValue() == 'Y')) || 
       ((this.acessoViralHbv != null) && (this.acessoViralHbv.charValue() == 'Y')) || 
       ((this.acessoViralHcv != null) && (this.acessoViralHcv.charValue() == 'Y')) || 
       ((this.acessoViralHiv != null) && (this.acessoViralHiv.charValue() == 'Y')) || 
       ((this.acessoViralHpv != null) && (this.acessoViralHpv.charValue() == 'Y')) || (
       (this.acessoViralSifilis != null) && (this.acessoViralSifilis.charValue() == 'Y'));
   }
public List<HistoricoModificacoes> getHistoricoModificacoes() {
	return historicoModificacoes;
}
public void setHistoricoModificacoes(
		List<HistoricoModificacoes> historicoModificacoes) {
	this.historicoModificacoes = historicoModificacoes;
}
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.model.usuario.Usuario
 * JD-Core Version:    0.6.0
 */