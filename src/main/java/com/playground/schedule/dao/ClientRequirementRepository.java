package com.playground.schedule.dao;

import com.playground.schedule.pojo.ClientRequirement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ClientRequirementRepository extends JpaRepository<ClientRequirement, Integer>, JpaSpecificationExecutor<ClientRequirement> {

}