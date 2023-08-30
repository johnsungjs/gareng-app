package com.gareng.app.gareng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.TransactionHelper;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionResponse;
import com.gareng.app.gareng.model.repository.TransactionRepository;

@RestController
@RequestMapping("/transaction")
public class TransactionController {
    @Autowired
    TransactionRepository transactionRepository;
    
    @CrossOrigin
    @GetMapping("/get")
    public ResponseEntity<Object> getTransaction(@RequestHeader("Authorization") String accessToken
    , String startDate, String endDate){
        String responseMessage;
        HttpStatus httpStatus;
        GetTransactionResponse getProfileResponse = new GetTransactionResponse();
        try {
            getProfileResponse = TransactionHelper.getTransaction(accessToken, transactionRepository);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, getProfileResponse);
    }
}
