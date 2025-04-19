package com.Super_Market.SuberMarket.service;

import com.Super_Market.SuberMarket.entity.Product;

import java.util.List;

public interface ProductService {

    List<Product> findAll();

    Product findById(int theId);

    Product save(Product theProduct);

    void deleteById(int theId);
}
