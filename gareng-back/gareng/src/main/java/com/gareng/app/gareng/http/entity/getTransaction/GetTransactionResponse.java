package com.gareng.app.gareng.http.entity.getTransaction;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.gareng.app.gareng.model.entity.TransactionHeader;
import com.gareng.app.gareng.model.projection.TransactionDetailProjection;

import lombok.Data;

@Data
@JsonPropertyOrder({"transactionHeader","transactionDetail"})
public class GetTransactionResponse {
    @JsonProperty("transactionHeader")
    private TransactionHeader transactionHeader;
    @JsonProperty("transactionDetail")
    private List<TransactionDetailProjection> transactionDetail;
}
