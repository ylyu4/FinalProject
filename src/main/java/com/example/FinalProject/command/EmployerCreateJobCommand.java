package com.example.FinalProject.command;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

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

    @JsonFormat(pattern="yyyy-MM-dd")
    private LocalDate deadline;

    private String description;
}
