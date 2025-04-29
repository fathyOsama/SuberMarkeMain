package com.Super_Market.SuberMarket.restcontroller;

import com.Super_Market.SuberMarket.entity.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class authController {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UserDetailsManager userDetailsManager;

    @GetMapping("/showMyLoginPage")
    public String showLoginPage() {

        return "login-page";
    }

    @GetMapping("/register")
    public String showRegistrationPage(Model model) {
        // Create model attribute to bind form data
        model.addAttribute("user", new user());
        return "registration-form";
    }

    @PostMapping("/processRegistration")
    public String processRegistration(@ModelAttribute("user") user user) {

        if (userDetailsManager.userExists(user.getUsername())) {
            return "redirect:/register?error=username_taken";
        }

        UserDetails newUser = org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(encoder.encode(user.getPassword()))
                .roles("USER")
                .build();

        userDetailsManager.createUser(newUser);

        return "redirect:/showMyLoginPage?registration=success";
    }


    /*@PostMapping("/processRegistration")
    public String processRegistration(@ModelAttribute("user") User user) {
        // In a real application, you would save the user to database here
        // userService.save(user);

        return "redirect:/showMyLoginPage?registration=success";
    }*/


}
