package com.example.backend_sdcc_spring.controllers;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.services.BookService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/books", produces = "application/json;charset=UTF-8")
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

}
