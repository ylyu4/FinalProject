package com.example.FinalProject.model;


import com.example.FinalProject.utils.IdGenerator;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
public class Freelancer {

    @Id
    @Column(name = "freelancer_id")
    private Long id;

    private String username;

    private String password;

    private String name;

    private Integer age;

    private String location;

    private String phone;

    private String email;

    private String school;

    private String card;

    @Type(type = "jsonb")
    private List<Job> appliedJobs;

    private Long accountBalance;

    private Double rate;

    private LocalDateTime accountCreateTime;

    public Freelancer(String username, String password) {
        this.id = IdGenerator.generateId();
        this.username = username;
        this.password = password;
        this.accountBalance = 0L;
        this.accountCreateTime = LocalDateTime.now();
    }
}
