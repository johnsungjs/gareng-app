package com.gareng.app.gareng.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.UserHelper;
import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Login.LoginResponse;
import com.gareng.app.gareng.http.entity.Logout.LogoutRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterResponse;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;

@RestController
@RequestMapping("/authentication")
public class AuthenticationController {
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody LoginRequest loginRequest){
        String responseMessage;
        HttpStatus httpStatus;
        LoginResponse loginResponse = new LoginResponse(null,null);
        try {
            loginResponse = UserHelper.login(loginRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, loginResponse);
    }

    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody RegisterRequest registerRequest){
        String responseMessage;
        HttpStatus httpStatus;
        RegisterResponse registerResponse = new RegisterResponse(null);
        try {
            registerResponse = UserHelper.addUser(registerRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, registerResponse);
    }

    @PostMapping("/logout")
    public ResponseEntity<Object> logout(@RequestBody LogoutRequest registerRequest){
        return ResponseHandler.generateResponse("Logout", HttpStatus.OK, null);
    }
}
