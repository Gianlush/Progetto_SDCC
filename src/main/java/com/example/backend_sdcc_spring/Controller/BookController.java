package com.example.backend_sdcc_spring.Controller;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.services.BookService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;


    @PostMapping()
    public List<Book> getByName(@RequestParam String name, String listAges, String listGenres, String listAuthors){
        try {
            return bookService.showAllBook(name, listAges, listGenres, listAuthors);
        } catch (JsonProcessingException e) {
            System.out.println("exception JSON book controller");
            throw new RuntimeException(e);
        }
    }
/*
    @PostMapping("/authors")
    public List<Book> getByAuthorsIn(@RequestBody List<String> authors){
        return bookService.showAllBookByAuthorsIn(authors);
    }

    @PostMapping("/genres")
    public List<Book> getByGenresIn(@RequestBody List<String> genres){
        return bookService.showAllBookByGenresIn(genres);
    }

    @PostMapping("/age")
    public List<Book> getByAgeInAgeIn(@RequestBody List<String> age){
        return bookService.showAllBookByInAgeIn(age);
    }*/

}
