package com.playground.schedule.pojo;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Table(name = "client_company")
@Entity
public class ClientCompany implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "created_by")
    private String createdBy = "NULL";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "description")
    private String description = "NULL";

    @Column(name = "web")
    private String web = "NULL";

    
}