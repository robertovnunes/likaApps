package hpdd.web;

import hpdd.images.Images;
import hpdd.images.ImagesRN;
import hpdd.web.util.ContextoUtil;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean(name = "imagesBean")
@RequestScoped
public class ImagesBean {
	private Images selected = new Images();
	private List<Images> list = null;
	
	public String save(){
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		ImagesRN imagesRN = new ImagesRN();
		this.selected.setNotification(imagesRN.getNotification(contextoBean.getLoggedUser().getIduser()));
		imagesRN.save(this.selected);
		this.selected = new Images();
		this.list = null;
		return "imagesCreated";
		
		
	}
	//public void edit(){
		
	//}
	public void delete(){
		ImagesRN imagesRN = new ImagesRN();
		imagesRN.delete(this.selected);
		this.selected = new Images();
		this.list = null;
		
	}
	public Images getSelected() {
		return selected;
	}
	public void setSelected(Images selected) {
		this.selected = selected;
	}
	public List<Images> getList() {
		if(this.list == null) {
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			
			ImagesRN imagesRN = new ImagesRN();
			this.list = imagesRN.list(contextoBean.getLoggedUser());
		}
		return this.list;
	}
}
