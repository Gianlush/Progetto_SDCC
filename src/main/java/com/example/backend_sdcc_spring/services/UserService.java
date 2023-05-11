package com.example.backend_sdcc_spring.services;
import com.example.backend_sdcc_spring.entities.User;
import com.example.backend_sdcc_spring.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional(readOnly = true)
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public User showUserByPassword(String email, String hashedPassword) {
        return userRepository.findUserByEmailAndPassword(email, hashedPassword);
    }

    @Transactional
    public User registerUser(User user) {
        if (userRepository.existsUserByEmail(user.getEmail()))
            return null;
        return userRepository.save(user);
    }
}