package com.gareng.app.gareng.http.entity.getTransaction;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"transactionUUID"})
public class GetTransactionRequest {
    @JsonProperty("transactionUUID")
    private String transactionUUID;
}
