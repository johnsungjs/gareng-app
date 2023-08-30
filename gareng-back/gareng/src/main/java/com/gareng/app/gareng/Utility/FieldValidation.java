package com.gareng.app.gareng.utility;

import Utils.Validation;

public class FieldValidation {
    public static <T> void fieldValidation(T objectT) throws Exception{
        Validation.checkIsBlank(objectT);
        Validation.checkLength(objectT);
        Validation.checkIsEmailValid(objectT);
        Validation.checkIsPhoneNumber(objectT);
    }
}
