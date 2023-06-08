package com.gareng.app.gareng.http.entity.Logout;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"ResponseMessage"})
public class LogoutResponse {
    @JsonProperty("ResponseMessage")
    private String responseMessage;
}
