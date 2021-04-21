package com.example.FinalProject.service;


import com.example.FinalProject.command.EmployerCreateJobCommand;
import com.example.FinalProject.command.EmployerProfileCommand;
import com.example.FinalProject.model.Application;
import com.example.FinalProject.model.ApplicationStatus;
import com.example.FinalProject.model.Employer;
import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.model.JobStatus;
import com.example.FinalProject.model.PaymentHistory;
import com.example.FinalProject.model.Resume;
import com.example.FinalProject.model.SystemAccount;
import com.example.FinalProject.repository.ApplicationRepository;
import com.example.FinalProject.repository.EmployerRepository;
import com.example.FinalProject.repository.FreelancerRepository;
import com.example.FinalProject.repository.JobRepository;
import com.example.FinalProject.repository.PaymentHistoryRepository;
import com.example.FinalProject.repository.ResumeRepository;
import com.example.FinalProject.repository.SystemAccountRepository;
import com.example.FinalProject.response.PaymentHistoryResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmployerApplicationService {

    private final EmployerRepository employerRepository;

    private final FreelancerRepository freelancerRepository;

    private final JobRepository jobRepository;

    private final ApplicationRepository applicationRepository;

    private final ResumeRepository resumeRepository;

    private final PaymentHistoryRepository paymentHistoryRepository;

    private final SystemAccountRepository systemAccountRepository;

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
            employer.setCard(command.getCard());
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

    @Transactional(readOnly = true)
    public List<Application> checkApplicantsList(Long jobId) {
        return applicationRepository.findAllByJobId(jobId);
    }

    @Transactional(readOnly = true)
    public Freelancer getApplicantInformation(Long applicantId) {
        Optional<Freelancer> freelancer = freelancerRepository.findById(applicantId);
        return freelancer.orElse(null);
    }

    @Transactional(readOnly = true)
    public Resume getApplicantResume(Long applicantId) {
        Optional<Resume> resume = resumeRepository.getResumeByFreelancerId(applicantId);
        return resume.orElse(null);
    }

    @Transactional(readOnly = true)
    public Application getApplication(Long applicationId) {
        Optional<Application> application = applicationRepository.findById(applicationId);
        return application.orElse(null);
    }

    @Transactional
    public String updateApplication(Long applicationId, ApplicationStatus status, Long userId) {
        Optional<Application> optionalApplication = applicationRepository.findById(applicationId);
        if (optionalApplication.isPresent()) {
            Application application = optionalApplication.get();
            if (status == ApplicationStatus.OFFER) {
                Optional<Job> optionalJob = jobRepository.findById(application.getJobId());
                if (optionalJob.isPresent()) {
                    Long cost = optionalJob.get().getSalary();
                    Optional<Employer> optionalEmployer = employerRepository.findById(userId);
                    if (optionalEmployer.isPresent()) {
                        Employer employer = optionalEmployer.get();
                        Long currentBalance = employer.getAccountBalance();
                        if (currentBalance < cost) {
                            return "recharge";
                        }
                    } else {
                        return "error";
                    }
                } else {
                    return "error";
                }
            }
            application.updateStatus(status);
            applicationRepository.save(application);
            return "successfully";
        }
        return "error";
    }

    @Transactional
    public String rechargeMoneyToAccount(Long userId, Long amount) {
        Optional<Employer> optionalEmployer = employerRepository.findById(userId);
        if (optionalEmployer.isPresent()) {
            Employer employer = optionalEmployer.get();
            if (employer.getCard() == null) {
                return "card";
            }
            Long currentAmount = employer.getAccountBalance();
            currentAmount += amount;
            employer.setAccountBalance(currentAmount);
            employerRepository.save(employer);
            PaymentHistory paymentHistory = new PaymentHistory(amount);
            paymentHistory.setEmployerId(userId);
            paymentHistoryRepository.save(paymentHistory);
            return "successfully";
        }
        return "error";
    }

    @Transactional
    public String approveCompleteWork(Long jobId, JobStatus status) {
        Optional<Job> optionalJob = jobRepository.findById(jobId);
        if (optionalJob.isPresent()) {
            Job job = optionalJob.get();
            if (status == JobStatus.FINISHED) {
                job.setJobStatus(JobStatus.DONE);
            } else {
                return "error";
            }
            job.setLastUpdateTime(LocalDateTime.now());
            job.setPaid(true);
            jobRepository.save(job);
            SystemAccount systemAccount = systemAccountRepository.findAll().iterator().next();
            Long amount = job.getSalary();
            systemAccount.setAccountBalance(systemAccount.getAccountBalance() - amount);
            systemAccountRepository.save(systemAccount);
            PaymentHistory systemPaymentHistory = new PaymentHistory(amount * -1);
            systemPaymentHistory.setAccountId(systemAccount.getId());
            PaymentHistory freelancerPaymentHistory = new PaymentHistory(amount);
            freelancerPaymentHistory.setFreelancerId(job.getFreelancerId());
            paymentHistoryRepository.save(systemPaymentHistory);
            paymentHistoryRepository.save(freelancerPaymentHistory);
            return "successfully";
        } else {
            return "error";
        }
    }

    @Transactional
    public String rejectCompleteWork(Long jobId, JobStatus status) {
        Optional<Job> optionalJob = jobRepository.findById(jobId);
        if (optionalJob.isPresent()) {
            Job job = optionalJob.get();
            if (status == JobStatus.FINISHED) {
                job.setJobStatus(JobStatus.WORKING);
            } else {
                return "error";
            }
            job.setLastUpdateTime(LocalDateTime.now());
            jobRepository.save(job);
            return "successfully";
        } else {
            return "error";
        }
    }

    @Transactional(readOnly = true)
    public List<PaymentHistoryResponse> getAllPaymentHistory(Long userId) {
        List<PaymentHistory> paymentHistories = paymentHistoryRepository.findAllByEmployerId(userId);
        return paymentHistories.stream().map(PaymentHistoryResponse::new).collect(Collectors.toList());
    }
}
