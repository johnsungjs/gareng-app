package com.gareng.app.gareng.http.entity.addTransaction;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.gareng.app.gareng.model.entity.Item;

import lombok.Data;

@Data
@JsonPropertyOrder({"transactionDate","payment","paymentMethod","items"})
public class AddTransactionRequest {
    @JsonProperty("transactionDate")
    private String transactionDate;//2023-08-31
    @JsonProperty("payment")
    private Integer payment;
    @JsonProperty("paymentMethod")
    private String paymentMethod;
    @JsonProperty("items")
    private List<Item> items;
}
