package com.partdb.wip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.partdb.wip.dao.GeneratorDao;
import com.partdb.wip.domain.Generator;

@Service
public class GeneratorService {

	@Autowired
	GeneratorDao generatorDao;
	
	public List<Generator> findAll() {

		return generatorDao.findAll();
	}
	
	public void save(Generator generator) {

		generatorDao.save(generator); 
	}
	
	public void update(Generator generator) {

		Generator modGenerator= generatorDao.findOne(generator.getId());
		
		modGenerator.setName(generator.getName());
		
		generatorDao.save(modGenerator);
		
	}

	public void delete(String[] ids) {
		for(String id : ids) {
			generatorDao.delete(Integer.valueOf(id));	
		}
	}

	public Page<Generator> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return generatorDao.getJqgrid(page, rows, sidx, sord);
	}
}
