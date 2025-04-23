package com.Super_Market.SuberMarket.service;


import com.Super_Market.SuberMarket.dao.UserRepository;
import com.Super_Market.SuberMarket.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository repo;

    @Autowired
    private PasswordEncoder encoder;

    public void registerUser(String username, String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(encoder.encode(password));
        repo.save(user);
    }

    public User getByUsername(String username) {
        return repo.findByUsername(username);
    }
}