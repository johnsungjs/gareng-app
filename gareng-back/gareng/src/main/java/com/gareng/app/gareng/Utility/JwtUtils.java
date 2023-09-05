package com.gareng.app.gareng.utility;

import java.util.Date;

import com.gareng.app.gareng.constant.JwtConstant;
import com.gareng.app.gareng.model.entity.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;

public class JwtUtils {
    public static String generateAccessToken(User user, String subject, String refreshToken)throws Exception{
        if(!validateToken(refreshToken)){
            throw new Exception("Refresh Token invalid, please re-login.");
        }
        long expirationMillis = 600000; //10 menit

        Date now = new Date();

        Date exp = new Date(now.getTime() + expirationMillis);

        String accessJwt = Jwts.builder()
                    .setSubject(subject)
                    .claim("username", user.getUsername())
                    .claim("uuid",user.getUuid())
                    .setIssuedAt(now)
                    .setExpiration(exp)
                    .signWith(JwtConstant.key)
                    .compact();
 
        return accessJwt;
    }

    public static String generateRefreshToken(User user){
        Date now = new Date();

        String refreshJwt = Jwts.builder()
                    .setSubject("refresh token")
                    .claim("username", user.getUsername())
                    .claim("uuid",user.getUuid())
                    .setIssuedAt(now)
                    .signWith(JwtConstant.key)
                    .compact();       
        return refreshJwt;
    }

    public static boolean validateToken(String token){
        try {
            Jws<Claims> result = Jwts.parserBuilder()
            .setSigningKey(JwtConstant.key)
            .build()
            .parseClaimsJws(token);
            System.out.println("RESULT : "+result);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static boolean validateIsUserToken(String token){
        try {
            Jws<Claims> result = Jwts.parserBuilder()
            .requireSubject("user")
            .setSigningKey(JwtConstant.key)
            .build()
            .parseClaimsJws(token);
            System.out.println("RESULT : "+result);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static String getUsername(String token) throws Exception{
        try {
            Jws<Claims> result = Jwts.parserBuilder()
            .setSigningKey(JwtConstant.key)
            .build()
            .parseClaimsJws(token);
        return result.getBody().get("username", String.class);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static String getUuid(String token) throws Exception{
        try {
            Jws<Claims> result = Jwts.parserBuilder()
            .setSigningKey(JwtConstant.key)
            .build()
            .parseClaimsJws(token);
        return result.getBody().get("uuid", String.class);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
