package com.example.FinalProject.model;


import com.example.FinalProject.utils.IdGenerator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Setter
@Getter
@Entity

@AllArgsConstructor
public class SystemAccount {

    @Id
    @Column(name = "account_id")
    private Long id;

    private Long accountBalance;

    public SystemAccount() {
        this.id = IdGenerator.generateId();
        this.accountBalance = 1000000000L;
    }
}
