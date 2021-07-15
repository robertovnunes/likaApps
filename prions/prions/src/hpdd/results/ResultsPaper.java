package hpdd.results;

import hpdd.individual.IndividualPaper;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@SuppressWarnings("serial")
@Entity
@Table(name="resultspaper")
public class ResultsPaper implements Serializable {
	@Id
	@GeneratedValue
	@Column(name = "id")
	private Integer id;

	@OneToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JoinColumn(name = "cod_respap", nullable = false)
	private IndividualPaper individualPaper;
		
	@Column(name = "eeg")
	private String EEG;

	@Column(name = "result_eeg")
	private String Res_EEG;
	
	@Column(name = "mrt")
	private String MRT;   //1=pos 0=neg 2=keins 3=schl Quali 4=nicht vorliegend 5=nicht 

	@Column(name = "mri")
	private String MRI;

	@Column(name = "result_mri")
	private String Res_MRI;

	@Column(name = "prot14_3")
	private String prot14_3;

	@Column(name = "result_prot14_3")
	private String Res_prot14_3;

	@Column(name = "tau_protein")
	private String tauProtein;
	
	@Column(name = "result_tau")
	private String Res_tau;
	
	@Column(name = "genetic")
	private String genetic;

	@Column(name = "result_genetic")
	private String resGenetic;

	@Column(name = "necropsy")
	private String necropsy;

	@Column(name = "result_necropsy")
	private String resNecropsy;
	
	@Column(name = "biopsy")
	private String biopsy;

	@Column(name = "result_biopsy")
	private String resBiopsy;
	
	@Column(name = "immunohistochemistry")
	private String immunohistochemistry;

	@Column(name = "result_immunohistochemistry")
	private String resImmunohistochemistry;
	
	@Column(name = "129_codon")
	private String codon;
	
	@Column(name = "subtype_codon")
	private String subtypeCodon;
	
	@Column(name = "others")
	private String others;
	
	@Column(name = "129_codon_go")
	private String codon_go;
	
	
	@Column(name = "mutation")
	private String mutation;
	
	@Column(name = "silent_mutation")
	private String silent_mutation;
	
	@Column(name = "prp_type")
	private String prp_type;
	
	@Column(name = "molecular_subtype")
	private String molecular_subtype;
	
	@Column(name = "disease_duration")   //in months
	private String disease_duration;
	
	@Column(name = "deceased")
	private String deceased;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public IndividualPaper getIndividualPaper() {
		return individualPaper;
	}

	public void setIndividualPaper(IndividualPaper individualPaper) {
		this.individualPaper = individualPaper;
	}

	public String getEEG() {
		return EEG;
	}

	public void setEEG(String eEG) {
		EEG = eEG;
	}

	public String getRes_EEG() {
		return Res_EEG;
	}

	public void setRes_EEG(String res_EEG) {
		Res_EEG = res_EEG;
	}

	public String getMRI() {
		return MRI;
	}

	public void setMRI(String mRI) {
		MRI = mRI;
	}

	public String getRes_MRI() {
		return Res_MRI;
	}

	public void setRes_MRI(String res_MRI) {
		Res_MRI = res_MRI;
	}

	public String getProt14_3() {
		return prot14_3;
	}

	public void setProt14_3(String prot14_3) {
		this.prot14_3 = prot14_3;
	}

	public String getRes_prot14_3() {
		return Res_prot14_3;
	}

	public void setRes_prot14_3(String res_prot14_3) {
		Res_prot14_3 = res_prot14_3;
	}

	public String getTauProtein() {
		return tauProtein;
	}

	public void setTauProtein(String tauProtein) {
		this.tauProtein = tauProtein;
	}

	public String getRes_tau() {
		return Res_tau;
	}

	public void setRes_tau(String res_tau) {
		Res_tau = res_tau;
	}

	public String getGenetic() {
		return genetic;
	}

	public void setGenetic(String genetic) {
		this.genetic = genetic;
	}

	public String getResGenetic() {
		return resGenetic;
	}

	public void setResGenetic(String resGenetic) {
		this.resGenetic = resGenetic;
	}

	public String getNecropsy() {
		return necropsy;
	}

	public void setNecropsy(String necropsy) {
		this.necropsy = necropsy;
	}

	public String getResNecropsy() {
		return resNecropsy;
	}

	public void setResNecropsy(String resNecropsy) {
		this.resNecropsy = resNecropsy;
	}

	public String getBiopsy() {
		return biopsy;
	}

	public void setBiopsy(String biopsy) {
		this.biopsy = biopsy;
	}

	public String getResBiopsy() {
		return resBiopsy;
	}

	public void setResBiopsy(String resBiopsy) {
		this.resBiopsy = resBiopsy;
	}

	public String getImmunohistochemistry() {
		return immunohistochemistry;
	}

	public void setImmunohistochemistry(String immunohistochemistry) {
		this.immunohistochemistry = immunohistochemistry;
	}

	public String getResImmunohistochemistry() {
		return resImmunohistochemistry;
	}

	public void setResImmunohistochemistry(String resImmunohistochemistry) {
		this.resImmunohistochemistry = resImmunohistochemistry;
	}

	public String getCodon() {
		return codon;
	}

	public void setCodon(String codon) {
		this.codon = codon;
	}

	public String getSubtypeCodon() {
		return subtypeCodon;
	}

