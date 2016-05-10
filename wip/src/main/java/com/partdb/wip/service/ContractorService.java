package com.partdb.wip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.partdb.wip.dao.ContractorDao;
import com.partdb.wip.domain.Contractor;
import com.partdb.wip.dto.ContractorDto;

@Service
public class ContractorService {

	@Autowired
	ContractorDao contractorDao;
	
	public List<ContractorDto> findAll() {
		
		List<Contractor> contractors = contractorDao.findAll();
		
		List<ContractorDto> contractorDtoes = new ArrayList<ContractorDto>();
		
		for(Contractor con : contractors) {
			contractorDtoes.add(
				new ContractorDto(
						con.getId(), con.getAddress() + " " + con.getAddressDetail(), con.getAddress(), con.getAddressDetail(), con.getDescription(), 
						con.getEmail(), con.getManager(), con.getName(), con.getPostcode(), con.getTel(), 
						con.getTel().split("\\-", -1)[0], con.getTel().split("\\-", -1)[1], con.getTel().split("\\-", -1)[2]));
		}
		
		return contractorDtoes;
	}
	
	public void save(ContractorDto contractorDto) {
		
		Contractor newContractor = new Contractor(
				contractorDto.getAddress(), contractorDto.getAddressDetail(), contractorDto.getDescription(), 
				contractorDto.getEmail(), contractorDto.getManager(), contractorDto.getName(), contractorDto.getPostcode(), 
				contractorDto.getTel1() + "-" + contractorDto.getTel2() + "-" + contractorDto.getTel3());
		
		contractorDao.save(newContractor);
		
	}
	
	public void update(ContractorDto contractorDto) {

		Contractor newContractor = contractorDao.findOne(contractorDto.getId());
		
		System.out.println(contractorDto.getAddress());
		System.out.println(newContractor);
		
		newContractor.setAddress(contractorDto.getAddress());
		newContractor.setAddressDetail(contractorDto.getAddressDetail());
		newContractor.setDescription(contractorDto.getDescription());
		newContractor.setEmail(contractorDto.getEmail());
		newContractor.setManager(contractorDto.getManager());
		newContractor.setName(contractorDto.getName());
		newContractor.setPostcode(contractorDto.getPostcode());
		newContractor.setTel(contractorDto.getTel1() + "-" + contractorDto.getTel2() + "-" + contractorDto.getTel3());
		
		contractorDao.save(newContractor);
		
	}

	public void delete(String[] ids) {
		for(String id : ids) {
			contractorDao.delete(Integer.valueOf(id));	
		}
	}

	public Page<Contractor> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return contractorDao.getJqgrid(page, rows, sidx, sord);		
	}
}
