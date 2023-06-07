package com.gareng.app.gareng.helper;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.gareng.app.gareng.Utility.BcryptUtils;
import com.gareng.app.gareng.Utility.JwtUtils;
import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Login.LoginResponse;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterResponse;
import com.gareng.app.gareng.model.entity.RefreshTokenHistory;
import com.gareng.app.gareng.model.entity.User;
import com.gareng.app.gareng.model.repository.RefreshTokenHistoryRepository;
import com.gareng.app.gareng.model.repository.UserRepository;

public class UserHelper {
    @Autowired
    static UserRepository userRepository;
    @Autowired
    static RefreshTokenHistoryRepository refreshTokenHistoryRepository;

    public static LoginResponse login(LoginRequest loginRequest) throws Exception{
        String accessToken="";
        String refreshToken="";
        User isUserExist = userRepository.findByUsername(loginRequest.getUsername());
        if(!isUserExist.equals(null)){
            accessToken = JwtUtils.generateAccessToken(isUserExist,"user");
            refreshToken = JwtUtils.generateRefreshToken(isUserExist);
            refreshTokenHistoryRepository.save(new RefreshTokenHistory(refreshToken));
        }
        LoginResponse loginResponse = new LoginResponse(accessToken, refreshToken);
        return loginResponse;
    }

    public static RegisterResponse addUser(RegisterRequest registerUser) throws Exception{
        UUID uuid = UUID.randomUUID();
        String hashedPassword = BcryptUtils.hashPassword(registerUser.getPassword());
        User user = new User(
            uuid.toString(),
            registerUser.getUsername(),
            hashedPassword,
            registerUser.getAddress(),
            registerUser.getGender(),
            Integer.parseInt(registerUser.getAge()),
            registerUser.getEmail()
        );
        userRepository.save(user);
        RegisterResponse registerResponse = new RegisterResponse(user);
        return registerResponse;
    }
}
