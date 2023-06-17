package com.gareng.app.gareng.http.entity.GetItem;

import java.util.List;

import com.gareng.app.gareng.model.projection.ItemProjection;


import lombok.Data;

@Data
public class GetItemResponse {
    private GetItemPagination getItemPagination;
    private List<ItemProjection> itemData;
}
