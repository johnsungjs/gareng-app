package com.gareng.app.gareng.helper;

import java.util.List;
import java.util.UUID;

import com.gareng.app.gareng.http.entity.addTransaction.AddTransactionRequest;
import com.gareng.app.gareng.http.entity.addTransaction.AddTransactionResponse;
import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionRequest;
import com.gareng.app.gareng.http.entity.getTransaction.GetTransactionResponse;
import com.gareng.app.gareng.http.entity.historyTransaction.HistoryTransactionResponse;
import com.gareng.app.gareng.model.entity.TransactionHeader;
import com.gareng.app.gareng.model.projection.TransactionDetailProjection;
import com.gareng.app.gareng.model.repository.TransactionRepository;
import com.gareng.app.gareng.Utility.JwtUtils;

public class TransactionHelper {
    public static GetTransactionResponse getTransaction(String accessToken
    , TransactionRepository transactionRepository, GetTransactionRequest request) throws Exception{
        if(!JwtUtils.validateToken(accessToken)){
            throw new Exception("Invalid Token");
        }
        GetTransactionResponse response = new GetTransactionResponse();
        TransactionHeader transactionHeader =
            transactionRepository.getTransactionHeader(request.getTransactionUUID());
        List<TransactionDetailProjection> transactionDetail =
            transactionRepository.getTransactionDetail(transactionHeader.getId());
        transactionHeader.setId(null);
        response.setTransactionHeader(transactionHeader);
        response.setTransactionDetail(transactionDetail);
        return response;
    }

    public static AddTransactionResponse addTransaction(String accessToken
    , TransactionRepository transactionRepository, AddTransactionRequest request) throws Exception{
        if(!JwtUtils.validateToken(accessToken)){
            throw new Exception("Invalid Token");
        }
        AddTransactionResponse response = new AddTransactionResponse();
        UUID uuid = UUID.randomUUID();
        String userUUID = JwtUtils.getUuid(accessToken);
        transactionRepository.saveHeader(
            request.getTransactionDate(),
            request.getPayment(),
            request.getPaymentMethod(),
            uuid.toString(),
            userUUID
        );
        TransactionHeader insertedHeader = transactionRepository.getTransactionHeader(uuid.toString());
        for(int i=0;i<request.getItems().size();i++){
            transactionRepository.saveDetail(
                insertedHeader.getId(),
                request.getItems().get(i).getId(),
                request.getItems().get(i).getAmount()
            );
        }
        response.setTransactionUUID(uuid.toString());
        return response;
    }

    public static HistoryTransactionResponse historyTransaction(String accessToken
    , TransactionRepository transactionRepository) throws Exception{
        if(!JwtUtils.validateToken(accessToken)){
            throw new Exception("Invalid Token");
        }
        HistoryTransactionResponse response = new HistoryTransactionResponse();
        String userUUID = JwtUtils.getUuid(accessToken);
        List<TransactionHeader> transactionHeaders = transactionRepository.getTransactionHeaderByUserUUID(userUUID);
        response.setTransactionHeaders(transactionHeaders);
        return response;
    }
}
