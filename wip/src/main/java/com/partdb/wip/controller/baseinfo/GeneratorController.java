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

import com.partdb.wip.domain.Generator;
import com.partdb.wip.service.GeneratorService;

@Controller
public class GeneratorController {
	
	@Autowired
	GeneratorService generatorService;

	@RequestMapping(value="/baseinfo/generator/jqgrid", method=RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getJqgridObj(     
		@RequestParam(value = "page", required=false) int page,
	    @RequestParam(value = "rows", required=false) int rows,
	    @RequestParam(value = "sidx", required=false) String sidx,
	    @RequestParam(value = "sord", required=false) String sord) {
		
		Page<Generator> pGenerator = generatorService.getJqgrid(page-1, rows, sidx, sord);
				
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("page", page);
		returnMap.put("total", pGenerator.getTotalPages());
		returnMap.put("records", pGenerator.getTotalElements());
		returnMap.put("rows", pGenerator.getContent());
		
		return returnMap;
	}
	
	@RequestMapping(value = "/baseinfo/generator/findAll", method=RequestMethod.POST)
	public @ResponseBody List<Generator> findAll(@RequestParam HashMap<String, String> paraMap) {		

		return generatorService.findAll();
	}
	
	@RequestMapping(value = "/baseinfo/generator/save", method=RequestMethod.POST)
	public @ResponseBody void save(@ModelAttribute Generator generator) {		
		generatorService.save(generator);
	}
	
	@RequestMapping(value = "/baseinfo/generator/update", method=RequestMethod.POST)
	public @ResponseBody void update(@ModelAttribute Generator generator) { 
		generatorService.update(generator);
	}
	
	@RequestMapping(value = "/baseinfo/generator/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody void delete(@PathVariable("id") String id) {
		String[] ids = id.split(",");
		generatorService.delete(ids);
	}
	
}
