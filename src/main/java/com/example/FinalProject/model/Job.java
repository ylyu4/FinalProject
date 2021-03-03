package com.example.FinalProject.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Job {

    @Id
    private Long id;

    private String name;

    private String company;

    private String experience;

    private String  location;

    private String field;

    private Long salary;

    private String contact;

    private LocalDateTime deadline;

    private String jobDescription;

    private JobStatus status;

    private Long applicantId;

    private Boolean paid;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;
}
