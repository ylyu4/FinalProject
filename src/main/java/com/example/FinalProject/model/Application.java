package com.example.FinalProject.model;


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
import java.time.LocalDateTime;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Application {

    @Id
    @Column(name = "application_id")
    private Long id;

    private Long jobId;

    private Long freelancerId;

    @Enumerated(EnumType.STRING)
    private ApplicationStatus applicationStatus;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;

    public Application(Long userId, Long jobId) {
        this.id = IdGenerator.generateId();
        this.jobId = jobId;
        this.freelancerId = userId;
        this.applicationStatus = ApplicationStatus.PENDING;
        LocalDateTime now = LocalDateTime.now();
        this.createTime = now;
        this.lastUpdateTime = now;
    }

    public void updateStatus(ApplicationStatus status) {
        this.applicationStatus = status;
        this.lastUpdateTime = LocalDateTime.now();
    }
}
