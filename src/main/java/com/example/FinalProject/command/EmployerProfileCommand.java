package com.example.FinalProject.command;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EmployerProfileCommand {

    private String name;

    private String location;

    private String type;

    private String phone;

    private String email;

    private String card;

    private String description;

}
