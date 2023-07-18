package com.gareng.app.gareng.model.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.Item;
import com.gareng.app.gareng.model.projection.ItemProjection;

@Repository
public interface ItemRepository extends CrudRepository<Item, Long>{
    @Query(
        nativeQuery = true, 
        value = 
            "SELECT i.uuid, i.title, i.price, i.imageUrl "+
            "FROM ITEMS i "+
            "LIMIT ?1 "+
            "OFFSET ?2"
    )
    List<ItemProjection> getItemView(Integer sizePerPage, Integer pageAt);

    @Query(
        nativeQuery = true, 
        value = 
            "SELECT i.uuid, i.title, i.price, i.imageUrl "+
            "FROM ITEMS i "+
            "WHERE i.title ILIKE %?3% "+
            "LIMIT ?1 "+
            "OFFSET ?2"
    )
    List<ItemProjection> getItemView(Integer sizePerPage, Integer pageAt, String search);

    @Query(
        nativeQuery = true, 
        value = 
            "SELECT i.uuid, i.title, i.price, i.imageUrl "+
            "FROM ITEMS i"
    )
    List<ItemProjection> getItemView();

    @Query(
        nativeQuery = true, 
        value = 
            "SELECT i.uuid, i.title, i.price, i.imageUrl "+
            "FROM ITEMS i "+
            "WHERE i.title ILIKE %?1%"
    )
    List<ItemProjection> getItemView(String search);

    @Query(
        nativeQuery = true,
        value = "SELECT\n" + 
                "CASE\n" + 
                "WHEN EXISTS(SELECT * FROM ITEMS WHERE UUID = ?1)\n" +
                "THEN TRUE\n" +
                "ELSE FALSE\n" +
                "END AS RESULT"
    )
    boolean checkItemExist(String itemUUID);

    @Query(
        nativeQuery = true, 
        value = 
            "SELECT i.title "+
            "FROM ITEMS i "+
            "WHERE i.uuid = ?1"
    )
    String getItemName(String itemUuid);
}
