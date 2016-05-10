package com.partdb.wip.domain;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the blade database table.
 * 
 */
@Entity
@NamedQuery(name="Blade.findAll", query="SELECT b FROM Blade b")
public class Blade implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private String description;

	private String manufacturer;

	private String name;

	private String standard;

	private String type;

	//bi-directional many-to-one association to Generator
	@ManyToOne
	@JoinColumn(name="generator_id")
	private Generator generator;

	public Blade() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStandard() {
		return this.standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Generator getGenerator() {
		return this.generator;
	}

	public void setGenerator(Generator generator) {
		this.generator = generator;
	}

}