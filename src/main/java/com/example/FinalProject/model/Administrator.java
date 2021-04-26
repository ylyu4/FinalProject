package com.example.FinalProject.model;


import com.example.FinalProject.utils.IdGenerator;
import com.vladmihalcea.hibernate.type.json.JsonBinaryType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.TypeDef;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;


@Getter
@Setter
@Entity(name = "administrator")
@NoArgsConstructor
@AllArgsConstructor
@TypeDef(name = "jsonb", typeClass = JsonBinaryType.class)
public class Administrator {

    @Id
    @Column(name = "administrator_id")
    private Long id;

    private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    private LocalDateTime accountCreateTime;

    private Long accountId;


    public Administrator(String username, String password, Long accountId) {
        this.id = IdGenerator.generateId();
        this.username = username;
        this.password = password;
        this.accountId = accountId;
        this.accountCreateTime = LocalDateTime.now();
    }

}
