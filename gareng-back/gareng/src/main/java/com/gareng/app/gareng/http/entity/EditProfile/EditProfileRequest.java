package com.gareng.app.gareng.http.entity.EditProfile;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import Annotations.Email;
import Annotations.Length;
import Annotations.NotBlank;
import lombok.Data;

@Data
@JsonPropertyOrder({"Gender","Age","Address","Email"})
public class EditProfileRequest {
    @NotBlank
    @JsonProperty("Gender")
    private String gender;
    @NotBlank
    @JsonProperty("Age")
    private String age;
    @Length(min = 3, max = 100)
    @JsonProperty("Address")
    private String address;
    @Email
    @JsonProperty("Email")
    private String email;
}
