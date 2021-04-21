package com.example.FinalProject.service;

import com.example.FinalProject.command.FreelancerProfileCommand;
import com.example.FinalProject.command.FreelancerResumeCommand;
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
import com.example.FinalProject.response.FreelancerAppliedJobListResponse;
import com.example.FinalProject.response.PaymentHistoryResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreelancerApplicationService {

    private final FreelancerRepository freelancerRepository;

    private final EmployerRepository employerRepository;

    private final SystemAccountRepository systemAccountRepository;

    private final ResumeRepository resumeRepository;

    private final JobRepository jobRepository;

    private final ApplicationRepository applicationRepository;

    private final PaymentHistoryRepository paymentHistoryRepository;

    private final RedisService redisService;

    @Transactional
    public String freelancerRegister(String username, String password) {
        log.info("start register a new account for employer");

        Freelancer freelancer = freelancerRepository.findFreelancerByUsername(username);
        if (freelancer != null) {
            return "username";
        }
        freelancerRepository.save(new Freelancer(username, password));
        return "true";
    }

    @Transactional(readOnly = true)
    public String freelancerLogin(String username, String password) {
        log.info("start login the administrator account");
        Freelancer freelancer = freelancerRepository.findFreelancerByUsernameAndPassword(username, password);
        if (freelancer == null) {
            return "fail";
        }
        String token = UUID.randomUUID().toString();
        redisService.set(token, freelancer.getId());
        return token;
    }


    @Transactional(readOnly = true)
    public Freelancer getFreelancer(Long id) {
        Optional<Freelancer> optionalFreelancer = freelancerRepository.findById(id);
        if (optionalFreelancer.isPresent()) {
            return optionalFreelancer.get();
        }

        throw new RuntimeException("Can not find user by this id: " + id);
    }

    @Transactional
    public Freelancer updateFreelancerProfile(Long id, FreelancerProfileCommand command) {
        Optional<Freelancer> optionalFreelancer = freelancerRepository.findById(id);
        if (optionalFreelancer.isPresent()) {
            Freelancer freelancer = optionalFreelancer.get();
            freelancer.setName(command.getName());
            freelancer.setAge(command.getAge());
            freelancer.setLocation(command.getLocation());
            freelancer.setPhone(command.getPhone());
            freelancer.setEmail(command.getEmail());
            freelancer.setSchool(command.getSchool());
            freelancer.setCard(command.getCard());
            return freelancerRepository.save(freelancer);
        }

        throw new RuntimeException("Can not find user by this id: " + id);

    }

    @Transactional(readOnly = true)
    public Resume getFreelancerResumeByFreelancerId(Long id) {
        Optional<Resume> optionalResume = resumeRepository.getResumeByFreelancerId(id);
        return optionalResume.orElse(null);
    }

    @Transactional
    public Resume updateResume(Long id, FreelancerResumeCommand command) {
        Optional<Resume> optionalResume = resumeRepository.getResumeByFreelancerId(id);
        Resume resume;
        if (optionalResume.isPresent()) {
            resume = optionalResume.get();
            resume.setEducationStartTime(command.getEducationEndTime());
            resume.setEducationEndTime(command.getEducationEndTime());
            resume.setSchool(command.getSchool());
            resume.setDegree(command.getDegree());
            resume.setMajor(command.getMajor());
            resume.setEducationDescription(command.getEducationDescription());
            resume.setWorkExperienceStartTime(command.getWorkExperienceStartTime());
            resume.setWorkExperienceEndTime(command.getWorkExperienceEndTime());
            resume.setCompany(command.getCompany());
            resume.setDepartment(command.getDepartment());
            resume.setPosition(command.getPosition());
            resume.setWorkExperienceDescription(command.getWorkExperienceDescription());
            resume.setLanguage(command.getLanguage());
            resume.setSkill(command.getSkill());
            resume.setSelfReviews(command.getSelfReviews());
            resume.setLastUpdateTime(LocalDateTime.now());
        } else {
            resume = new Resume(command, id);
        }
        return resumeRepository.save(resume);
    }

    @Transactional(readOnly = true)
    public List<FreelancerAppliedJobListResponse> getAppliedJobs(Long id) {
        List<Application> applicationList = applicationRepository.findAllByFreelancerId(id);
        List<Long> jobIds = applicationList.stream().map(Application::getJobId).collect(Collectors.toList());
        List<FreelancerAppliedJobListResponse> responses = new ArrayList<>();
        jobIds.forEach(jobId -> {
            Optional<Job> optionalJob = jobRepository.findById(jobId);
            Optional<Application> optionalApplication = applicationRepository.findByJobId(jobId);
            if (optionalApplication.isPresent() && optionalJob.isPresent()) {
                responses.add(new FreelancerAppliedJobListResponse(optionalApplication.get(), optionalJob.get()));
            }
        });
        return responses;
    }

    @Transactional(readOnly = true)
    public List<Job> getAvailableJobs() {
        return jobRepository.findAllByJobStatus(JobStatus.APPROVED);
    }

    @Transactional
    public String applyJob(Long userId, Long jobId) {
        Optional<Application> optionalApplication = applicationRepository.findByFreelancerIdAndJobId(userId, jobId);
        if (optionalApplication.isPresent()) {
            return "existed";
        }
        Application application = new Application(userId, jobId);
        applicationRepository.save(application);
        return "successfully";
    }

    @Transactional
    public String acceptInterviewOrOffer(Long userId, Long jobId) {
        Optional<Application> optionalApplication = applicationRepository.findByFreelancerIdAndJobId(userId, jobId);
        if (optionalApplication.isPresent()) {
            Application application = optionalApplication.get();
            if (application.getApplicationStatus() == ApplicationStatus.INVITING) {
                application.setApplicationStatus(ApplicationStatus.INTERVIEWING);
                application.setLastUpdateTime(LocalDateTime.now());
            } else {
                application.setApplicationStatus(ApplicationStatus.DONE);
                application.setLastUpdateTime(LocalDateTime.now());
                Optional<Job> optionalJob = jobRepository.findById(jobId);
                if (optionalJob.isPresent()) {
                    Job job = optionalJob.get();
                    job.setJobStatus(JobStatus.ASSIGNED);
                    jobRepository.save(job);
                    Long employerId = job.getCreatedBy();
                    Optional<Employer> optionalEmployer = employerRepository.findById(employerId);
                    if (optionalEmployer.isPresent()) {
                        Employer employer = optionalEmployer.get();
                        Long remainingBalance = employer.getAccountBalance() - job.getSalary();
                        employer.setAccountBalance(remainingBalance);
                        SystemAccount systemAccount = systemAccountRepository.findAll().iterator().next();
                        PaymentHistory employerPaymentHistory = new PaymentHistory(job.getSalary() * -1);
                        employerPaymentHistory.setEmployerId(employerId);
                        PaymentHistory systemPaymentHistory = new PaymentHistory(job.getSalary());
                        systemPaymentHistory.setAccountId(systemAccount.getId());
                        paymentHistoryRepository.save(employerPaymentHistory);
                        paymentHistoryRepository.save(systemPaymentHistory);
                        Long newBalance = systemAccount.getAccountBalance() + job.getSalary();
                        systemAccount.setAccountBalance(newBalance);
                        employerRepository.save(employer);
                        systemAccountRepository.save(systemAccount);
                    } else {
                        return "error";
                    }
                } else {
                    return "error";
                }
                List<Application> applicationList = applicationRepository.findAllByJobId(jobId);
                applicationRepository.saveAll(applicationList.stream().peek(application1 -> application1.setApplicationStatus(ApplicationStatus.REJECTED)).collect(Collectors.toList()));
            }
            applicationRepository.save(application);
            return "successfully";
        } else {
            return "error";
        }
    }

    @Transactional
    public String declineInterviewOrOffer(Long userId, Long jobId) {
        Optional<Application> optionalApplication = applicationRepository.findByFreelancerIdAndJobId(userId, jobId);
        if (optionalApplication.isPresent()) {
            Application application = optionalApplication.get();
            application.setApplicationStatus(ApplicationStatus.REJECTED);
            application.setLastUpdateTime(LocalDateTime.now());
            applicationRepository.save(application);
            return "successfully";
        } else {
            return "error";
        }
    }

    @Transactional
    public String startWork(Long jobId, JobStatus status) {
        Optional<Job> optionalJob = jobRepository.findById(jobId);
        if (optionalJob.isPresent()) {
            Job job = optionalJob.get();
            if (status == JobStatus.ASSIGNED) {
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

    @Transactional
    public String completeWork(Long jobId, JobStatus status) {
        Optional<Job> optionalJob = jobRepository.findById(jobId);
        if (optionalJob.isPresent()) {
            Job job = optionalJob.get();
            if (status == JobStatus.WORKING) {
                job.setJobStatus(JobStatus.FINISHED);
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
        List<PaymentHistory> paymentHistories = paymentHistoryRepository.findAllByFreelancerId(userId);
        return paymentHistories.stream().map(PaymentHistoryResponse::new).collect(Collectors.toList());
    }

    @Transactional
    public String withdrawMoney(Long userId, Long amount) {
        Optional<Freelancer> optionalFreelancer = freelancerRepository.findById(userId);
        if (optionalFreelancer.isPresent()) {
            Freelancer freelancer = optionalFreelancer.get();
            if (freelancer.getCard() == null) {
                return "card";
            }
            Long currentBalance = freelancer.getAccountBalance();
            if (amount > currentBalance) {
                return "shortage";
            }
            freelancer.setAccountBalance(currentBalance - amount);
            PaymentHistory paymentHistory = new PaymentHistory(amount * -1);
            paymentHistory.setFreelancerId(userId);
            paymentHistoryRepository.save(paymentHistory);
            freelancerRepository.save(freelancer);
            return "successfully";
        }
        return "error";
    }
}
