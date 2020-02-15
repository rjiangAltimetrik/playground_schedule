package com.playground.schedule.dao;

import com.playground.schedule.pojo.PartnerAgent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PartnerAgentRepository extends JpaRepository<PartnerAgent, Integer>, JpaSpecificationExecutor<PartnerAgent> {

}