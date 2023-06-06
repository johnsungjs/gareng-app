package com.gareng.app.gareng.http.entity.Login;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Username","Password"})
public class LoginRequest {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Password")
    private String password;
}
