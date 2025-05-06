package com.Super_Market.SuberMarket.service;

import com.Super_Market.SuberMarket.entity.product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class productServiceImpl implements productService {

    private com.Super_Market.SuberMarket.dao.productRepository productRepository;

    @Autowired
    public productServiceImpl(com.Super_Market.SuberMarket.dao.productRepository theProductRepository){
        productRepository = theProductRepository;
    }

    @Override
    public List<product> findByIdIn(List<Integer> ids) {
        return productRepository.findAllById(ids);
    }

    @Override
    public List<product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public product findById(int id) {

        Optional<product> result = productRepository.findById(id);

        product product = null;
        if (result.isPresent()) {
            product = result.get();
        } else {
            throw new RuntimeException("Did not find product id - " + id);
        }
        return product;

       // return productRepository.findById(id).orElse(null);
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
