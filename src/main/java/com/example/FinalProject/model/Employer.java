package com.example.FinalProject.model;

import com.example.FinalProject.converter.JpaConverterListJson;
import com.example.FinalProject.utils.IdGenerator;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.TypeDef;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;
import java.util.List;


@Setter
@Getter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
public class Employer {

    @Id
    @Column(name = "employer_id")
    private Long id;

    private String username;

    private String password;

    private String name;

    private String location;

    private String phone;

    private String email;

    private String description;

    private String type;

    private Long card;

    private Long accountBalance;

    private Double rate;

    private LocalDateTime accountCreateTime;


    public Employer(String username, String password) {
        this.id = IdGenerator.generateId();
        this.username = username;
        this.password = password;
        this.accountBalance = 0L;
        this.accountCreateTime = LocalDateTime.now();
    }
}
