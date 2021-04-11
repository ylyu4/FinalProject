package com.example.FinalProject.controller;


import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class PageController {


    @RequestMapping("/page/homepage")
    public String goToMainPage() {
        return "main";
    }

    @RequestMapping("/page/admin/login")
    public String goToAdminLoginPage() {
        return "administrator_login";
    }

    @RequestMapping("/page/admin/signup")
    public String goToAdminSignUpPage() {
        return "administrator_sign_up";
    }

    @RequestMapping("/page/admin/profile")
    public String goToAdminProfilePage() {
        return "administrator_profile";
    }

    @RequestMapping("/page/admin/view-job")
    public String goToAdminViewJobPage() {
        return "administrator_view_job";
    }

    @RequestMapping("/page/employer/login")
    public String goToEmployerLoginPage() {
        return "employer_login";
    }

    @RequestMapping("/page/employer/signup")
    public String goToEmployerSignUpPage() {
        return "employer_sign_up";
    }

    @RequestMapping("/page/employer/profile")
    public String goToEmployerProfilePage() {
        return "employer_profile";
    }

    @RequestMapping("/page/employer/create-job")
    public String goToEmployerCreateJobPage() {
        return "employer_write_job_description";
    }

    @RequestMapping("/page/employer/check-applicants-list")
    public String goToEmployerApplicantsListPage() {
        return "employer_applicants_list";
    }

    @RequestMapping("/page/freelancer/login")
    public String goToFreelancerLoginPage() {
        return "freelancer_login";
    }

    @RequestMapping("/page/freelancer/signup")
    public String goToFreelancerSignUpPage() {
        return "freelancer_sign_up";
    }

    @RequestMapping("/page/freelancer/profile")
    public String goToFreelancerProfilePage() {
        return "freelancer_profile";
    }

    @RequestMapping("/page/freelancer/view-resume")
    public String goToFreelancerResumePage() {
        return "freelancer_view_resume";
    }

    @RequestMapping("/page/freelancer/browse-jobs")
    public String goToFreelancerBrowseJobPage() {
        return "freelancer_browse_jobs";
    }

    @RequestMapping("/page/freelancer/browse-job-details")
    public String goToFreelancerBrowseJobDetailPage() {
        return "freelancer_browse_jobs_details";
    }
}
