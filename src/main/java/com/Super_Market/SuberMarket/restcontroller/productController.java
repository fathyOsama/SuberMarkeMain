package com.Super_Market.SuberMarket.restcontroller;

import com.Super_Market.SuberMarket.entity.product;
import com.Super_Market.SuberMarket.entity.productImage;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class productController {

    private final List<product> selectedProducts = new ArrayList<>();

    @Autowired
    private com.Super_Market.SuberMarket.service.productService productService;

    @GetMapping("/productSelection")
    public String productSelection() {
        return "productSelection";
    }

    @GetMapping("/list")
    public String showProducts(Model model) {

        List<product> allProducts = productService.findAll();

        List<product> dairyProducts = allProducts.stream()
                .filter(p -> "Dairy products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        List<product> oilProducts = allProducts.stream()
                .filter(p -> "Oil products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        List<product> meatProducts = allProducts.stream()
                .filter(p -> "Meat products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        model.addAttribute("dairyProducts", dairyProducts);
        model.addAttribute("oilProducts", oilProducts);
        model.addAttribute("meatProducts", meatProducts);

        //model.addAttribute("products", productService.findAll());
        return "list-product";
    }

    @GetMapping("/dairy_Products")
    public String dairy_Products(Model model) {

        List<product> allProducts = productService.findAll();

        List<product> dairyProducts = allProducts.stream()
                .filter(p -> "Dairy products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        model.addAttribute("dairyProducts", dairyProducts);

        return "dairy_Products";
    }

    @GetMapping("/oil_Products")
    public String oil_Products(Model model) {

        List<product> allProducts = productService.findAll();

        List<product> oilProducts = allProducts.stream()
                .filter(p -> "Oil products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        model.addAttribute("oilProducts", oilProducts);

        return "oil_Products";
    }

    @GetMapping("/meat_Products")
    public String meat_Products(Model model) {

        List<product> allProducts = productService.findAll();

        List<product> meatProducts = allProducts.stream()
                .filter(p -> "Meat products".equalsIgnoreCase(p.getProductType().getName()))
                .toList();

        model.addAttribute("meatProducts", meatProducts);

        return "meat_Products";
    }

    @GetMapping("/viewNewProductAddition")
    public String ViewNewProductAddition(Model themodel) {
        System.out.println("production");
        product product = new product();

        themodel.addAttribute("product", product);

        return "product-from";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute product product,
                              @RequestParam("imageUrls") List<String> imageUrls) {

        List<productImage> images = new ArrayList<>();

        for (int i = 0; i < imageUrls.size(); i++) {
            String url = imageUrls.get(i).trim();
            if (!url.isEmpty()) {
                productImage image = new productImage();
                image.setImageUrl(url);
                image.setProduct(product);
                image.setImageOrder(i);
                image.setPrimary(i == 0); // First image is primary
                images.add(image);
            }
        }

        product.setImages(images);
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

    @PostMapping("/clear-selection")
    public String clearSelection() {
        // Clear the selected products list
        selectedProducts.clear();

        // Redirect back to the selected products page
        return "redirect:/selected";
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


    @GetMapping("/farewell-message-to-the-client")
    public String farewellMessageToTheClient(){
        return "farewell-message";
    }

    @PostMapping("/clear-user-data")
    public String clearUserDataAndRedirect(HttpSession session) {

        selectedProducts.clear();

        session.removeAttribute("selectedProducts");

        return "redirect:/showMyLoginPage";
    }


}



