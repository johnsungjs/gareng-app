package com.gareng.app.gareng.http.entity.DeleteWishlist;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import Annotations.NotBlank;
import lombok.Data;

@Data
@JsonPropertyOrder({"ItemUUID"})
public class DeleteWishlistRequest {
    @NotBlank
    @JsonProperty("ItemUUID")
    private String itemUUID;
}
