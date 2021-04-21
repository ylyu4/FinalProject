package com.example.FinalProject.response;

import com.example.FinalProject.model.PaymentHistory;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentHistoryResponse {

    private Long paymentHistoryId;

    private Long amount;

    private LocalDateTime transactionTime;


    public PaymentHistoryResponse(PaymentHistory paymentHistory) {
        this.paymentHistoryId = paymentHistory.getId();
        this.amount = paymentHistory.getTransactionAmount();
        this.transactionTime = paymentHistory.getTransactionTime();
    }
}
