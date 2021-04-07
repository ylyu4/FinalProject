package com.example.FinalProject.service;


import com.example.FinalProject.model.Job;
import com.example.FinalProject.repository.JobRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@RequiredArgsConstructor
@Slf4j
@Service
public class UserApplicationService {

    private final JobRepository jobRepository;

    @Transactional(readOnly = true)
    public Job getReviewedJobDetailById(Long id) {
        Optional<Job> optionalJob = jobRepository.findById(id);
        if (optionalJob.isPresent()) {
            return optionalJob.get();
        } else {
            throw new RuntimeException("Can not find job by this id: " + id);
        }
    }
}
