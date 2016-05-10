package com.partdb.wip.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the generator database table.
 * 
 */
@Entity
@NamedQuery(name="Generator.findAll", query="SELECT g FROM Generator g")
public class Generator implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private String name;

	//bi-directional many-to-one association to Blade
	@OneToMany(mappedBy="generator")
	private List<Blade> blades;

	//bi-directional many-to-one association to Area
	@ManyToOne
	private Area area;

	public Generator() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Blade> getBlades() {
		return this.blades;
	}

	public void setBlades(List<Blade> blades) {
		this.blades = blades;
	}

	public Blade addBlade(Blade blade) {
		getBlades().add(blade);
		blade.setGenerator(this);

		return blade;
	}

	public Blade removeBlade(Blade blade) {
		getBlades().remove(blade);
		blade.setGenerator(null);

		return blade;
	}

	public Area getArea() {
		return this.area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

}