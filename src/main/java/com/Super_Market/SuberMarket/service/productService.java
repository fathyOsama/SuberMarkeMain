package com.Super_Market.SuberMarket.service;

import com.Super_Market.SuberMarket.entity.product;

import java.util.List;

public interface productService {

    List<product> findAll();

    product findById(int theId);

    product save(product theProduct);

    void deleteById(int theId);
}
