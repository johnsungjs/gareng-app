package com.gareng.app.gareng.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gareng.app.gareng.model.entity.Wishlist;

@Repository
public interface WishlistRepository extends CrudRepository<Wishlist ,Integer>{
    @Query(
        nativeQuery = true,
        value = "SELECT\n" + 
                "CASE\n" + 
                "WHEN EXISTS(SELECT * FROM WISHLIST WHERE ITEMUUID = ?1 AND USERUUID = ?2)\n" +
                "THEN TRUE\n" +
                "ELSE FALSE\n" +
                "END AS RESULT"
    )
    public boolean isMyWishlistExist(String itemUuid, String userUuid);

    @Query(
        nativeQuery = true,
        value = "SELECT * " +
                "FROM " +
                "WISHLIST " +
                "WHERE ITEMUUID = ?1 AND USERUUID = ?2 "
    )
    public Wishlist getOneWishlist(String itemUuid, String userUuid);
}
