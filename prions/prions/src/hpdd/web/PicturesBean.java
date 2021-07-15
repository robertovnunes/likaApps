package hpdd.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import hpdd.paper.PaperRN;
import hpdd.pictures.Pictures;
import hpdd.pictures.PicturesPaper;
import hpdd.pictures.PicturesRN;
import hpdd.web.util.ContextoUtil;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;

import org.primefaces.event.FileUploadEvent;

@ManagedBean(name = "picturesBean")
@SessionScoped
public class PicturesBean {
	private List<Pictures> pictures;
	private Pictures selected = new Pictures();
	private PicturesPaper selectedPicPap = new PicturesPaper();
	private PicturesRN picturesRN = new PicturesRN();

	public Pictures getSelected() {
		return selected;
	}

	public void setSelected(Pictures selected) {
		this.selected = selected;
	}

	public PicturesPaper getSelectedPicPap() {
		return selectedPicPap;
	}

	public void setSelectedPicPap(PicturesPaper selectedPicPap) {
		this.selectedPicPap = selectedPicPap;
	}

	public void savePicture() {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selected.setNotification(null);
		PicturesRN picturesRN = new PicturesRN();
		System.out.println("ID picture = "
				+ picturesRN.getNotificationToUPDATE(contextoBean
						.getLoggedUser().getIduser()));
		this.selected.setNotification(picturesRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		picturesRN.save(this.selected);
		this.selected = new Pictures();
	}
	
	public void savePicturePaper() {

		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		this.selectedPicPap.setIndividualPaper(null);
		PaperRN paperRN = new PaperRN();
		PicturesRN picturesRN = new PicturesRN();
		this.selectedPicPap.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		picturesRN.save(this.selectedPicPap);
		this.selectedPicPap = new PicturesPaper();
	}
	
	public void fileUpload(FileUploadEvent uploadEvent) {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PicturesRN picturesRN = new PicturesRN();
		this.selected.setNotification(picturesRN
				.getNotificationToUPDATE(contextoBean.getLoggedUser()
						.getIduser()));
		this.selected.setImagem(uploadEvent.getFile().getContents());
	}
	
	public void fileUploadPicPaper(FileUploadEvent uploadEvent) {
		ContextoBean contextoBean = ContextoUtil.getContextoBean();
		PaperRN paperRN = new PaperRN();
		this.selectedPicPap.setIndividualPaper(paperRN
				.getIndividualPaper(contextoBean.getLoggedUser().getIduser()));
		this.selectedPicPap.setImagem(uploadEvent.getFile().getContents());
	}

	public void listaFotosProduto() {
		try {
			ServletContext sContext = (ServletContext) FacesContext
					.getCurrentInstance().getExternalContext().getContext();
			ContextoBean contextoBean = ContextoUtil.getContextoBean();
			pictures = picturesRN.listPictures(picturesRN
					.getNotificationToUPDATE(
							contextoBean.getLoggedUser().getIduser()).getUser()
					.getIduser());
			System.out.println("listaPictures" + pictures);
			File folder = new File(sContext.getRealPath("/temp"));
			if (!folder.exists())
				folder.mkdirs();

			for (Pictures p : pictures) {
				String nomeArquivo = p.getId() + ".jpg";
				String arquivo = sContext.getRealPath("/temp") + File.separator
						+ nomeArquivo;

				createFile(p.getImagem(), arquivo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	private void createFile(byte[] bytes, String arquivo) {
		FileOutputStream fos;

		try {
			fos = new FileOutputStream(arquivo);
			fos.write(bytes);

			fos.flush();
			fos.close();
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public List<Pictures> getPictures() {
		return pictures;
	}

	public void setPictures(List<Pictures> pictures) {
		this.pictures = pictures;
	}

}
