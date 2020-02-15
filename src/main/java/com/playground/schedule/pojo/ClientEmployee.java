package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Table(name = "client_employee")
@Entity
public class ClientEmployee implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "gender")
    private String gender = "NULL";

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "phone", nullable = false)
    private String phone;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "location", nullable = false)
    private String location;

    @Column(name = "linked_in", nullable = false)
    private String linkedIn;

    @Column(name = "company_id", nullable = false)
    private Integer companyId;

    @Column(name = "company_name", nullable = false)
    private String companyName;

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

    
}