package com.example.FinalProject.repository;

import com.example.FinalProject.model.Application;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ApplicationRepository extends CrudRepository<Application, Long> {

    Optional<Application> findByFreelancerIdAndAndJobId(Long freelancerId, Long jobId);

}
