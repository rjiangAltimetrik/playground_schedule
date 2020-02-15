package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

import static java.sql.Types.NULL;


@Data
@Entity
@Table(name = "candidate_resume")
public class CandidateResume implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "doc_name", nullable = false)
    private String docName;

    @Column(name = "cand_id", nullable = false)
    private Integer candId;

    @Column(name = "cand_name", nullable = false)
    private String candName;

    @Column(name = "created_by")
    private String createdBy = "NULL";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "modified_by")
    private String modifiedBy = "NULL";

    @Column(name = "modified_at")
    private LocalDateTime modifiedAt;

    @Column(name = "description")
    private String description = "NULL";

    @Column(name = "doc")
    private byte[] doc = null;

    
}