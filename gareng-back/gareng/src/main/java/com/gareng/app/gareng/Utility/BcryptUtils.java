package com.gareng.app.gareng.Utility;

import org.mindrot.jbcrypt.BCrypt;

public class BcryptUtils {
    public static String hashPassword(String password){
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return hashedPassword;
    }

    public static Boolean checkPassword(String password, String hashedPassword){
        return BCrypt.checkpw(password, hashedPassword);
    }
}
