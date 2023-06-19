package com.gareng.app.gareng.http.entity.Logout;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"RefreshToken"})
public class LogoutRequest {
    @JsonProperty("RefreshToken")
    private String refreshToken;
}
