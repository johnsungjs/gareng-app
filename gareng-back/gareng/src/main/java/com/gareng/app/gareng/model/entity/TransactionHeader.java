package com.gareng.app.gareng.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "TransactionHeader")
public class TransactionHeader {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String transactionDate;
    private Integer payment;
    private String paymentmethod;
    private String UUID;
    private String userUUID;

    public TransactionHeader(String transactionDate, Integer payment, String paymentmethod, String uUID) {
        this.transactionDate = transactionDate;
        this.payment = payment;
        this.paymentmethod = paymentmethod;
        UUID = uUID;
    }
}
