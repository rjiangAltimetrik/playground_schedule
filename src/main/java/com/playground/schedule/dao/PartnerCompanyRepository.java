package com.playground.schedule.dao;

import com.playground.schedule.pojo.PartnerCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PartnerCompanyRepository extends JpaRepository<PartnerCompany, Integer>, JpaSpecificationExecutor<PartnerCompany> {

}