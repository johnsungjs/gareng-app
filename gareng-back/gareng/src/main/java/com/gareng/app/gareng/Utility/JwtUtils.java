package com.gareng.app.gareng.Utility;

import java.util.Date;

import com.gareng.app.gareng.constant.JwtConstant;
import com.gareng.app.gareng.model.entity.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;

public class JwtUtils {
    public static String generateAccessToken(User user, String subject){
        System.out.println("generateAccessToken start");
        System.out.println("generateAccessToken (user): "+user.toString());
        System.out.println("generateAccessToken (subject): "+subject);
        long expirationMillis = 120000; //2 menit
        System.out.println("generateAccessToken (expirationMillis): "+expirationMillis);
        Date now = new Date();
        System.out.println("generateAccessToken (now): "+now);
        Date exp = new Date(now.getTime() + expirationMillis);
        System.out.println("generateAccessToken (exp): "+exp);

        String accessJwt = Jwts.builder()
                    .setSubject(subject)
                    .claim("username", user.getUsername())
                    .setIssuedAt(now)
                    .setExpiration(exp)
                    .signWith(JwtConstant.key)
                    .compact();
        System.out.println("generateAccessToken (accessJwt): "+accessJwt);
        System.out.println("generateAccessToken end");    
        return accessJwt;
    }

    public static String generateRefreshToken(User user){
        Date now = new Date();

        String refreshJwt = Jwts.builder()
                    .setSubject("refresh token")
                    .claim("username", user.getUsername())
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
}
