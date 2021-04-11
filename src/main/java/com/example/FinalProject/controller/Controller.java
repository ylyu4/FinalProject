package com.example.FinalProject.controller;


import com.alibaba.fastjson.JSON;
import com.example.FinalProject.command.*;
import com.example.FinalProject.model.Administrator;
import com.example.FinalProject.model.Employer;
import com.example.FinalProject.model.Freelancer;
import com.example.FinalProject.model.Job;
import com.example.FinalProject.model.Resume;
import com.example.FinalProject.response.FreelancerAppliedJobListResponse;
import com.example.FinalProject.service.AdministratorApplicationService;
import com.example.FinalProject.service.EmployerApplicationService;
import com.example.FinalProject.service.FreelancerApplicationService;
import com.example.FinalProject.service.RedisService;
import com.example.FinalProject.service.UserApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;


@RestController
@RequiredArgsConstructor
public class Controller {

    private final AdministratorApplicationService administratorApplicationService;

    private final EmployerApplicationService employerApplicationService;

    private final FreelancerApplicationService freelancerApplicationService;

    private final UserApplicationService userApplicationService;

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

    @GetMapping("/admin/action/get/system-balance")
    public String getSystemCurrentBalance() {
        Long balance = administratorApplicationService.getSystemAccountBalance();
        return JSON.toJSONString(balance);
    }

    @GetMapping("/admin/action/get/jobs")
    public String getAllNewUnreleasedJobs() {
        List<Job> jobList =  administratorApplicationService.getAllNewCreatedJobs();
        return JSON.toJSONString(jobList);
    }

    @GetMapping("/user/action/get/job/detail")
    public String getReviewedJobDetail(String jobId) {
        Long parsedJobId = Long.valueOf(jobId);
        return JSON.toJSONString(userApplicationService.getReviewedJobDetailById(parsedJobId));
    }

    @PostMapping("/admin/action/process/job")
    public String processNewUnreleasedJob(@RequestBody AdminProcessJobCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        String result = administratorApplicationService.processNewUnreleasedJob(Long.parseLong(command.getId()), command.getAction(), id);
        return JSON.toJSONString(result);
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

    @GetMapping("/employer/action/posted-jobs")
    public String employerPostedJobs(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        List<Job> jobList = employerApplicationService.getPostedJobs(id);
        return JSON.toJSONString(jobList);
    }

    @PostMapping("/employer/action/update/profile")
    public String updateEmployerProfile(@RequestBody EmployerProfileCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Employer employer = employerApplicationService.updateEmployerProfile(id, command);
        return JSON.toJSONString(employer);
    }

    @PostMapping("/employer/action/create/job")
    public String createJob(@RequestBody EmployerCreateJobCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        String response = employerApplicationService.createJob(command, id);
        return JSON.toJSONString(response);
    }

    @GetMapping("/employer/action/check/job/applicants")
    public String checkJobApplicants(Long jobId) {
        return JSON.toJSONString(employerApplicationService.checkApplicantsList(jobId));
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


    @PostMapping("/freelancer/action/update/profile")
    public String updateFreelancerProfile(@RequestBody FreelancerProfileCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Freelancer freelancer = freelancerApplicationService.updateFreelancerProfile(id, command);
        return JSON.toJSONString(freelancer);
    }

    @GetMapping("/freelancer/action/get/resume")
    public String getFreelancerResume(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        return JSON.toJSONString(freelancerApplicationService.getFreelancerResumeByFreelancerId(id));
    }

    @PostMapping("/freelancer/action/update/resume")
    public String updateFreelancerResume(@RequestBody FreelancerResumeCommand command, HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        Resume resume = freelancerApplicationService.updateResume(id, command);
        return JSON.toJSONString(resume);
    }

    @GetMapping("/freelancer/action/get/applied-jobs")
    public String freelancerGetAppliedJobs(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        List<FreelancerAppliedJobListResponse> jobList = freelancerApplicationService.getAppliedJobs(id);
        return JSON.toJSONString(jobList);
    }

    @GetMapping("/freelancer/action/get/available-jobs")
    public String freelancerGetAvailableJobs() {
        List<Job> jobList = freelancerApplicationService.getAvailableJobs();
        return JSON.toJSONString(jobList);
    }

    @GetMapping("/freelancer/action/apply/job")
    public String freelancerApplyJob(HttpServletRequest request, Long jobId) {
        String token = request.getHeader("Authorization");
        Long id = (Long) redisService.get(token);
        return JSON.toJSONString(freelancerApplicationService.applyJob(id, jobId));
    }
}
