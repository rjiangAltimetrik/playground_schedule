package com.playground.schedule.dao;

import com.playground.schedule.pojo.CandidateResume;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CandidateResumeRepository extends JpaRepository<CandidateResume, Integer>, JpaSpecificationExecutor<CandidateResume> {

}