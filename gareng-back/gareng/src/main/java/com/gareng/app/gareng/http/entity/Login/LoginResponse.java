package com.gareng.app.gareng.http.entity.Login;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@JsonPropertyOrder({"AccessToken","RefreshToken"})
public class LoginResponse {
    @JsonProperty("AccessToken")
    private String accesstoken;
    @JsonProperty("RefreshToken")
    private String refreshToken;
}
