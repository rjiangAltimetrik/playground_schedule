package com.playground.schedule.dao;

import com.playground.schedule.pojo.EventEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface EventEvaluationRepository extends JpaRepository<EventEvaluation, Integer>, JpaSpecificationExecutor<EventEvaluation> {

}