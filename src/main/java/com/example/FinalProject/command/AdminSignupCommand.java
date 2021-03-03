package com.example.FinalProject.command;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class AdminSignupCommand {

    private String username;

    private String password;

    private String secretKey;

}
