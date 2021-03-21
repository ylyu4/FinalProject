package com.example.FinalProject.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Feedback {

    @Id
    @Column(name = "feedback_id")
    private Long id;

    private UserType userType;

    private Integer rate;

    private String content;

    private LocalDateTime createTime;

    private Long freelancerId;

    private Long employerId;

}
