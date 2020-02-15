package com.playground.schedule.dao;

import com.playground.schedule.pojo.EventInterviewer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface EventInterviewerRepository extends JpaRepository<EventInterviewer, Integer>, JpaSpecificationExecutor<EventInterviewer> {

}