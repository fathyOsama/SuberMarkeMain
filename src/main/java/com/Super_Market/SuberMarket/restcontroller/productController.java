package com.Super_Market.SuberMarket.restcontroller;

import com.Super_Market.SuberMarket.entity.product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
//@RequestMapping("/products")
public class productController {

    private final List<product> selectedProducts = new ArrayList<>();

    @Autowired
    private com.Super_Market.SuberMarket.service.productService productService;

    @GetMapping("/list")
    public String showProducts(Model model) {
        model.addAttribute("products", productService.findAll());
        return "list-product";
    }

    @GetMapping("/viewNewProductAddition")
    public String ViewNewProductAddition(Model themodel){
        System.out.println("production");
        product product = new product();

        themodel.addAttribute("product",product);

        return "product-from";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute("product") product product) {

        // save the employee
        productService.save(product);

        // use a redirect to prevent duplicate submissions
        return "redirect:/list";
    }

    @PostMapping("/select/{id}")
    public String selectProduct(@PathVariable Integer id) {
        product product = productService.findById(id);
        if (product != null && !selectedProducts.contains(product)) {
            selectedProducts.add(product);
        }
        return "redirect:/selected";
    }

    @GetMapping("/selected")
    public String showSelectedProducts(Model model) {
        model.addAttribute("products", selectedProducts);
        return "selected-products";
    }
}



