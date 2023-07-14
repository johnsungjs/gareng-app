package com.gareng.app.gareng.http.entity.EditProfile;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Message"})
public class EditProfileResponse {
    @JsonProperty("Message")
    private String message;
}
