package com.gareng.app.gareng.http.entity.AddWishlist;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import Annotations.NotBlank;
import lombok.Data;

@Data
@JsonPropertyOrder({"itemUUID"})
public class AddWishlistRequest {
    @NotBlank
    @JsonProperty("itemUUID")
    private String itemUUID;
}
