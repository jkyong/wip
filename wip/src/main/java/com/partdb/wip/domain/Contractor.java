package com.partdb.wip.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the contractor database table.
 * 
 */
@Entity
@NamedQuery(name="Contractor.findAll", query="SELECT c FROM Contractor c")
public class Contractor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private String address;

	@Column(name="address_detail")
	private String addressDetail;

	private String description;

	private String email;

	private String manager;

	private String name;

	private String postcode;

	private String tel;

	//bi-directional many-to-one association to Area
	@OneToMany(mappedBy="contractor")
	private List<Area> areas;
	
	public Contractor() {
	}

	public Contractor(String address, String addressDetail,
			String description, String email, String manager, String name,
			String postcode, String tel) {
		super();
		this.address = address;
		this.addressDetail = addressDetail;
		this.description = description;
		this.email = email;
		this.manager = manager;
		this.name = name;
		this.postcode = postcode;
		this.tel = tel;
	}
	
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return this.addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getManager() {
		return this.manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public List<Area> getAreas() {
		return this.areas;
	}

	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}

	public Area addArea(Area area) {
		getAreas().add(area);
		area.setContractor(this);

		return area;
	}

	public Area removeArea(Area area) {
		getAreas().remove(area);
		area.setContractor(null);

		return area;
	}

}