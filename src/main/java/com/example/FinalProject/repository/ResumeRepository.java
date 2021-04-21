package com.example.FinalProject.repository;

import com.example.FinalProject.model.Resume;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ResumeRepository extends CrudRepository<Resume, Long> {

    Optional<Resume> getResumeByFreelancerId(Long freelancerId);
}
