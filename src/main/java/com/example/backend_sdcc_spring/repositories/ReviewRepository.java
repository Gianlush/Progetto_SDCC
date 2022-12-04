package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    List<Review> findAll();
}
