package com.gareng.app.gareng.helper;

import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionResponse;
import com.gareng.app.gareng.model.repository.TransactionRepository;

public class TransactionHelper {
    public static GetTransactionResponse getTransaction(String accessToken, TransactionRepository transactionRepository){
        return new GetTransactionResponse();
    }
}
