package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.entities.Review;
import com.example.backend_sdcc_spring.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ReviewRepository extends JpaRepository<Review, Integer> {

    List<Review> findByUserAndBook(User user, Book book);
    List<Review> findAllByBook(Book book);
    List<Review> findAllByBookAndCommentContaining(Book book, String keyword);

    List<Review> findAllByBookAndStarNumber(Book book, int starNumber);

    List<Review> findAllByBookAndStarNumberAndCommentContaining(Book book, int starNumber, String keyword);
}
