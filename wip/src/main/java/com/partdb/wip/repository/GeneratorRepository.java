package com.partdb.wip.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.partdb.wip.domain.Generator;

public interface GeneratorRepository extends JpaRepository<Generator, Integer>{
	
}
