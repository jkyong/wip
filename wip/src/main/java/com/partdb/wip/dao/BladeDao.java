package com.partdb.wip.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Repository;

import com.partdb.wip.domain.Blade;
import com.partdb.wip.repository.BladeRepository;

@Repository
public class BladeDao {

	@Autowired
	BladeRepository bladeRepository;

	public List<Blade> findAll() {		
		return bladeRepository.findAll();
	}
	
	public Blade findOne(int id) {
		return bladeRepository.findOne(id);
	}
	
	public Blade save(Blade blade) {

		return bladeRepository.save(blade);
	}

	public void delete(int id) {
		bladeRepository.delete(id);		
	}

	public Page<Blade> getJqgrid(int page, int rows, String sidx, String sord) {
		return bladeRepository.findAll(new PageRequest(page, rows, (sord.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC) , sidx));
	}
}
