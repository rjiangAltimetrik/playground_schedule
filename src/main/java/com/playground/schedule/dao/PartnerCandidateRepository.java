package com.playground.schedule.dao;

import com.playground.schedule.pojo.PartnerCandidate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PartnerCandidateRepository extends JpaRepository<PartnerCandidate, Void>, JpaSpecificationExecutor<PartnerCandidate> {

}