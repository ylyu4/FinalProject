package com.example.FinalProject.service;

import com.example.FinalProject.command.FreelancerProfileCommand;
import com.example.FinalProject.command.FreelancerResumeCommand;
import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.model.JobStatus;
import com.example.FinalProject.model.Resume;
import com.example.FinalProject.repository.FreelancerRepository;
import com.example.FinalProject.repository.JobRepository;
import com.example.FinalProject.repository.ResumeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreelancerApplicationService {

    private final FreelancerRepository freelancerRepository;

    private final ResumeRepository resumeRepository;

    private final JobRepository jobRepository;

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
            resume.setEducationStartTime(command.getEducationStartTime());
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

        return resume;
    }

    public List<Job> getAppliedJobs(Long id) {
        return jobRepository.findAllByFreelancerId(id);
    }

    public List<Job> getAvailableJobs() {
        return jobRepository.findAllByJobStatus(JobStatus.APPROVED);
    }
}
