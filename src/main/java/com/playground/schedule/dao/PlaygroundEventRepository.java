package com.playground.schedule.dao;

import com.playground.schedule.pojo.PlaygroundEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PlaygroundEventRepository extends JpaRepository<PlaygroundEvent, Integer>, JpaSpecificationExecutor<PlaygroundEvent> {

}