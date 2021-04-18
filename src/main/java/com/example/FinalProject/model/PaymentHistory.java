package com.example.FinalProject.model;


import com.example.FinalProject.utils.IdGenerator;
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

    public PaymentHistory(Long transactionAmount) {
        this.id = IdGenerator.generateId();
        this.transactionAmount = transactionAmount;
        this.transactionTime = LocalDateTime.now();
    }
}
