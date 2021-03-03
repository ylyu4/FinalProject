package com.example.FinalProject.service;

import com.example.FinalProject.model.Employer;
import com.example.FinalProject.repository.EmployerRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmployerApplicationService {

    private final EmployerRepository employerRepository;

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
            return optionalEmployer.get();
        } else {
            throw new RuntimeException("Can not find user by this id: " + id);
        }
    }


}
