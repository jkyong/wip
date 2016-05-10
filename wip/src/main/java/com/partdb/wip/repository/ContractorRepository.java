package com.partdb.wip.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partdb.wip.domain.Contractor;

public interface ContractorRepository extends JpaRepository<Contractor, Integer>{
	
}
