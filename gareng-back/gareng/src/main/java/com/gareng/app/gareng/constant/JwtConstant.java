package com.gareng.app.gareng.constant;

import javax.crypto.SecretKey;

import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

public class JwtConstant {
    public static final SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode("akrJFHLxL9aFSULtACl6BR78/hxz88aK9SwtiNmCeRw="));
}
