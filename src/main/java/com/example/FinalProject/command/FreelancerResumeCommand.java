package com.example.FinalProject.command;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FreelancerResumeCommand {

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate educationStartTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate educationEndTime;

    private String school;

    private String degree;

    private String major;

    private String educationDescription;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate workExperienceStartTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate workExperienceEndTime;

    private String company;

    private String department;

    private String position;

    private String workExperienceDescription;

    private String language;

    private String skill;

    private String selfReviews;
}
