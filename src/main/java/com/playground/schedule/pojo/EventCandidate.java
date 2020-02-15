package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Data
@Table(name = "event_candidate")
public class EventCandidate implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "event_id", nullable = false)
    private Integer eventId;

    @Column(name = "candidate_id", nullable = false)
    private Integer candidateId;

    @Column(name = "slot1", nullable = false)
    private LocalDateTime slot1;

    @Column(name = "durition1", nullable = false)
    private LocalTime durition1;

    @Column(name = "slot2")
    private LocalDateTime slot2;

    @Column(name = "durition2")
    private LocalTime durition2;

    @Column(name = "slot3")
    private LocalDateTime slot3;

    @Column(name = "durition3")
    private LocalTime durition3;

    @Column(name = "slot4")
    private LocalDateTime slot4;

    @Column(name = "durition4")
    private LocalTime durition4;

    @Column(name = "slot5")
    private LocalDateTime slot5;

    @Column(name = "durition5")
    private LocalTime durition5;

    @Column(name = "description")
    private String description = "NULL";

    @Column(name = "created_by")
    private String createdBy = "NULL";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "modified_by")
    private String modifiedBy = "NULL";

    @Column(name = "modified_at")
    private LocalDateTime modifiedAt;

    
}