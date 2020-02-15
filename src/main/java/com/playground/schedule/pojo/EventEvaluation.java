package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Table(name = "event_evaluation")
@Data
@Entity
public class EventEvaluation implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "event_id", nullable = false)
    private Integer eventId;

    @Column(name = "candidate_id", nullable = false)
    private Integer candidateId;

    @Column(name = "interviewer_id", nullable = false)
    private Integer interviewerId;

    @Column(name = "description")
    private String description = "NULL";

    @Column(name = "interviewer_feedback")
    private String interviewerFeedback = "NULL";

    @Column(name = "tech_feedback")
    private String techFeedback = "NULL";

    @Column(name = "eval")
    private String eval = "'PENDING'";

    @Column(name = "score")
    private Integer score = 0;

    @Column(name = "candidate_feedback")
    private String candidateFeedback = "NULL";

    @Column(name = "created_by")
    private String createdBy = "NULL";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "modified_by")
    private String modifiedBy = "NULL";

    @Column(name = "modified_at")
    private LocalDateTime modifiedAt;

    
}