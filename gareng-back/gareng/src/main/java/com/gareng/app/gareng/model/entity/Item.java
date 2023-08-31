package com.gareng.app.gareng.model.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@Table(name = "ITEMS")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String uuid;
    private String title;
    private String price;
    private String imageUrl;
    private Integer amount;
    
    public Item(String uuid, String title, String price, String imageUrl) {
        this.uuid = uuid;
        this.title = title;
        this.price = price;
        this.imageUrl = imageUrl;
    }
}
