package com.partdb.wip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.partdb.wip.dao.BladeDao;
import com.partdb.wip.domain.Blade;

@Service
public class BladeService {

	@Autowired
	BladeDao bladeDao;
	
	public List<Blade> findAll() {

		return bladeDao.findAll();
	}
	
	public void save(Blade blade) {

		bladeDao.save(blade);
		
	}
	
	public void update(Blade blade) {

		Blade modBlade= bladeDao.findOne(blade.getId());
		
		modBlade.setName(blade.getName());
		modBlade.setType(blade.getType());
		modBlade.setManufacturer(blade.getManufacturer());
		modBlade.setStandard(blade.getStandard());
		modBlade.setDescription(blade.getDescription());
		
		bladeDao.save(modBlade);
		
	}

	public void delete(String[] ids) {
		for(String id : ids) {
			bladeDao.delete(Integer.valueOf(id));	
		}
	}

	public Page<Blade> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return bladeDao.getJqgrid(page, rows, sidx, sord);		
	}
}
