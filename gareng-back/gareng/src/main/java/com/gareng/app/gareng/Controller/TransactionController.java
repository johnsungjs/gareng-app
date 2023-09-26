package com.gareng.app.gareng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.TransactionHelper;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.http.entity.addTransaction.AddTransactionRequest;
import com.gareng.app.gareng.http.entity.addTransaction.AddTransactionResponse;
import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionRequest;
import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionResponse;
import com.gareng.app.gareng.http.entity.historyTransaction.HistoryTransactionResponse;
import com.gareng.app.gareng.model.repository.TransactionRepository;

@RestController
@RequestMapping("/transaction")
public class TransactionController {
    @Autowired
    TransactionRepository transactionRepository;

    @CrossOrigin
    @PostMapping("/get")
    public ResponseEntity<Object> getTransaction(@RequestHeader("Authorization") String accessToken
    , @RequestBody GetTransactionRequest request){
        String responseMessage;
        HttpStatus httpStatus;
        GetTransactionResponse getTransactionResponse = new GetTransactionResponse();
        try {
            getTransactionResponse = TransactionHelper.getTransaction(accessToken, transactionRepository,request);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, getTransactionResponse);
    }

    @CrossOrigin
    @PostMapping("/add")
    public ResponseEntity<Object> addTransaction(@RequestHeader("Authorization") String accessToken
    , @RequestBody AddTransactionRequest request){
        String responseMessage;
        HttpStatus httpStatus;
        AddTransactionResponse addTransactionResponse = new AddTransactionResponse();
        try {
            addTransactionResponse = TransactionHelper.addTransaction(accessToken, transactionRepository,request);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, addTransactionResponse);
    }

    @CrossOrigin
    @GetMapping("/history")
    public ResponseEntity<Object> historyTransaction(@RequestHeader("Authorization") String accessToken){
        String responseMessage;
        HttpStatus httpStatus;
        HistoryTransactionResponse historyTransactionResponse = new HistoryTransactionResponse();
        try {
            historyTransactionResponse = TransactionHelper.historyTransaction(accessToken, transactionRepository);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, historyTransactionResponse);
    }

    @GetMapping("/restaurantimage")
    @ResponseBody
    public ResponseEntity<Resource> getImageWithMediaType(){
        // InputStream in = getClass().getResourceAsStream("/main/resources/restaurant.jpg");
        Resource imageResource = new ClassPathResource("restaurant.jpg");
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageResource);
    }
    //D:\ALVIN\self_learning\gareng-app\gareng-back\gareng\src\main\resources\restaurant.jpg
}
