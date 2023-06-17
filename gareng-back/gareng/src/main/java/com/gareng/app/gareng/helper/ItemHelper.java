package com.gareng.app.gareng.helper;

import java.util.List;

import com.gareng.app.gareng.Utility.PaginationUtils;
import com.gareng.app.gareng.http.entity.GetItem.GetItemRequest;
import com.gareng.app.gareng.http.entity.GetItem.GetItemResponse;
import com.gareng.app.gareng.model.projection.ItemProjection;
import com.gareng.app.gareng.model.repository.ItemRepository;

public class ItemHelper {
    public static GetItemResponse getItem(ItemRepository itemRepository, 
        GetItemRequest getItemRequest) throws Exception{
        GetItemResponse response = new GetItemResponse();

        PaginationUtils paginateUtils = new PaginationUtils(getItemRequest.getGetItemPagination());
        
        List<ItemProjection> itemProjection;
        if(paginateUtils.getLimit().equals(0) && paginateUtils.getPageAt().equals(0)){
            itemProjection = itemRepository.getItemView();
        }else{
            itemProjection = itemRepository.getItemView(paginateUtils.getLimit(),paginateUtils.getOffset());
        }
        
        paginateUtils.setTotal(itemRepository.count());
        getItemRequest.getGetItemPagination().updateValue(paginateUtils);
        
        response.setGetItemPagination(getItemRequest.getGetItemPagination());
        response.setItemData(itemProjection);
        return response;
    }
}
