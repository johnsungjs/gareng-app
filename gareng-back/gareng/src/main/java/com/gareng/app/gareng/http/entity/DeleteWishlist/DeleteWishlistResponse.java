package com.gareng.app.gareng.http.entity.DeleteWishlist;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"Message"})
public class DeleteWishlistResponse {
    @JsonProperty("Message")
    private String message;
}
