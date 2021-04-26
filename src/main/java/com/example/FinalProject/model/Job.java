package com.example.FinalProject.model;


import com.example.FinalProject.command.EmployerCreateJobCommand;
import com.example.FinalProject.utils.IdGenerator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Job {

    @Id
    @Column(name = "job_id")
    private Long id;

    private String name;

    private String company;

    private String experience;

    private String location;

    private String field;

    private Long salary;

    private String contact;

    private LocalDate deadline;

    private String jobDescription;

    @Enumerated(EnumType.STRING)
    private JobStatus jobStatus;

    private Long freelancerId;

    private Long createdBy;

    private Long approvedBy;

    private Boolean paid;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;

    public Job(EmployerCreateJobCommand command, Long userId) {
        this.id = IdGenerator.generateId();
        this.name = command.getName();
        this.company = command.getCompany();
        this.experience = command.getExperience();
        this.location = command.getLocation();
        this.field = command.getField();
        this.salary = command.getSalary();
        this.contact = command.getContact();
        this.deadline = command.getDeadline();
        this.jobDescription = command.getDescription();
        this.jobStatus = JobStatus.CREATED;
        this.createdBy = userId;
        this.paid = false;
        LocalDateTime now = LocalDateTime.now();
        this.createTime = now;
        this.lastUpdateTime = now;
    }
}
