package com.example.backend_sdcc_spring.services;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.entities.Review;
import com.example.backend_sdcc_spring.entities.User;
import com.example.backend_sdcc_spring.repositories.ReviewRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
@Service
@Transactional(readOnly = true)
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;
    private String path = "C:/Users/Gianluca/Documents/IdeaProjects/Frontend_SDCC_Flutter/assets/images/reviews/";

    @Transactional
    public Review saveReview(String jsonReview, String jsonFiles) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Review review = mapper.readValue(jsonReview, Review.class);
        byte[][] files = mapper.readValue(jsonFiles, byte[][].class);
        String[] images = review.getImages().split(",");

        if(files.length!=0)
            try {
                FileOutputStream fos;
                for(int i=0;i<files.length;i++) {
                    fos = new FileOutputStream(path + images[i]);
                    fos.write(files[i]);
                    fos.close();
                }
            } catch (IOException e) {
                System.out.println("exception saving local file");
                return null;
            }

        return reviewRepository.save(review);
    }

    public List<Review> showByUserAndBook(int idUser, int idBook){
        Book book = new Book();
        User user = new User();
        book.setId(idBook);
        user.setId(idUser);
        return reviewRepository.findByUserAndBook(user,book);
    }
    public List<Review> showAllByBook(Book book){
        return reviewRepository.findAllByBook(book);
    }
    public List<Review> showAllByBookAndCommentContaining(Book book, String keyword){
        return reviewRepository.findAllByBookAndCommentContaining(book, keyword);
    }

    public List<Review> showAllByBookAndStarNumber(Book book, int starNumber){
        return reviewRepository.findAllByBookAndStarNumber(book, starNumber);
    }

    public List<Review> showAllByBookAndStarNumberAndCommentContaining(Book book, int starNumber, String keyword){
        return reviewRepository.findAllByBookAndStarNumberAndCommentContaining(book,starNumber,keyword);
    }


/*    public void save(){
        reviewRepository.save(review);

        if(files!=null)
            try {
                String[] names = review.getImages().split(",");
                for (int i = 0; i < files.size(); i++) {
                    //String path = "C:/Users/Gianluca/Documents/IdeaProjects/Frontend_SDCC_Flutter/assets/images/file" + file.getOriginalFilename() + ".jpg";
                    File file = new File("C:/Users/Gianluca/Documents/IdeaProjects/Frontend_SDCC_Flutter/assets/images/reviews/"+ names[i]);
                    files.get(i).transferTo(file);
                }
            } catch (IOException e) {
                System.out.println("IO exception in: service save review");
                throw new RuntimeException(e);
            }
    }*/
}
