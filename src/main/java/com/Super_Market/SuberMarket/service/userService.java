package com.Super_Market.SuberMarket.service;


import com.Super_Market.SuberMarket.dao.userRepository;
import com.Super_Market.SuberMarket.entity.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class userService {
    @Autowired
    private userRepository repo;

    @Autowired
    private PasswordEncoder encoder;

    public void registerUser(String username, String password) {
        user user = new user();
        user.setUsername(username);
        user.setPassword(encoder.encode(password));
        repo.save(user);
    }

    public user getByUsername(String username) {
        return repo.findByUsername(username);
    }
}