package com.gareng.app.gareng.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "USERS")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String uuid;
    private String username;
    private String password;
    private String address;
    private String gender;
    private Integer age;
    private String email;

    public User(String uuid, String username, String password, String address, String gender, Integer age,
            String email) {
        this.uuid = uuid;
        this.username = username;
        this.password = password;
        this.address = address;
        this.gender = gender;
        this.age = age;
        this.email = email;
    }
}
