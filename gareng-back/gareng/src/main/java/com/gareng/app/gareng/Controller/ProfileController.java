package com.gareng.app.gareng.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.UserHelper;
import com.gareng.app.gareng.http.entity.EditProfile.EditProfileRequest;
import com.gareng.app.gareng.http.entity.EditProfile.EditProfileResponse;
import com.gareng.app.gareng.http.entity.GetProfile.GetProfileResponse;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.model.repository.UserRepository;

@RestController
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    UserRepository userRepository;

    @CrossOrigin
    @GetMapping("/get")
    public ResponseEntity<Object> getProfile(@RequestHeader("Authorization") String accessToken){
        String responseMessage;
        HttpStatus httpStatus;
        GetProfileResponse getProfileResponse = new GetProfileResponse();
        try {
            getProfileResponse = UserHelper.getProfile(accessToken, userRepository);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, getProfileResponse);
    }

    @PutMapping("/update")
    public ResponseEntity<Object> editProfile(@RequestHeader("Authorization") String accessToken
        , @RequestBody EditProfileRequest editProfileRequest){
        String responseMessage;
        HttpStatus httpStatus;
        EditProfileResponse editProfileResponse = new EditProfileResponse();
        try {
            editProfileResponse = UserHelper.editProfile(accessToken, userRepository, editProfileRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, editProfileResponse);
    }
}
