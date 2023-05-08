package com.example.backend_sdcc_spring.Controller;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.entities.Review;
import com.example.backend_sdcc_spring.services.ReviewService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/reviews")
public class ReviewController {
    
    @Autowired
    private ReviewService reviewService;

    @PostMapping("/own")
    public List<Review> getByUserAndBook(int idUser, int idBook){
        return reviewService.showByUserAndBook(idUser,idBook);
    }

    @PostMapping("/save")
    public void postUploadFiles(@RequestParam String jsonReview, List<MultipartFile> files) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            Review review = mapper.readValue(jsonReview, Review.class);
            reviewService.saveReview(review, files);
        }
            catch (JsonProcessingException e){
                System.out.println("json exception handler in POST: upload files");
                throw new RuntimeException(e);

        }

    }


    @PostMapping("/all")
    public List<Review> getAllByBook(@RequestBody Book book){
        return reviewService.showAllByBook(book);
    }

    @PostMapping("/keyword")
    public List<Review> getAllByBookAndCommentContaining(@RequestBody Book book, @RequestParam String keyword){
        return reviewService.showAllByBookAndCommentContaining(book, keyword);
    }


    @PostMapping("/star")
    public List<Review> getAllByBookAndStarNumber(@RequestBody Book book, @RequestParam int starNumber){
        return reviewService.showAllByBookAndStarNumber(book, starNumber);
    }


    @PostMapping("/star_keyword")
    public List<Review> getAllByBookAndStarNumberAndCommentContaining(@RequestBody Book book, @RequestParam int starNumber, @RequestParam String keyword){
        return reviewService.showAllByBookAndStarNumberAndCommentContaining(book,starNumber,keyword);
    }

}
