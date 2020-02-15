package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

import static java.sql.Types.NULL;

@Data
@Entity
@Table(name = "partner_candidate")
public class PartnerCandidate implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    private Integer id = NULL;

    @Column(name = "candidate_id")
    private Integer candidateId = NULL;

    @Column(name = "partner_id")
    private Integer partnerId = NULL;

    @Column(name = "agent_id")
    private Integer agentId = NULL;

    
}