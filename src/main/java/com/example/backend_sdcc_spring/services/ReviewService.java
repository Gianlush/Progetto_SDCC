package com.example.backend_sdcc_spring.services;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.entities.Review;
import com.example.backend_sdcc_spring.entities.User;
import com.example.backend_sdcc_spring.repositories.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Transactional
    public void saveReview(Review review, List<MultipartFile> files)  {

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
}
