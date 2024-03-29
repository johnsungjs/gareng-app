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
@Table(name = "WISHLIST")
public class Wishlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String userUUID;
    private String itemUUID;
    
    public Wishlist(String userUUID, String itemUUID) {
        this.userUUID = userUUID;
        this.itemUUID = itemUUID;
    }
}
