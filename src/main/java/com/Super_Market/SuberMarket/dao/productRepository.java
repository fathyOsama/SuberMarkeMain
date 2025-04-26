package com.Super_Market.SuberMarket.dao;

import com.Super_Market.SuberMarket.entity.product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface productRepository extends JpaRepository<product, Integer> {
}
