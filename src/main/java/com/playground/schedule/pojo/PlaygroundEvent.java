package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
@Table(name = "playground_event")
@Entity
public class PlaygroundEvent implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "event_type")
    private String eventType = "'REMOTE'";

    @Column(name = "name")
    private String name = "NULL";

    @Column(name = "event_description")
    private String eventDescription = "NULL";

    @Column(name = "client_id", nullable = false)
    private Integer clientId;

    @Column(name = "client_name")
    private String clientName = "NULL";

    @Column(name = "requirement_id", nullable = false)
    private Integer requirementId;

    @Column(name = "status")
    private String status = "'PENDING'";

    @Column(name = "event_start_time")
    private LocalDateTime eventStartTime;

    @Column(name = "durition")
    private LocalTime durition;

    @Column(name = "location")
    private String location = "NULL";

    @Column(name = "meeting_url")
    private String meetingUrl = "NULL";

    @Column(name = "created_by")
    private String createdBy = "NULL";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "modified_by")
    private String modifiedBy = "NULL";

    @Column(name = "modified_at")
    private LocalDateTime modifiedAt;

    
}