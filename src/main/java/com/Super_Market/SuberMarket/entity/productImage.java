package com.Super_Market.SuberMarket.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "product_images")
public class productImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "image_order")
    private int imageOrder;

    @Column(name = "is_primary")
    private boolean isPrimary;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private product product;

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getImageOrder() {
        return imageOrder;
    }

    public void setImageOrder(int imageOrder) {
        this.imageOrder = imageOrder;
    }

    public boolean isPrimary() {
        return isPrimary;
    }

    public void setPrimary(boolean primary) {
        isPrimary = primary;
    }

    public product getProduct() {
        return product;
    }

    public void setProduct(product product) {
        this.product = product;
    }
}

