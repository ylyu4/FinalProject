package com.example.FinalProject.model;


import com.example.FinalProject.command.EmployerCreateJobCommand;
import com.example.FinalProject.utils.IdGenerator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

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

    private String  location;

    private String field;

    private Long salary;

    private String contact;

    private LocalDateTime deadline;

    private String jobDescription;

    private JobStatus jobStatus;

    private Long freelancerId;

    private Long createdBy;

    private Long approvedBy;

    private Boolean paid;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;

    public Job(EmployerCreateJobCommand command, Long userId) throws ParseException {
        this.id = IdGenerator.generateId();
        this.name = command.getName();
        this.company = command.getCompany();
        this.experience = command.getExperience();
        this.location = command.getLocation();
        this.field = command.getField();
        this.salary = command.getSalary();
        this.contact = command.getContact();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date parsed = format.parse(command.getDeadline());
        this.deadline = parsed.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        this.jobDescription = command.getDescription();
        this.jobStatus = JobStatus.CREATED;
        this.createdBy = userId;
        this.paid = false;
        LocalDateTime now = LocalDateTime.now();
        this.createTime = now;
        this.lastUpdateTime = now;
    }
}
