package com.gareng.app.gareng.constant;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Value;

import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

public class JwtConstant {
    @Value("${secretKey}")
    private static String secretKey;

    public static final SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secretKey));
}
