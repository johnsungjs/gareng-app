package com.gareng.app.gareng.http.entity.historyTransaction;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.gareng.app.gareng.model.projection.TransactionHeaderProjection;

import lombok.Data;

@Data
@JsonPropertyOrder({"transactionHeaders"})
public class HistoryTransactionResponse {
    @JsonProperty("transactionHeaders")
    List<TransactionHeaderProjection> transactionHeaders;
}
