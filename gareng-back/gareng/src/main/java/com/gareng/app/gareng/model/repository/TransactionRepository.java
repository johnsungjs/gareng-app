package com.gareng.app.gareng.model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.TransactionHeader;
import com.gareng.app.gareng.model.projection.TransactionDetailProjection;

import jakarta.transaction.Transactional;

@Repository
public interface TransactionRepository extends CrudRepository<TransactionHeader,Long>{
    @Query(
        nativeQuery = true,
        value =
            "SELECT i.title, td.amount, i.price "+
            "FROM TransactionDetail td "+
            "JOIN ITEMS i ON td.itemId = i.id "+
            "WHERE td.transactionHeaderId = ?1"
    )
    List<TransactionDetailProjection> getTransactionDetail(Integer transactionHeaderID);

    @Query(
        nativeQuery = true,
        value =
            "SELECT th.id, th.transactionDate, th.payment, th.paymentmethod, th.UUID, th.userUUID "+
            "FROM TransactionHeader th "+
            "WHERE th.UUID = ?1"
    )
    TransactionHeader getTransactionHeader(String transactionHeaderUUID);

    @Query(
        nativeQuery = true,
        value =
            "SELECT th.id, th.transactionDate, th.payment, th.paymentmethod, th.UUID, th.userUUID "+
            "FROM TransactionHeader th "+
            "WHERE th.userUUID = ?1"
    )
    List<TransactionHeader> getTransactionHeaderByUserUUID(String userUUID);

    @Query(
        nativeQuery = true,
        value =
            "INSERT INTO TRANSACTIONHEADER(`transactionDate`,`payment`,`paymentmethod`,`UUID`,`userUUID`) "+
            "VALUES(?1,?2,?3,?4,?5);"
    )
    @Transactional
    void saveHeader(String transactionDate, Integer payment, String paymentMethod, String UUID,String userUUID);

    @Query(
        nativeQuery = true,
        value =
            "INSERT INTO TRANSACTIONDETAIL(`transactionHeaderId`,`itemId`,`amount`) "+
            "VALUES(?1,?2,?3);"
    )
    @Transactional
    void saveDetail(Integer transactionHeaderId, Integer itemId, Integer amount);
}
