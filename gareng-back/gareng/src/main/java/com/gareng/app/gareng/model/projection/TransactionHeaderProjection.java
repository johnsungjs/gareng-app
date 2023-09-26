package com.gareng.app.gareng.model.projection;

public interface TransactionHeaderProjection {
    String getId();
    String getTransactionDate();
    String getPayment();
    String getPaymentMethod();
    String getUuid();
    String getUserUUID();
    String getImageUrl();
}
