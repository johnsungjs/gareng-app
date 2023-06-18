package com.gareng.app.gareng.helper;

import java.util.List;

import com.gareng.app.gareng.Utility.JwtUtils;
import com.gareng.app.gareng.Utility.PaginationUtils;
import com.gareng.app.gareng.http.entity.GetItem.GetItemRequest;
import com.gareng.app.gareng.http.entity.GetItem.GetItemResponse;
import com.gareng.app.gareng.model.projection.ItemProjection;
import com.gareng.app.gareng.model.repository.ItemRepository;

public class ItemHelper{
    public static GetItemResponse getItem(ItemRepository itemRepository, 
        GetItemRequest getItemRequest, String accessToken) throws Exception{
        if(!JwtUtils.validateToken(accessToken)){
            throw new Exception("Invalid Token");
        }

        GetItemResponse response = new GetItemResponse();
        PaginationUtils paginateUtils = new PaginationUtils(getItemRequest.getGetItemPagination());
        
        List<ItemProjection> itemProjection;
        if(paginateUtils.getLimit().equals(0) && paginateUtils.getPageAt().equals(0)){
            if(!paginateUtils.getSearch().isEmpty()){
                itemProjection = itemRepository.getItemView(paginateUtils.getSearch());
            }else{
                itemProjection = itemRepository.getItemView();
            }   
        }else{
            if(!paginateUtils.getSearch().isEmpty()){
                itemProjection = itemRepository.getItemView(
                    paginateUtils.getLimit(),paginateUtils.getOffset(),paginateUtils.getSearch());
            }else{
                itemProjection = itemRepository.getItemView(paginateUtils.getLimit(),paginateUtils.getOffset());
            }
        }
        
        paginateUtils.setTotal(itemProjection.size());
        getItemRequest.getGetItemPagination().updateValue(paginateUtils);
        
        response.setGetItemPagination(getItemRequest.getGetItemPagination());
        response.setItemData(itemProjection);
        return response;
    }
}
