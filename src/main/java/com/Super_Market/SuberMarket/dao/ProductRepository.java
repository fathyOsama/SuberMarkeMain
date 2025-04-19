package com.Super_Market.SuberMarket.dao;

import com.Super_Market.SuberMarket.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}
