package com.gareng.app.gareng.http.entity.Register;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Username","Password","Address","Gender","Age","Email"})
public class RegisterRequest {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Password")
    private String password;
    @JsonProperty("Address")
    private String address;
    @JsonProperty("Gender")
    private String gender;
    @JsonProperty("Age")
    private String age;
    @JsonProperty("Email")
    private String email;
}
