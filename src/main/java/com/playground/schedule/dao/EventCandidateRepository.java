package com.playground.schedule.dao;

import com.playground.schedule.pojo.EventCandidate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface EventCandidateRepository extends JpaRepository<EventCandidate, Integer>, JpaSpecificationExecutor<EventCandidate> {

}