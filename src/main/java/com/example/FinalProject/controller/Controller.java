package com.example.FinalProject.controller;


import com.alibaba.fastjson.JSON;
import com.example.FinalProject.command.AdminProfileCommand;
import com.example.FinalProject.command.AdminSignupCommand;
import com.example.FinalProject.command.EmployerSignUpCommand;
import com.example.FinalProject.command.FreelancerSignUpCommand;
import com.example.FinalProject.model.Administrator;
import com.example.FinalProject.model.Employer;
import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.service.AdministratorApplicationService;
import com.example.FinalProject.service.EmployerApplicationService;
import com.example.FinalProject.service.FreelancerApplicationService;
import com.example.FinalProject.service.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequiredArgsConstructor
public class Controller {

    private final AdministratorApplicationService administratorApplicationService;

    private final EmployerApplicationService employerApplicationService;

    private final FreelancerApplicationService freelancerApplicationService;

    private final RedisService redisService;


    @PostMapping("/admin/signup")
    public String adminRegister(@RequestBody AdminSignupCommand command) {
        String response = administratorApplicationService.adminRegister(command.getUsername(), command.getPassword(), command.getSecretKey());
        return JSON.toJSONString(response);
    }

    @GetMapping("/admin/login")
    public String adminLogin(@RequestParam(name = "username") String username, @RequestParam(name = "password") String password) {
        String response = administratorApplicationService.adminLogin(username, password);
        return JSON.toJSONString(response);
    }

    @GetMapping("/admin/action/profile")
    public String adminProfile(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Administrator administrator = administratorApplicationService.getAdmin(id);
        return JSON.toJSONString(administrator);
    }

    @PostMapping("/admin/action/update/profile")
    public String updateAdminProfile(@RequestBody AdminProfileCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Administrator administrator = administratorApplicationService.updateAdminProfile(id, command.getName(), command.getPhone(), command.getEmail());
        return JSON.toJSONString(administrator);
    }

    @PostMapping("/employer/signup")
    public String employerRegister(@RequestBody EmployerSignUpCommand command) {
        String response = employerApplicationService.employerRegister(command.getUsername(), command.getPassword());
        return JSON.toJSONString(response);
    }

    @GetMapping("/employer/login")
    public String employerLogin(@RequestParam(name = "username") String username, @RequestParam(name = "password") String password) {
        String response = employerApplicationService.employerLogin(username, password);
        return JSON.toJSONString(response);
    }

    @GetMapping("/employer/action/profile")
    public String employerProfile(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Employer employer = employerApplicationService.getEmployer(id);
        return JSON.toJSONString(employer);
    }

    @PostMapping("/freelancer/signup")
    public String freelancerRegister(@RequestBody FreelancerSignUpCommand command) {
        String response = freelancerApplicationService.freelancerRegister(command.getUsername(), command.getPassword());
        return JSON.toJSONString(response);
    }

    @GetMapping("/freelancer/login")
    public String freelancerLogin(@RequestParam(name = "username") String username, @RequestParam(name = "password") String password) {
        String response = freelancerApplicationService.freelancerLogin(username, password);
        return JSON.toJSONString(response);
    }

    @GetMapping("/freelancer/action/profile")
    public String freelancerProfile(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Freelancer freelancer = freelancerApplicationService.getFreelancer(id);
        return JSON.toJSONString(freelancer);
    }
}
