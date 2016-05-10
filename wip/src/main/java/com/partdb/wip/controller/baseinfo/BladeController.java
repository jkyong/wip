package com.partdb.wip.controller.baseinfo;

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

import com.partdb.wip.domain.Blade;
import com.partdb.wip.service.BladeService;

@Controller
public class BladeController {
	
	@Autowired
	BladeService bladeService;

	@RequestMapping(value="/baseinfo/blade/jqgrid", method=RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getJqgridObj(     
		@RequestParam(value = "page", required=false) int page,
	    @RequestParam(value = "rows", required=false) int rows,
	    @RequestParam(value = "sidx", required=false) String sidx,
	    @RequestParam(value = "sord", required=false) String sord) {
		
		Page<Blade> pContractor = bladeService.getJqgrid(page-1, rows, sidx, sord);
				
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("page", page);
		returnMap.put("total", pContractor.getTotalPages());
		returnMap.put("records", pContractor.getTotalElements());
		returnMap.put("rows", pContractor.getContent());
		
		return returnMap;
	}
	
	@RequestMapping(value = "/baseinfo/blade/findAll", method=RequestMethod.POST)
	public @ResponseBody List<Blade> findAll(@RequestParam HashMap<String, String> paraMap) {		
		return bladeService.findAll();
	}
	
	@RequestMapping(value = "/baseinfo/blade/save", method=RequestMethod.POST)
	public @ResponseBody void save(@ModelAttribute Blade blade) {
		bladeService.save(blade);
	}
	
	@RequestMapping(value = "/baseinfo/blade/update", method=RequestMethod.POST)
	public @ResponseBody void update(@ModelAttribute Blade blade) { 
		bladeService.update(blade);
	}
	
	@RequestMapping(value = "/baseinfo/blade/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody void delete(@PathVariable("id") String id) {
		String[] ids = id.split(",");
		bladeService.delete(ids);
	}
	
}
