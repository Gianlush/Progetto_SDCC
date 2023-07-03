package com.example.backend_sdcc_spring.controllers;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.entities.Review;
import com.example.backend_sdcc_spring.services.ReviewService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/reviews", produces = "application/json;charset=UTF-8")
public class ReviewController {
    
    @Autowired
    private ReviewService reviewService;

    @PostMapping(value = "/own")
    public List<Review> getByUserAndBook(int idUser, int idBook){
        return reviewService.showByUserAndBook(idUser,idBook);
    }

    @PostMapping(value = "/save")
    public Review saveReview(@RequestParam String jsonReview, @RequestBody String jsonFiles) {
        try {
            return reviewService.saveReview(jsonReview, jsonFiles);
        } catch (JsonProcessingException e) {
            System.out.println("Json exception in saveReview controller");
            return null;
        }
    }

    @PostMapping(value = "/all")
    public List<Review> getAllByBook(@RequestBody Book book){
        return reviewService.showAllByBook(book);
    }

    @PostMapping(value = "/keyword")
    public List<Review> getAllByBookAndCommentContaining(@RequestBody Book book, @RequestParam String keyword){
        return reviewService.showAllByBookAndCommentContaining(book, keyword);
    }

    @PostMapping(value = "/star")
    public List<Review> getAllByBookAndStarNumber(@RequestBody Book book, @RequestParam int starNumber){
        return reviewService.showAllByBookAndStarNumber(book, starNumber);
    }

    @PostMapping(value = "/star_keyword")
    public List<Review> getAllByBookAndStarNumberAndCommentContaining(@RequestBody Book book, @RequestParam int starNumber, @RequestParam String keyword){
        return reviewService.showAllByBookAndStarNumberAndCommentContaining(book,starNumber,keyword);
    }

}
