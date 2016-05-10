package com.partdb.wip.controller.baseinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.partdb.wip.domain.Area;
import com.partdb.wip.dto.AreaDto;
import com.partdb.wip.service.AreaService;

@Controller
public class AreaController {
	
	@Autowired
	AreaService areaService;

	@RequestMapping(value="/baseinfo/area/jqgrid", method=RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getJqgridObj(     
		@RequestParam(value = "page", required=false) int page,
	    @RequestParam(value = "rows", required=false) int rows,
	    @RequestParam(value = "sidx", required=false) String sidx,
	    @RequestParam(value = "sord", required=false) String sord) {
		
		Page<Area> pArea = areaService.getJqgrid(page-1, rows, sidx, sord);
		
		List<AreaDto> areaDtos = new ArrayList<AreaDto>();
		for(Area area : pArea.getContent()) {
			AreaDto areaDto = new AreaDto();
			
			areaDto.setId(area.getId());
			areaDto.setAddedAddress(area.getAddress() + " " + area.getAddressDetail());
			areaDto.setAddress(area.getAddress());
			areaDto.setAddressDetail(area.getAddressDetail());
			areaDto.setCapacity(area.getCapacity());
			areaDto.setDescription(area.getDescription());
			areaDto.setName(area.getName());
			areaDto.setPostcode(area.getPostcode());
			
			areaDtos.add(areaDto);
		}
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("page", page);
		returnMap.put("total", pArea.getTotalPages());
		returnMap.put("records", pArea.getTotalElements());
		returnMap.put("rows", areaDtos);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/baseinfo/area/findAll", method=RequestMethod.POST)
	public @ResponseBody List<AreaDto> getAreas(@RequestParam HashMap<String, String> paraMap) {		
		List<AreaDto> dts = areaService.findAll();
		return dts;
	}
	
	@RequestMapping(value = "/baseinfo/area/save", method=RequestMethod.POST)
	public @ResponseBody void saveArea(@ModelAttribute AreaDto areaDto) {
		areaService.save(areaDto);
	}
	
	@RequestMapping(value = "/baseinfo/area/update", method=RequestMethod.POST)
	public @ResponseBody void updateArea(@ModelAttribute AreaDto areaDto) { 
		areaService.update(areaDto);
	}
	
	@RequestMapping(value = "/baseinfo/area/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody void deleteArea(@PathVariable("id") String id) {
		String[] ids = id.split(",");
		areaService.delete(ids);
	}
	
}
