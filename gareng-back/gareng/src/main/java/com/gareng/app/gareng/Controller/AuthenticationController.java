package com.gareng.app.gareng.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Logout.LogoutRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;

@RestController
@RequestMapping("/authentication")
public class AuthenticationController {
    @PostMapping("/login")
    public ResponseEntity<Object> login(@RequestBody LoginRequest loginRequest){
        return ResponseHandler.generateResponse("Login", HttpStatus.OK, loginRequest);
    }

    @PostMapping("/register")
    public ResponseEntity<Object> register(@RequestBody RegisterRequest registerRequest){
        return ResponseHandler.generateResponse("Register", HttpStatus.OK, null);
    }

    @PostMapping("/logout")
    public ResponseEntity<Object> logout(@RequestBody LogoutRequest registerRequest){
        return ResponseHandler.generateResponse("Logout", HttpStatus.OK, null);
    }
}
