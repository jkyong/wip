package com.partdb.wip.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the area database table.
 * 
 */
@Entity
@NamedQuery(name="Area.findAll", query="SELECT a FROM Area a")
public class Area implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private String address;

	@Column(name="address_detail")
	private String addressDetail;

	private String postcode;
	
	private int capacity;

	private String description;

	private String name;
	
	//bi-directional many-to-one association to Generator
	@OneToMany(mappedBy="area")
	private List<Generator> generators;

	//bi-directional many-to-one association to Contractor
	@ManyToOne
	private Contractor contractor;

	public Area() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
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

	public int getCapacity() {
		return this.capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Generator> getGenerators() {
		return this.generators;
	}

	public void setGenerators(List<Generator> generators) {
		this.generators = generators;
	}

	public Generator addGenerator(Generator generator) {
		getGenerators().add(generator);
		generator.setArea(this);

		return generator;
	}

	public Generator removeGenerator(Generator generator) {
		getGenerators().remove(generator);
		generator.setArea(null);

		return generator;
	}

	public Contractor getContractor() {
		return this.contractor;
	}

	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}

}