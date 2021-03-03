package com.example.FinalProject.model;


import com.example.FinalProject.utils.IdGenerator;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
@Entity(name = "administrator")
@NoArgsConstructor
@AllArgsConstructor
public class Administrator {

    @Id
    private Long id;

    private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    @OneToMany
    private List<Job> reviewedJobs;

    private LocalDateTime accountCreateTime;


    public Administrator(String username, String password) {
        this.id = IdGenerator.generateId();
        this.username = username;
        this.password = password;
        this.accountCreateTime = LocalDateTime.now();
    }

}
