package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Table(name = "client_requirement")
@Entity
public class ClientRequirement implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "req_title", nullable = false)
    private String reqTitle;

    @Column(name = "req_tech", nullable = false)
    private String reqTech;

    @Column(name = "description")
    private String description = "NULL";

    @Column(name = "status")
    private String status = "'OPEN'";

    @Column(name = "company", nullable = false)
    private Integer company;

    @Column(name = "company_name", nullable = false)
    private String companyName;

    @Column(name = "created_by", nullable = false)
    private String createdBy;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "modified_by", nullable = false)
    private String modifiedBy;

    @Column(name = "modified_at", nullable = false)
    private LocalDateTime modifiedAt;

    
}