package com.gareng.app.gareng.helper;

import java.util.UUID;

import com.gareng.app.gareng.utility.BcryptUtils;
import com.gareng.app.gareng.utility.FieldValidation;
import com.gareng.app.gareng.utility.JwtUtils;
import com.gareng.app.gareng.http.entity.EditProfile.EditProfileRequest;
import com.gareng.app.gareng.http.entity.EditProfile.EditProfileResponse;
import com.gareng.app.gareng.http.entity.GetProfile.GetProfileResponse;
import com.gareng.app.gareng.http.entity.Login.LoginRequest;
import com.gareng.app.gareng.http.entity.Login.LoginResponse;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenRequest;
import com.gareng.app.gareng.http.entity.RefreshToken.RefreshTokenResponse;
import com.gareng.app.gareng.http.entity.Register.RegisterRequest;
import com.gareng.app.gareng.http.entity.Register.RegisterResponse;
import com.gareng.app.gareng.model.entity.RefreshTokenHistory;
import com.gareng.app.gareng.model.entity.User;
import com.gareng.app.gareng.model.projection.ProfileProjection;
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

    public static GetProfileResponse getProfile(String accessToken, UserRepository userRepository) throws Exception{
        GetProfileResponse response = new GetProfileResponse();
        if(!JwtUtils.validateIsUserToken(accessToken)){
            throw new Exception("Invalid Token");
        }
        ProfileProjection profile = userRepository.getProfileView(JwtUtils.getUsername(accessToken));
        if(!profile.equals(null)){
            response.setUsername(profile.getUsername());
            response.setAddress(profile.getAddress());
            response.setGender(profile.getGender());
            response.setAge(profile.getAge());
            response.setEmail(profile.getEmail());
        }
        return response;
    }

    public static EditProfileResponse editProfile(String accessToken, UserRepository userRepository
    , EditProfileRequest editProfileRequest) throws Exception{
        EditProfileResponse response = new EditProfileResponse();
        if(!JwtUtils.validateIsUserToken(accessToken)){
            throw new Exception("Invalid Token");
        }
        try {
            FieldValidation.fieldValidation(editProfileRequest);
        } catch (Exception e) {
            throw new Exception("Validation error. "+e.getMessage());
        }

        User user = userRepository.findByUuid(JwtUtils.getUuid(accessToken));

        user.setGender(editProfileRequest.getGender());
        user.setAge(Integer.parseInt(editProfileRequest.getAge()));
        user.setAddress(editProfileRequest.getAddress());
        user.setEmail(editProfileRequest.getEmail());

        userRepository.save(user);
        
        response.setMessage("Success update profile");
        return response;
    }
}
