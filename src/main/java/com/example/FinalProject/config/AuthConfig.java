package com.example.FinalProject.config;

import com.example.FinalProject.interceptor.AuthInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AuthConfig implements WebMvcConfigurer {

    @Bean
    public AuthInterceptor initAuthInterceptor(){
        return new AuthInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        String[] excludePathPatterns = {"/admin/signup", "/admin/login", "/page/**"};
        registry.addInterceptor(initAuthInterceptor())
                .addPathPatterns("/admin/action/**")
                .addPathPatterns("/employer/action/**")
                .addPathPatterns("/freelancer/action/**")
                .addPathPatterns("/user/action/**");
    }

}