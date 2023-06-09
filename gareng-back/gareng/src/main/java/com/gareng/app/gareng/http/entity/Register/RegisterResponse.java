package com.gareng.app.gareng.http.entity.Register;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.gareng.app.gareng.model.entity.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonPropertyOrder({"User"})
public class RegisterResponse {
    @JsonProperty("User")
    private User user;
}
