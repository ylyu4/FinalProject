package com.example.FinalProject.repository;

import com.example.FinalProject.model.Job;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends CrudRepository<Job, Long> {

    List<Job> findAllByCreatedBy(Long userId);
}
