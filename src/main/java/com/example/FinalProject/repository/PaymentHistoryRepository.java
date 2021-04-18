package com.example.FinalProject.repository;

import com.example.FinalProject.model.PaymentHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory, Long> {

}
