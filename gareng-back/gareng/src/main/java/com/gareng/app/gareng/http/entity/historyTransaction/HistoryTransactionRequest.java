package com.gareng.app.gareng.http.entity.historyTransaction;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@Data
@JsonPropertyOrder({"userUUID"})
public class HistoryTransactionRequest {
    @JsonProperty("userUUID")
    private String userUUID;
}
