package com.example.backend_sdcc_spring.Controller;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.services.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;


    @GetMapping("/search")
    public List<Book> getByName(String name){
        return bookService.showAllBookByNameContaining(name);
    }

}
