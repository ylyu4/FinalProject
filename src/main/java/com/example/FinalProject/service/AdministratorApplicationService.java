package com.example.FinalProject.service;

import com.example.FinalProject.model.Administrator;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.model.JobStatus;
import com.example.FinalProject.model.SystemAccount;
import com.example.FinalProject.repository.AdministratorRepository;
import com.example.FinalProject.repository.JobRepository;
import com.example.FinalProject.repository.SystemAccountRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;


@Service
@RequiredArgsConstructor
@Slf4j
public class AdministratorApplicationService {

    private static final String key = "ISTM6210A";

    private final AdministratorRepository administratorRepository;

    private final JobRepository jobRepository;

    private final SystemAccountRepository systemAccountRepository;

    private final RedisService redisService;

    @Transactional
    public String adminRegister(String username, String password, String secretKey) {
        log.info("start register a new account for administrator");
        if (!secretKey.equals(key)) {
            return "secretKey";
        }

        Administrator administrator = administratorRepository.findAdministratorByUsername(username);
        if (administrator != null) {
            return "username";
        }
        List<SystemAccount> systemAccounts = StreamSupport.stream(systemAccountRepository.findAll().spliterator(), false)
                .collect(Collectors.toList());

        SystemAccount systemAccount;

        if (systemAccounts.size() == 0) {
            systemAccount = systemAccountRepository.save(new SystemAccount());
        } else {
            systemAccount = systemAccounts.get(0);
        }


        administratorRepository.save(new Administrator(username, password, systemAccount.getId()));
        return "true";
    }

    @Transactional(readOnly = true)
    public String adminLogin(String username, String password) {
        log.info("start login the administrator account");
        Administrator administrator = administratorRepository.findAdministratorByUsernameAndPassword(username, password);
        if (administrator == null) {
            return "fail";
        }
        String token = UUID.randomUUID().toString();
        redisService.set(token, administrator.getId());
        return token;
    }

    @Transactional(readOnly = true)
    public Administrator getAdmin(Long id) {
        Optional<Administrator> optionalAdministrator = administratorRepository.findById(id);
        if (optionalAdministrator.isPresent()) {
            return optionalAdministrator.get();
        } else {
            throw new RuntimeException("Can not find user by this id: " + id);
        }
    }

    @Transactional
    public Administrator updateAdminProfile(Long userId, String name, String phone, String email) {
        log.info("The current id is " + userId);
        Optional<Administrator> optionalAdministrator = administratorRepository.findById(userId);
        if (optionalAdministrator.isPresent()) {
            Administrator administrator = optionalAdministrator.get();
            administrator.setName(name);
            administrator.setPhone(phone);
            administrator.setEmail(email);
            return administratorRepository.save(administrator);
        } else {
            throw new RuntimeException("Can not find user by this id: " + userId);
        }

    }

    @Transactional(readOnly = true)
    public Long getSystemAccountBalance() {
        SystemAccount systemAccount = systemAccountRepository.findAll().iterator().next();

        return systemAccount.getAccountBalance();
    }


    @Transactional(readOnly = true)
    public List<Job> getAllNewCreatedJobs() {
        return jobRepository.findAllByJobStatus(JobStatus.CREATED);
    }

    @Transactional
    public String processNewUnreleasedJob(Long jobId, String action) {
        Optional<Job> optionalJob = jobRepository.findById(jobId);

        if (optionalJob.isPresent()) {
            Job job = optionalJob.get();
            if (action.equals("Approve")) {
                job.setJobStatus(JobStatus.APPROVED);
            } else {
                job.setJobStatus(JobStatus.REJECTED);
            }

            jobRepository.save(job);
            return "Successfully";
        } else {
            throw new RuntimeException("Can not find job by this id: " + jobId);
        }
    }

}
