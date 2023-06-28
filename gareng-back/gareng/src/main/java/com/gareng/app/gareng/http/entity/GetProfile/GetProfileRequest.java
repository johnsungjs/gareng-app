package com.gareng.app.gareng.http.entity.GetProfile;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"username"})
public class GetProfileRequest {
    @JsonProperty("username")
    private String username;
}
