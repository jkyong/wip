package com.partdb.wip.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.partdb.wip.dao.AreaDao;
import com.partdb.wip.domain.Area;
import com.partdb.wip.dto.AreaDto;

@Service
public class AreaService {

	@Autowired
	AreaDao areaDao;
	
	public List<AreaDto> findAll() {
		
		List<Area> areas = areaDao.findAll();
		
		List<AreaDto> areaDtoes = new ArrayList<AreaDto>();
		
		for(Area area : areas) {
			AreaDto dto = new AreaDto();
			
			dto.setId(area.getId());
			dto.setAddedAddress(area.getAddress() + " " + area.getAddressDetail());
			dto.setAddress(area.getAddress());
			dto.setAddressDetail(area.getAddressDetail());
			dto.setName(area.getName());
			dto.setPostcode(area.getPostcode());
			dto.setDescription(area.getDescription());
			
			areaDtoes.add(dto);
		}
		
		return areaDtoes;
	}
	
	public void save(AreaDto areaDto) {
		Area area = new Area();
		
		area.setId(areaDto.getId());
		area.setAddress(areaDto.getAddress());
		area.setAddressDetail(areaDto.getAddressDetail());
		area.setCapacity(areaDto.getCapacity());
		area.setName(areaDto.getName());
		area.setPostcode(areaDto.getPostcode());
		area.setDescription(areaDto.getDescription());
		
		areaDao.save(area);
		
	}
	
	public void update(AreaDto areaDto) {

		Area area = areaDao.findOne(areaDto.getId());
				
		area.setAddress(areaDto.getAddress());
		area.setAddressDetail(areaDto.getAddressDetail());
		area.setDescription(areaDto.getDescription());
		area.setName(areaDto.getName());
		area.setPostcode(areaDto.getPostcode());
		
		areaDao.save(area);
		
	}

	public void delete(String[] ids) {
		for(String id : ids) {
			areaDao.delete(Integer.valueOf(id));	
		}
	}

	public Page<Area> getJqgrid(int page, int rows, String sidx, String sord) {
		
		return areaDao.getJqgrid(page, rows, sidx, sord);		
	}
}
