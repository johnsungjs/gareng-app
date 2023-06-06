package com.gareng.app.gareng.helper;

import java.util.Date;

import com.gareng.app.gareng.constant.JwtConstant;
import com.gareng.app.gareng.model.entity.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;

public class JwtUtils {
    public static String generateToken(User user){
        long expirationMillis = 120000; //2 menit
        Date now = new Date();
        Date exp = new Date(now.getTime() + expirationMillis);
        System.out.println("NOW : "+now);
        System.out.println("EXP : "+exp);

        String jwt = Jwts.builder()
                    .setSubject("user")
                    .claim("username", user.getUsername())
                    .setIssuedAt(now)
                    .setExpiration(exp)
                    .signWith(JwtConstant.key)
                    .compact();       
        return jwt;
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
