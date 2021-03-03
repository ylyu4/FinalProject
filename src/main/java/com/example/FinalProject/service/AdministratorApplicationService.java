package com.example.FinalProject.service;

import com.example.FinalProject.model.Administrator;
import com.example.FinalProject.repository.AdministratorRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;


@Service
@RequiredArgsConstructor
@Slf4j
public class AdministratorApplicationService {

    private static final String key = "ISTM6210A";

    private final AdministratorRepository administratorRepository;

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
        administratorRepository.save(new Administrator(username, password));
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

}
