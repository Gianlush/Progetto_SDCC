package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public  interface UserRepository extends JpaRepository<User, Integer> {
}
