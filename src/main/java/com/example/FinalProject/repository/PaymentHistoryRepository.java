package com.example.FinalProject.repository;

import com.example.FinalProject.model.PaymentHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory, Long> {

    List<PaymentHistory> findAllByAccountId(Long accountId);

    List<PaymentHistory> findAllByFreelancerId(Long freelancerId);

    List<PaymentHistory> findAllByEmployerId(Long employerId);
}
