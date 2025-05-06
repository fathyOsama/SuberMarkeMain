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
public class productController {

    private final List<product> selectedProducts = new ArrayList<>();

    @Autowired
    private com.Super_Market.SuberMarket.service.productService productService;

    @GetMapping("/list")
    public String showProducts(Model model) {

        List<product> allProducts = productService.findAll();

        List<product> dairyProducts = allProducts.stream()
                .filter(p -> "Dairy products".equalsIgnoreCase(p.getProductType()))
                .toList();

        List<product> oilProducts = allProducts.stream()
                .filter(p -> "Oil products".equalsIgnoreCase(p.getProductType()))
                .toList();

        model.addAttribute("dairyProducts", dairyProducts);
        model.addAttribute("oilProducts", oilProducts);

        //model.addAttribute("products", productService.findAll());
        return "list-product";
    }

    @GetMapping("/viewNewProductAddition")
    public String ViewNewProductAddition(Model themodel) {
        System.out.println("production");
        product product = new product();

        themodel.addAttribute("product", product);

        return "product-from";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute("product") product product) {

        productService.save(product);

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
        double totalPrice = calculateTotalPrice(selectedProducts);

        model.addAttribute("products", selectedProducts);

        model.addAttribute("totalPrice", totalPrice);

        return "selected-products";
    }

    private double calculateTotalPrice(List<product> products) {
        return products.stream()
                .mapToDouble(product::getProductPrice)
                .sum();
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {

        if (selectedProducts.isEmpty()) {
            return "redirect:/list";
        }

        double totalPrice = calculateTotalPrice(selectedProducts);

        model.addAttribute("products", selectedProducts);

        model.addAttribute("totalPrice", totalPrice);

        return "checkout";
    }

    @PostMapping("/clear-selection")
    public String clearSelection() {
        // Clear the selected products list
        selectedProducts.clear();

        // Redirect back to the selected products page
        return "redirect:/selected";
    }


}



