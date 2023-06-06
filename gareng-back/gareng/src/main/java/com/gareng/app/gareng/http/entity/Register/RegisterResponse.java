package com.gareng.app.gareng.http.entity.Register;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Message"})
public class RegisterResponse {
    @JsonProperty("Message")
    private String message;
}
