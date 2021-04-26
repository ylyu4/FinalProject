package com.example.FinalProject.repository;

import com.example.FinalProject.model.Application;
import com.example.FinalProject.model.ApplicationStatus;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ApplicationRepository extends CrudRepository<Application, Long> {

    Optional<Application> findByFreelancerIdAndJobId(Long freelancerId, Long jobId);

    Optional<Application> findByJobIdAndFreelancerId(Long jobId, Long freelancerId);

    List<Application> findAllByJobId(Long jobId);

    List<Application> findAllByFreelancerId(Long freelancerId);

    List<Application> findAllByApplicationStatus(ApplicationStatus status);
}
