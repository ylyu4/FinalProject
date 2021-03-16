package com.example.FinalProject.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalDateTime;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Resume {

    @Id
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
}
