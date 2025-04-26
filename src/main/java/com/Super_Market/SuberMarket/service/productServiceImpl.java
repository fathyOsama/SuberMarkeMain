package com.Super_Market.SuberMarket.service;

import com.Super_Market.SuberMarket.entity.product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class productServiceImpl implements productService {

    private com.Super_Market.SuberMarket.dao.productRepository productRepository;

    @Autowired
    public productServiceImpl(com.Super_Market.SuberMarket.dao.productRepository theProductRepository){
        productRepository = theProductRepository;
    }

    @Override
    public List<product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public product findById(int id) {
        return productRepository.findById(id).orElse(null);
    }

    @Override
    public product save(product theProduct) {
        return productRepository.save(theProduct);
    }

    @Override
    public void deleteById(int theId) {
        productRepository.deleteById(theId);
    }
}
