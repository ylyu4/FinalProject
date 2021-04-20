package com.example.FinalProject.response;

import com.example.FinalProject.model.Application;
import com.example.FinalProject.model.Job;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FreelancerAppliedJobListResponse {

    private Long id;

    private String name;

    private String experience;

    private String location;

    private Long salary;

    private String status;

    private Boolean paid;

    public FreelancerAppliedJobListResponse(Application application, Job job) {
        this.id = job.getId();
        this.name = job.getName();
        this.experience = job.getExperience();
        this.location = job.getLocation();
        this.salary = job.getSalary();
        if (application.getApplicationStatus().name().equals("DONE")) {
            this.status = job.getJobStatus().name();
        } else {
            this.status = application.getApplicationStatus().name();
        }
        this.paid = this.status.equals("COMPLETED");
    }
}
