package com.gareng.app.gareng.helper;

import com.gareng.app.gareng.Utility.FieldValidation;
import com.gareng.app.gareng.Utility.JwtUtils;
import com.gareng.app.gareng.http.entity.AddWishlist.AddWishlistRequest;
import com.gareng.app.gareng.http.entity.AddWishlist.AddWishlistResponse;
import com.gareng.app.gareng.http.entity.DeleteWishlist.DeleteWishlistRequest;
import com.gareng.app.gareng.http.entity.DeleteWishlist.DeleteWishlistResponse;
import com.gareng.app.gareng.model.entity.Wishlist;
import com.gareng.app.gareng.model.repository.ItemRepository;
import com.gareng.app.gareng.model.repository.WishlistRepository;

public class WishlistHelper {
    public static AddWishlistResponse addWishlist(WishlistRepository wishlistRepository
    , ItemRepository itemRepository,String accessToken, AddWishlistRequest addWishlistRequest) throws Exception{
        //validate token
        if(!JwtUtils.validateIsUserToken(accessToken)){
            throw new Exception("Invalid Token");
        }

        //validate input
        try {
            FieldValidation.fieldValidation(addWishlistRequest);
        } catch (Exception e) {
            throw new Exception("Validation error. "+e.getMessage());
        }
        
        //validate item existence
        Boolean isItemExist = itemRepository.checkItemExist(addWishlistRequest.getItemUUID());
        System.out.println(isItemExist.toString());
        if(!isItemExist){
            throw new Exception("Item not exist");
        }

        //validate wishlist
        String userUuid = JwtUtils.getUuid(accessToken);
        boolean isMyWishlistExist = wishlistRepository.isMyWishlistExist(addWishlistRequest.getItemUUID(),userUuid);
        if(isMyWishlistExist){
            throw new Exception("Item already exist in your wishlist");
        }

        //all validation complete add to wishlist
        Wishlist wishlist = new Wishlist();
        wishlist.setItemUUID(addWishlistRequest.getItemUUID());
        wishlist.setUserUUID(userUuid);
        wishlistRepository.save(wishlist);

        //get item name
        String itemName = itemRepository.getItemName(wishlist.getItemUUID());

        //return add wishlist response
        AddWishlistResponse addWishlistResponse = new AddWishlistResponse();
        addWishlistResponse.setMessage("Success add "+ itemName +" to your wishlist");
        return addWishlistResponse;
    }

    public static DeleteWishlistResponse deleteWishlist(WishlistRepository wishlistRepository
    , ItemRepository itemRepository, String accessToken, DeleteWishlistRequest deleteWishlistRequest) throws Exception{
        //validate token
        if(!JwtUtils.validateIsUserToken(accessToken)){
            throw new Exception("Invalid Token");
        }

        //validate input
        try {
            FieldValidation.fieldValidation(deleteWishlistRequest);
        } catch (Exception e) {
            throw new Exception("Validation error. "+e.getMessage());
        }

        //validate item existence
        Boolean isItemExist = itemRepository.checkItemExist(deleteWishlistRequest.getItemUUID());
        if(!isItemExist){
            throw new Exception("Item not exist");
        }

        //validate wishlist
        String userUuid = JwtUtils.getUuid(accessToken);
        boolean isMyWishlistExist = wishlistRepository.isMyWishlistExist(deleteWishlistRequest.getItemUUID(),userUuid);
        if(!isMyWishlistExist){
            throw new Exception("Item is not exist in your wishlist");
        }

        //all validation complete delete from wishlist
        Wishlist wishlist = wishlistRepository.getOneWishlist(deleteWishlistRequest.getItemUUID(),userUuid);
        wishlistRepository.delete(wishlist);

        //get item name
        String itemName = itemRepository.getItemName(wishlist.getItemUUID());

        //return add wishlist response
        DeleteWishlistResponse deleteWishlistResponse = new DeleteWishlistResponse();
        deleteWishlistResponse.setMessage("Success delete "+itemName+" from your wishlist");

        return deleteWishlistResponse;
    }
}
