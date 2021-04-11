package com.example.FinalProject.service;

import com.example.FinalProject.command.EmployerCreateJobCommand;
import com.example.FinalProject.command.EmployerProfileCommand;
import com.example.FinalProject.model.Employer;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.repository.EmployerRepository;
import com.example.FinalProject.repository.JobRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmployerApplicationService {

    private final EmployerRepository employerRepository;

    private final JobRepository jobRepository;

    private final RedisService redisService;

    @Transactional
    public String employerRegister(String username, String password) {
        log.info("start register a new account for employer");

        Employer employer = employerRepository.findEmployerByUsername(username);
        if (employer != null) {
            return "username";
        }
        employerRepository.save(new Employer(username, password));
        return "true";
    }

    @Transactional(readOnly = true)
    public String employerLogin(String username, String password) {
        log.info("start login the administrator account");
        Employer employer = employerRepository.findEmployerByUsernameAndPassword(username, password);
        if (employer == null) {
            return "fail";
        }
        String token = UUID.randomUUID().toString();
        redisService.set(token, employer.getId());
        return token;
    }


    @Transactional(readOnly = true)
    public Employer getEmployer(Long id) {
        Optional<Employer> optionalEmployer = employerRepository.findById(id);
        if (optionalEmployer.isPresent()) {
            Employer employer = optionalEmployer.get();
            return employerRepository.save(employer);
        } else {
            throw new RuntimeException("Can not find user by this id: " + id);
        }
    }

    @Transactional(readOnly = true)
    public List<Job> getPostedJobs(Long id) {
        return jobRepository.findAllByCreatedBy(id);
    }


    @Transactional
    public Employer updateEmployerProfile(Long userId, EmployerProfileCommand command) {
        log.info("The current id is " + userId);
        Optional<Employer> optionalEmployer = employerRepository.findById(userId);
        if (optionalEmployer.isPresent()) {
            Employer employer = optionalEmployer.get();
            employer.setName(command.getName());
            employer.setLocation(command.getLocation());
            employer.setType(command.getType());
            employer.setPhone(command.getPhone());
            employer.setEmail(command.getEmail());
            employer.setDescription(command.getDescription());
            return employerRepository.save(employer);
        } else {
            throw new RuntimeException("Can not find user by this id: " + userId);
        }
    }

    @Transactional
    public String createJob(EmployerCreateJobCommand command, Long userId) {
        Optional<Employer> optionalEmployer = employerRepository.findById(userId);
        if (optionalEmployer.isPresent()) {
            Job job = new Job(command, userId);
            jobRepository.save(job);
            return "Created";
        } else {
            throw new RuntimeException("Can not find user by this id: " + userId);
        }
    }
}
