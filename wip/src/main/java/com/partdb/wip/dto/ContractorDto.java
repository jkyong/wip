package com.partdb.wip.dto;

import com.partdb.wip.domain.Contractor;

public class ContractorDto {

	private Integer id;

	private String addedAddress;
	
	private String address;

	private String addressDetail;

	private String description;

	private String email;

	private String manager;

	private String name;

	private String postcode;

	private String tel;
	
	private String tel1;
	
	private String tel2;
	
	private String tel3;

	public ContractorDto() {
		
	}
	
	public ContractorDto(Integer id, String addedAddress, String address,
			String addressDetail, String description, String email,
			String manager, String name, String postcode, String tel,
			String tel1, String tel2, String tel3) {
		super();
		this.id = id;
		this.addedAddress = addedAddress;
		this.address = address;
		this.addressDetail = addressDetail;
		this.description = description;
		this.email = email;
		this.manager = manager;
		this.name = name;
		this.postcode = postcode;
		this.tel = tel;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public ContractorDto convert(Contractor con) {
		
		return new ContractorDto(
				con.getId(), con.getAddress() + " " + con.getAddressDetail(), con.getAddress(), con.getAddressDetail(), con.getDescription(), 
				con.getEmail(), con.getManager(), con.getName(), con.getPostcode(), con.getTel(), 
				con.getTel().split("\\-", -1)[0], con.getTel().split("\\-", -1)[1], con.getTel().split("\\-", -1)[2]);
	}
	
	@Override
	public String toString() {
		return "ContractorDto [id=" + id + ", addedAddress=" + addedAddress
				+ ", address=" + address + ", addressDetail=" + addressDetail
				+ ", description=" + description + ", email=" + email
				+ ", manager=" + manager + ", name=" + name + ", postcode="
				+ postcode + ", tel=" + tel + ", tel1=" + tel1 + ", tel2="
				+ tel2 + ", tel3=" + tel3 + "]";
	}

	
}