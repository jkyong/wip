package com.partdb.wip.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Repository;

import com.partdb.wip.domain.Area;
import com.partdb.wip.repository.AreaRepository;

@Repository
public class AreaDao {

	@Autowired
	AreaRepository areaRepository;
	
	public List<Area> findAll() {		
		return areaRepository.findAll();
	}
	
	public Area findOne(int id) {
		return areaRepository.findOne(id);
	}
	
	public Area save(Area area) {
		return areaRepository.save(area);
	}

	public void delete(int id) {
		areaRepository.delete(id);		
	}

	public Page<Area> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return areaRepository.findAll(new PageRequest(page, rows, (sord.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC) , sidx));
		
	}
}
