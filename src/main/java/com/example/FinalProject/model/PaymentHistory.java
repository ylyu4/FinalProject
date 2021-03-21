package com.example.FinalProject.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class PaymentHistory {

    @Id
    @Column(name = "history_id")
    private Long id;

    private Long accountId;

    private Long employerId;

    private Long freelancerId;

    private Long transactionAmount;

    private LocalDateTime transactionTime;
}
