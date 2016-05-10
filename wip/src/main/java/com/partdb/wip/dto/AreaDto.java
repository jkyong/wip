package com.partdb.wip.dto;


public class AreaDto {

	private Integer id;

	private String addedAddress;
	
	private String address;

	private String addressDetail;

	private String description;

	private String name;

	private String postcode;

	private int capacity;
	
	public AreaDto() {
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getAddedAddress() {
		return addedAddress;
	}

	public void setAddedAddress(String addedAddress) {
		this.addedAddress = addedAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	@Override
	public String toString() {
		return "AreaDto [id=" + id + ", addedAddress=" + addedAddress
				+ ", address=" + address + ", addressDetail=" + addressDetail
				+ ", description=" + description + ", name=" + name
				+ ", postcode=" + postcode + ", capacity=" + capacity + "]";
	}
			
}