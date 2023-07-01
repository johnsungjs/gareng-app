package com.gareng.app.gareng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.UserHelper;
import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Login.LoginResponse;
import com.gareng.app.gareng.http.entity.Logout.LogoutResponse;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenRequest;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenResponse;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterResponse;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.model.repository.RefreshTokenHistoryRepository;
import com.gareng.app.gareng.model.repository.UserRepository;

@RestController
@RequestMapping("/authentication")
public class AuthenticationController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    RefreshTokenHistoryRepository refreshTokenHistoryRepository;

    @CrossOrigin
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody LoginRequest loginRequest){
        System.out.println("login start");
        System.out.println("request body :"+loginRequest.toString());
        String responseMessage;
        HttpStatus httpStatus;
        LoginResponse loginResponse = new LoginResponse(null,null);
        try {
            loginResponse = UserHelper.login(loginRequest, userRepository, refreshTokenHistoryRepository);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
            System.out.println("login success");
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        System.out.println("login end");
        return ResponseHandler.generateResponse(responseMessage, httpStatus, loginResponse);
    }

    @CrossOrigin
    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody RegisterRequest registerRequest){
        System.out.println("register start");
        System.out.println("request body :"+registerRequest.toString());
        String responseMessage;
        HttpStatus httpStatus;
        RegisterResponse registerResponse = new RegisterResponse();
        try {
            registerResponse = UserHelper.addUser(registerRequest, userRepository);
            System.out.println(registerResponse.toString());
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
            System.out.println("Register success");
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        System.out.println("register end");
        return ResponseHandler.generateResponse(responseMessage, httpStatus, registerResponse);
    }
    
    @CrossOrigin
    @GetMapping("/logout")
    public ResponseEntity<Object> logout(@RequestHeader("Authorization") String refreshToken){
        String responseMessage;
        HttpStatus httpStatus;
        LogoutResponse logoutResponse = new LogoutResponse();
        try {
            logoutResponse.setResponseMessage(UserHelper.logout(refreshToken, refreshTokenHistoryRepository));
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, logoutResponse);
    }

    @CrossOrigin
    @PostMapping("/refreshtoken")
    public ResponseEntity<Object> refreshToken(@RequestHeader("Authorization") String refreshToken
        , @RequestBody RefreshTokenRequest refreshTokenRequest){
        String responseMessage;
        HttpStatus httpStatus;
        RefreshTokenResponse refreshTokenResponse = new RefreshTokenResponse();
        try {
            refreshTokenResponse = UserHelper.refreshToken(refreshToken, userRepository, refreshTokenRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, refreshTokenResponse);
    }
}