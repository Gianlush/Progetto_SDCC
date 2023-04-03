package com.example.backend_sdcc_spring.Controller;

import com.example.backend_sdcc_spring.entities.User;
import com.example.backend_sdcc_spring.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public User loginUser(String email, String password){
        return userService.showUserByPassword(email, password);
    }

    @PostMapping("/register")
    public User registerUser(@RequestBody User user) {
        return userService.registerUser(user);
    }

}
