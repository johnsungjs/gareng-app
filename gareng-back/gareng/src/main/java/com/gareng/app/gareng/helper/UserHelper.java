package com.gareng.app.gareng.helper;

import java.util.UUID;

import com.gareng.app.gareng.Utility.BcryptUtils;
import com.gareng.app.gareng.Utility.JwtUtils;
import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Login.LoginResponse;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenRequest;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenResponse;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterResponse;
import com.gareng.app.gareng.model.entity.RefreshTokenHistory;
import com.gareng.app.gareng.model.entity.User;
import com.gareng.app.gareng.model.repository.RefreshTokenHistoryRepository;
import com.gareng.app.gareng.model.repository.UserRepository;

public class UserHelper {
    public static LoginResponse login(LoginRequest loginRequest, UserRepository userRepository
        , RefreshTokenHistoryRepository refreshTokenHistoryRepository) throws Exception{
        String accessToken="";
        String refreshToken="";
        User isUserExist = userRepository.findByUsername(loginRequest.getUsername());
        if(!isUserExist.equals(null)){
            refreshToken = JwtUtils.generateRefreshToken(isUserExist);
            accessToken = JwtUtils.generateAccessToken(isUserExist,"user",refreshToken);
            refreshTokenHistoryRepository.save(new RefreshTokenHistory(refreshToken));
        }
        LoginResponse loginResponse = new LoginResponse(accessToken, refreshToken);
        return loginResponse;
    }

    public static RegisterResponse addUser(RegisterRequest registerUser, UserRepository userRepository) throws Exception{
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

    public static String logout(String refreshToken
        , RefreshTokenHistoryRepository refreshTokenHistoryRepository) throws Exception{
        
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

    public static RefreshTokenResponse refreshToken(String refreshToken,UserRepository userRepository
        , RefreshTokenRequest refreshTokenRequest) throws Exception{
        RefreshTokenResponse response = new RefreshTokenResponse();
        String accessToken;
        User isUserExist = userRepository.findByUsername(refreshTokenRequest.getUsername());
        if(!isUserExist.equals(null)){
            accessToken = JwtUtils.generateAccessToken(isUserExist, "system", refreshToken);
        }else{
            throw new Exception("No user in database");
        }
        response.setAccessToken(accessToken);
        return response;
    }
}
