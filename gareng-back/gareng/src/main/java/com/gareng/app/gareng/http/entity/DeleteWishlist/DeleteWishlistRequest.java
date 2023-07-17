package com.gareng.app.gareng.http.entity.DeleteWishlist;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"ItemUUID"})
public class DeleteWishlistRequest {
    @JsonProperty("ItemUUID")
    private String itemUUID;
}
