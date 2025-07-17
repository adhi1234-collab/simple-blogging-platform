package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    // Redirect to register by default
    @GetMapping("/")
    public String home() {
        return "redirect:/register";
    }

    // Show Register Page
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("error", null); // Clear any old error
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String register(@RequestParam String username, @RequestParam String password, Model model) {
        if (userRepository.findByUsername(username) != null) {
            model.addAttribute("error", "User already exists!");
            return "register";
        }
        User user = new User(username, password);
        userRepository.save(user);
        return "redirect:/login";
    }

    // Show Login Page
    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("error", null); // Clear any old error
        return "login";
    }

    // Handle login
    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        User user = userRepository.findByUsernameAndPassword(username, password);
        if (user == null) {
            model.addAttribute("error", "Invalid username or password!");
            return "login";
        }

        session.setAttribute("user", user);
        return "redirect:/dashboard";
    }

    // Logout and clear session
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
