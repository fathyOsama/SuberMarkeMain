package com.Super_Market.SuberMarket.dao;

import com.Super_Market.SuberMarket.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // Add any custom query methods if needed
    User findByUsername(String username);
}