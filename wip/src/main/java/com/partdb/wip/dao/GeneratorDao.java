package com.partdb.wip.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Repository;

import com.partdb.wip.domain.Generator;
import com.partdb.wip.repository.BladeRepository;
import com.partdb.wip.repository.GeneratorRepository;

@Repository
public class GeneratorDao {

	@Autowired
	GeneratorRepository generatorRepository;
	
	@Autowired
	BladeRepository bladeRepository;
	
	public List<Generator> findAll() {		
		return generatorRepository.findAll();
	}
	
	public Generator findOne(int id) {
		return generatorRepository.findOne(id);
	}
	
	public Generator save(Generator generator) {
		
		generator.setBlades(bladeRepository.findAll());
		
		return generatorRepository.save(generator);
	}

	public void delete(int id) {
		generatorRepository.delete(id);		
	}

	public Page<Generator> getJqgrid(int page, int rows, String sidx, String sord) {
		return generatorRepository.findAll(new PageRequest(page, rows, (sord.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC) , sidx));
	}
}
