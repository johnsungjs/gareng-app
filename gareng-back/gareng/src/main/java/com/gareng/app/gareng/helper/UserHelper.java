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
    static RefreshTokenHistoryRepository refreshTokenHistoryRepository;

    public static LoginResponse login(LoginRequest loginRequest, UserRepository userRepository) throws Exception{
        System.out.println("login start");
        String accessToken="";
        String refreshToken="";
        User isUserExist = userRepository.findByUsername(loginRequest.getUsername());
        System.out.println("login (isUserExist): "+isUserExist);
        if(!isUserExist.equals(null)){
            accessToken = JwtUtils.generateAccessToken(isUserExist,"user");
            System.out.println("login (accessToken): "+accessToken);
            refreshToken = JwtUtils.generateRefreshToken(isUserExist);
            System.out.println("login (refreshToken): "+refreshToken);
            refreshTokenHistoryRepository.save(new RefreshTokenHistory(refreshToken));
            System.out.println("login add refreshToken success to database");
        }
        LoginResponse loginResponse = new LoginResponse(accessToken, refreshToken);
        System.out.println("login (loginResponse): "+loginResponse.toString());
        System.out.println("login end");
        return loginResponse;
    }

    public static RegisterResponse addUser(RegisterRequest registerUser, UserRepository userRepository) throws Exception{
        System.out.println("Add User start");
        UUID uuid = UUID.randomUUID();
        System.out.println("Add User (uuid): "+uuid);
        String hashedPassword = BcryptUtils.hashPassword(registerUser.getPassword());
        System.out.println("Add User (hashedPassword): "+hashedPassword);
        User user = new User(
            uuid.toString(),
            registerUser.getUsername(),
            hashedPassword,
            registerUser.getAddress(),
            registerUser.getGender(),
            Integer.parseInt(registerUser.getAge()),
            registerUser.getEmail()
        );
        System.out.println("Add User (user): "+user);
        userRepository.save(user);
        System.out.println("Add User success add to database");
        RegisterResponse registerResponse = new RegisterResponse(user);
        System.out.println("Add User end");
        return registerResponse;
    }

    public static String logout(String refreshToken) throws Exception{
        String message;
        RefreshTokenHistory isTokenExist = refreshTokenHistoryRepository.searchByToken(refreshToken);
        if(!isTokenExist.equals(null)){
            if(JwtUtils.validateToken(isTokenExist.getToken())){
                refreshTokenHistoryRepository.delete(isTokenExist);
                message = "logout success";
            }else{
                message = "logout failed, token invalid";
            }
        }else{
            message = "logout failed, user never login";
        }
        return message;
    }
}