	public void setSubtypeCodon(String subtypeCodon) {
		this.subtypeCodon = subtypeCodon;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((EEG == null) ? 0 : EEG.hashCode());
		result = prime * result + ((MRI == null) ? 0 : MRI.hashCode());
		result = prime * result + ((Res_EEG == null) ? 0 : Res_EEG.hashCode());
		result = prime * result + ((Res_MRI == null) ? 0 : Res_MRI.hashCode());
		result = prime * result
				+ ((Res_prot14_3 == null) ? 0 : Res_prot14_3.hashCode());
		result = prime * result + ((Res_tau == null) ? 0 : Res_tau.hashCode());
		result = prime * result + ((biopsy == null) ? 0 : biopsy.hashCode());
		result = prime * result + ((codon == null) ? 0 : codon.hashCode());
		result = prime * result + ((genetic == null) ? 0 : genetic.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime
				* result
				+ ((immunohistochemistry == null) ? 0 : immunohistochemistry
						.hashCode());
		result = prime * result
				+ ((individualPaper == null) ? 0 : individualPaper.hashCode());
		result = prime * result
				+ ((necropsy == null) ? 0 : necropsy.hashCode());
		result = prime * result
				+ ((prot14_3 == null) ? 0 : prot14_3.hashCode());
		result = prime * result
				+ ((resBiopsy == null) ? 0 : resBiopsy.hashCode());
		result = prime * result
				+ ((resGenetic == null) ? 0 : resGenetic.hashCode());
		result = prime
				* result
				+ ((resImmunohistochemistry == null) ? 0
						: resImmunohistochemistry.hashCode());
		result = prime * result
				+ ((resNecropsy == null) ? 0 : resNecropsy.hashCode());
		result = prime * result
				+ ((subtypeCodon == null) ? 0 : subtypeCodon.hashCode());
		result = prime * result
				+ ((tauProtein == null) ? 0 : tauProtein.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ResultsPaper other = (ResultsPaper) obj;
		if (EEG == null) {
			if (other.EEG != null)
				return false;
		} else if (!EEG.equals(other.EEG))
			return false;
		if (MRI == null) {
			if (other.MRI != null)
				return false;
		} else if (!MRI.equals(other.MRI))
			return false;
		if (Res_EEG == null) {
			if (other.Res_EEG != null)
				return false;
		} else if (!Res_EEG.equals(other.Res_EEG))
			return false;
		if (Res_MRI == null) {
			if (other.Res_MRI != null)
				return false;
		} else if (!Res_MRI.equals(other.Res_MRI))
			return false;
		if (Res_prot14_3 == null) {
			if (other.Res_prot14_3 != null)
				return false;
		} else if (!Res_prot14_3.equals(other.Res_prot14_3))
			return false;
		if (Res_tau == null) {
			if (other.Res_tau != null)
				return false;
		} else if (!Res_tau.equals(other.Res_tau))
			return false;
		if (biopsy == null) {
			if (other.biopsy != null)
				return false;
		} else if (!biopsy.equals(other.biopsy))
			return false;
		if (codon == null) {
			if (other.codon != null)
				return false;
		} else if (!codon.equals(other.codon))
			return false;
		if (genetic == null) {
			if (other.genetic != null)
				return false;
		} else if (!genetic.equals(other.genetic))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (immunohistochemistry == null) {
			if (other.immunohistochemistry != null)
				return false;
		} else if (!immunohistochemistry.equals(other.immunohistochemistry))
			return false;
		if (individualPaper == null) {
			if (other.individualPaper != null)
				return false;
		} else if (!individualPaper.equals(other.individualPaper))
			return false;
		if (necropsy == null) {
			if (other.necropsy != null)
				return false;
		} else if (!necropsy.equals(other.necropsy))
			return false;
		if (prot14_3 == null) {
			if (other.prot14_3 != null)
				return false;
		} else if (!prot14_3.equals(other.prot14_3))
			return false;
		if (resBiopsy == null) {
			if (other.resBiopsy != null)
				return false;
		} else if (!resBiopsy.equals(other.resBiopsy))
			return false;
		if (resGenetic == null) {
			if (other.resGenetic != null)
				return false;
		} else if (!resGenetic.equals(other.resGenetic))
			return false;
		if (resImmunohistochemistry == null) {
			if (other.resImmunohistochemistry != null)
				return false;
		} else if (!resImmunohistochemistry
				.equals(other.resImmunohistochemistry))
			return false;
		if (resNecropsy == null) {
			if (other.resNecropsy != null)
				return false;
		} else if (!resNecropsy.equals(other.resNecropsy))
			return false;
		if (subtypeCodon == null) {
			if (other.subtypeCodon != null)
				return false;
		} else if (!subtypeCodon.equals(other.subtypeCodon))
			return false;
		if (tauProtein == null) {
			if (other.tauProtein != null)
				return false;
		} else if (!tauProtein.equals(other.tauProtein))
			return false;
		return true;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getMRT() {
		return MRT;
	}

	public void setMRT(String mRT) {
		MRT = mRT;
	}

	public String getCodon_go() {
		return codon_go;
	}

	public void setCodon_go(String codon_go) {
		this.codon_go = codon_go;
	}

	public String getMutation() {
		return mutation;
	}

	public void setMutation(String mutation) {
		this.mutation = mutation;
	}

	public String getSilent_mutation() {
		return silent_mutation;
	}

	public void setSilent_mutation(String silent_mutation) {
		this.silent_mutation = silent_mutation;
	}

	public String getPrp_type() {
		return prp_type;
	}

	public void setPrp_type(String prp_type) {
		this.prp_type = prp_type;
	}

	public String getMolecular_subtype() {
		return molecular_subtype;
	}

	public void setMolecular_subtype(String molecular_subtype) {
		this.molecular_subtype = molecular_subtype;
	}

	public String getDisease_duration() {
		return disease_duration;
	}

	public void setDisease_duration(String disease_duration) {
		this.disease_duration = disease_duration;
	}

	public String getDeceased() {
		return deceased;
	}

	public void setDeceased(String deceased) {
		this.deceased = deceased;
	}
	
	
}