package com.example.FinalProject.service;

import com.example.FinalProject.command.FreelancerProfileCommand;
import com.example.FinalProject.command.FreelancerResumeCommand;
import com.example.FinalProject.model.Application;
import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.model.JobStatus;
import com.example.FinalProject.model.Resume;
import com.example.FinalProject.repository.ApplicationRepository;
import com.example.FinalProject.repository.FreelancerRepository;
import com.example.FinalProject.repository.JobRepository;
import com.example.FinalProject.repository.ResumeRepository;
import com.example.FinalProject.response.FreelancerAppliedJobListResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreelancerApplicationService {

    private final FreelancerRepository freelancerRepository;

    private final ResumeRepository resumeRepository;

    private final JobRepository jobRepository;

    private final ApplicationRepository applicationRepository;

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
        Optional<Application> optionalApplication = applicationRepository.findByFreelancerIdAndAndJobId(userId, jobId);
        if (optionalApplication.isPresent()) {
            return "existed";
        }
        Application application = new Application(userId, jobId);
        applicationRepository.save(application);
        return "successfully";
    }
}
