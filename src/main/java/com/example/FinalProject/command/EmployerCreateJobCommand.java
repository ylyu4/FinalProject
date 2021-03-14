package com.example.FinalProject.command;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class EmployerCreateJobCommand {

    private String name;

    private String company;

    private String experience;

    private String location;

    private String field;

    private Long salary;

    private String contact;

    private String deadline;

    private String description;
}
