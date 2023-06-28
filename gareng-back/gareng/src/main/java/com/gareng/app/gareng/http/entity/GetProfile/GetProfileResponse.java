package com.gareng.app.gareng.http.entity.GetProfile;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"username","gender","address","email","age"})
public class GetProfileResponse {
    @JsonProperty("username")
    private String username;
    @JsonProperty("gender")
    private String gender;
    @JsonProperty("address")
    private String address;
    @JsonProperty("email")
    private String email;
    @JsonProperty("age")
    private String age;
}
