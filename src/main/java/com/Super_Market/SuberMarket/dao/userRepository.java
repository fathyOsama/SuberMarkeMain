package com.Super_Market.SuberMarket.dao;

import com.Super_Market.SuberMarket.entity.user;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface userRepository extends JpaRepository<user, Integer> {
    // Add any custom query methods if needed
    user findByUsername(String username);
}