package com.Super_Market.SuberMarket.entity;


import jakarta.persistence.*;
import jakarta.persistence.Id;

@Entity
@Table(name = "users") // Specify the table name (optional)
public class User {

    @Id  // This annotation marks the field as the primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Auto-increment
    private int id;

    private String username;
    private String password;
    private String email;

    // Default constructor
    public User() {
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}