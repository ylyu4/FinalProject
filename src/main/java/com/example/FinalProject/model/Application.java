package com.example.FinalProject.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Application {

    @Id
    private Long id;

    private Long jobId;

    private Long freelancerId;

    private ApplicationStatus applicationStatus;

    private LocalDateTime createTime;

    private LocalDateTime lastUpdateTime;
}
