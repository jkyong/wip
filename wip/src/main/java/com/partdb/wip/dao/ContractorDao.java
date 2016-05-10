package com.partdb.wip.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Repository;

import com.partdb.wip.domain.Contractor;
import com.partdb.wip.repository.ContractorRepository;

@Repository
public class ContractorDao {

	@Autowired
	ContractorRepository contractorRepository;
	
	public List<Contractor> findAll() {		
		return contractorRepository.findAll();
	}
	
	public Contractor findOne(int id) {
		return contractorRepository.findOne(id);
	}
	
	public Contractor save(Contractor contractor) {
		return contractorRepository.save(contractor);
	}

	public void delete(int id) {
		contractorRepository.delete(id);		
	}

	public Page<Contractor> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return contractorRepository.findAll(new PageRequest(page, rows, (sord.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC) , sidx));
		
	}
}
