package com.playground.schedule.pojo;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "candidate")
public class Candidate implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "phone", nullable = false)
    private String phone;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "linked_in_url")
    private String linkedInUrl = "NULL";

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Column(name = "education")
    private String education = "'BACHELOR'";

    @Column(name = "school", nullable = false)
    private String school;

    @Column(name = "date_of_graduation")
    private LocalDate dateOfGraduation;

    @Column(name = "work_auth", nullable = false)
    private String workAuth;

    @Column(name = "location", nullable = false)
    private String location;

    @Column(name = "ssn")
    private String ssn = "NULL";

    @Column(name = "experience", nullable = false)
    private String experience;

    @Column(name = "tech_stack")
    private String techStack = "NULL";

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