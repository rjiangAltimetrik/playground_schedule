package com.playground.schedule.dao;

import com.playground.schedule.pojo.ClientEmployee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ClientEmployeeRepository extends JpaRepository<ClientEmployee, Integer>, JpaSpecificationExecutor<ClientEmployee> {

}