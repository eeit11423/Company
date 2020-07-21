package company.train.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TrainCompany")
public class CompanyBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id ;
	private String  name;
	private String  address;
	private String  url;
	@OneToMany(mappedBy="companyBean")
	private Set<TrainingBean> trains = new LinkedHashSet<>();
	
	public CompanyBean(Integer id, String name, String address, String url) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.url = url;
	}
	public CompanyBean() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Set<TrainingBean> getTrains() {
		return trains;
	}
	public void setTrains(Set<TrainingBean> trains) {
		this.trains = trains;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}	
	
}