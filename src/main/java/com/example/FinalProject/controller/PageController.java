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
}
