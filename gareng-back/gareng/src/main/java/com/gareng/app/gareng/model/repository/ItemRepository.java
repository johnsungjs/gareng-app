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
            "FROM ITEMS i"
    )
    List<ItemProjection> getItemView();
}
