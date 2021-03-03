package com.example.FinalProject.service;

import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.repository.FreelancerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreelancerApplicationService {

    private final FreelancerRepository freelancerRepository;

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
        } else {
            throw new RuntimeException("Can not find user by this id: " + id);
        }
    }
}
