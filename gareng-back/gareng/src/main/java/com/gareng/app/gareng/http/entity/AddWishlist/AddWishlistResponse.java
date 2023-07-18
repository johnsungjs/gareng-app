package com.gareng.app.gareng.http.entity.AddWishlist;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Message"})
public class AddWishlistResponse {
    @JsonProperty("Message")
    private String message;
}
