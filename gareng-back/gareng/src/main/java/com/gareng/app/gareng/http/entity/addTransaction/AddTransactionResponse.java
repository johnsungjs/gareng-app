package com.gareng.app.gareng.http.entity.addTransaction;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"transactionUUID"})
public class AddTransactionResponse {
    @JsonProperty("transactionUUID")
    private String transactionUUID;
}
