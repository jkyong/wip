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

import com.partdb.wip.domain.Contractor;
import com.partdb.wip.dto.ContractorDto;
import com.partdb.wip.service.ContractorService;

@Controller
public class ContractorController {
	
	@Autowired
	ContractorService contractorService;

	@RequestMapping(value="/baseinfo/contractor/jqgrid", method=RequestMethod.GET)
	public @ResponseBody HashMap<String,Object> getJqgridObj(     
		@RequestParam(value = "page", required=false) int page,
	    @RequestParam(value = "rows", required=false) int rows,
	    @RequestParam(value = "sidx", required=false) String sidx,
	    @RequestParam(value = "sord", required=false) String sord) {
		
		Page<Contractor> pContractor = contractorService.getJqgrid(page-1, rows, sidx, sord);
		
		List<ContractorDto> contractorDtos = new ArrayList<ContractorDto>();
		for(Contractor contractor : pContractor.getContent()) {
			ContractorDto contractorDto = new ContractorDto();
			contractorDtos.add(contractorDto.convert(contractor));
		}
		
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("page", page);
		returnMap.put("total", pContractor.getTotalPages());
		returnMap.put("records", pContractor.getTotalElements());
		returnMap.put("rows", contractorDtos);
		
		return returnMap;
	}
	
	@RequestMapping(value = "/baseinfo/contractor/findAll", method=RequestMethod.POST)
	public @ResponseBody List<ContractorDto> getContractors(@RequestParam HashMap<String, String> paraMap) {		
		List<ContractorDto> dts = contractorService.findAll();
		return dts;
	}
	
	@RequestMapping(value = "/baseinfo/contractor/save", method=RequestMethod.POST)
	public @ResponseBody void saveContractor(@ModelAttribute ContractorDto contractorDto) {
		contractorService.save(contractorDto);
	}
	
	@RequestMapping(value = "/baseinfo/contractor/update", method=RequestMethod.POST)
	public @ResponseBody void updateContractor(@ModelAttribute ContractorDto contractorDto) { 
		contractorService.update(contractorDto);
	}
	
	@RequestMapping(value = "/baseinfo/contractor/delete/{id}", method=RequestMethod.POST)
	public @ResponseBody void deleteContractor(@PathVariable("id") String id) {
		String[] ids = id.split(",");
		contractorService.delete(ids);
	}
	
	@RequestMapping(value = "/baseinfo/contractor/modal", method=RequestMethod.GET)
	public String modal() {
		return "";
	}
	
}
