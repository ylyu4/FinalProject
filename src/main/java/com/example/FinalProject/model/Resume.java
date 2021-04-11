package com.example.FinalProject.model;


import com.example.FinalProject.command.FreelancerResumeCommand;
import com.example.FinalProject.utils.IdGenerator;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Resume {

    @Id
    @Column(name = "resume_id")
    private Long id;

    private Long freelancerId;

    private LocalDate educationStartTime;

    private LocalDate educationEndTime;

    private String school;

    private String degree;

    private String major;

    private String educationDescription;

    private LocalDate workExperienceStartTime;

    private LocalDate workExperienceEndTime;

    private String company;

    private String department;

    private String position;

    private String workExperienceDescription;

    private String language;

    private String skill;

    private String selfReviews;

    private LocalDateTime lastUpdateTime;

    public Resume(FreelancerResumeCommand command, Long id) {
        this.id = IdGenerator.generateId();
        this.freelancerId = id;
        this.educationStartTime = command.getEducationStartTime();
        this.educationEndTime = command.getEducationEndTime();
        this.school = command.getSchool();
        this.degree = command.getDegree();
        this.major = command.getMajor();
        this.educationDescription = command.getEducationDescription();
        this.workExperienceStartTime = command.getWorkExperienceStartTime();
        this.workExperienceEndTime = command.getWorkExperienceEndTime();
        this.company = command.getCompany();
        this.department = command.getDepartment();
        this.position = command.getPosition();
        this.workExperienceDescription = command.getWorkExperienceDescription();
        this.language = command.getLanguage();
        this.skill = command.getSkill();
        this.selfReviews = command.getSelfReviews();
        this.lastUpdateTime = LocalDateTime.now();
    }
}
