package com.gareng.app.gareng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.ItemHelper;
import com.gareng.app.gareng.http.entity.GetItem.GetItemRequest;
import com.gareng.app.gareng.http.entity.GetItem.GetItemResponse;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.model.repository.ItemRepository;

@RestController
@RequestMapping("/item")
public class ItemController {
    @Autowired
    ItemRepository itemRepository;

    @GetMapping("/testconnection")
    public ResponseEntity<Object> index(){
        return ResponseHandler.generateResponse("Server up and running!", HttpStatus.OK, null);
    }

    @CrossOrigin
    @PostMapping("/get")
    public ResponseEntity<Object> getItem(@RequestHeader("Authorization") String accessToken
        , @RequestBody GetItemRequest itemRequest){
        String responseMessage;
        HttpStatus httpStatus;
        GetItemResponse getItemResponse = new GetItemResponse();
        try {
            getItemResponse = ItemHelper.getItem(itemRepository, itemRequest, accessToken,false);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }

        return ResponseHandler.generateResponse(responseMessage, httpStatus, getItemResponse);
    }
}
