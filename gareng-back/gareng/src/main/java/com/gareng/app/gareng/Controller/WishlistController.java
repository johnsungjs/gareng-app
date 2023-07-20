package com.gareng.app.gareng.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gareng.app.gareng.helper.ItemHelper;
import com.gareng.app.gareng.helper.WishlistHelper;
import com.gareng.app.gareng.http.entity.AddWishlist.AddWishlistRequest;
import com.gareng.app.gareng.http.entity.AddWishlist.AddWishlistResponse;
import com.gareng.app.gareng.http.entity.DeleteWishlist.DeleteWishlistRequest;
import com.gareng.app.gareng.http.entity.DeleteWishlist.DeleteWishlistResponse;
import com.gareng.app.gareng.http.entity.GetItem.GetItemRequest;
import com.gareng.app.gareng.http.entity.GetItem.GetItemResponse;
import com.gareng.app.gareng.http.entity.ResponseHandler.ResponseHandler;
import com.gareng.app.gareng.model.repository.ItemRepository;
import com.gareng.app.gareng.model.repository.WishlistRepository;

@RestController
@RequestMapping("/wishlist")
public class WishlistController {
    @Autowired
    WishlistRepository wishlistRepository;

    @Autowired
    ItemRepository itemRepository;

    @PostMapping("/add")
    public ResponseEntity<Object> addWishlist(@RequestHeader("Authorization") String accessToken
        , @RequestBody AddWishlistRequest addWishlistRequest){
        String responseMessage;
        HttpStatus httpStatus;
        AddWishlistResponse addWishlistResponse = new AddWishlistResponse();
        try {
            addWishlistResponse = WishlistHelper.addWishlist(wishlistRepository, itemRepository
            , accessToken, addWishlistRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, addWishlistResponse);
    }

    @PostMapping("/get")
    public ResponseEntity<Object> getWishlist(@RequestHeader("Authorization") String accessToken
        , @RequestBody GetItemRequest getWishlistRequest){
        String responseMessage;
        HttpStatus httpStatus;
        GetItemResponse getWishlistResponse = new GetItemResponse();
        try {
            getWishlistResponse = ItemHelper.getItem(itemRepository, getWishlistRequest, accessToken,true);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, getWishlistResponse);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<Object> deleteWishlist(@RequestHeader("Authorization") String accessToken
        , @RequestBody DeleteWishlistRequest deleteWishlistRequest){
        String responseMessage;
        HttpStatus httpStatus;
        DeleteWishlistResponse deleteWishlistResponse = new DeleteWishlistResponse();
        try {
            deleteWishlistResponse = WishlistHelper.deleteWishlist(wishlistRepository, itemRepository
            , accessToken, deleteWishlistRequest);
            responseMessage = "Success";
            httpStatus = HttpStatus.OK;
        } catch (Exception e) {
            responseMessage = e.getMessage();
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return ResponseHandler.generateResponse(responseMessage, httpStatus, deleteWishlistResponse);
    }
}
