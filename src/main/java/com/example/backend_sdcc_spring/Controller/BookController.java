package com.example.backend_sdcc_spring.Controller;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.services.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;


    @GetMapping()
    public List<Book> getByName(String name){
        return bookService.showAllBookByNameContaining(name);
    }

    @PostMapping("/authors")
    public List<Book> getByAuthorsIn(@RequestBody List<String> authors){
        return bookService.showAllBookByAuthorsIn(authors);
    }

    @PostMapping("/genres")
    public List<Book> getByGenresIn(@RequestBody List<String> genres){
        return bookService.showAllBookByGenresIn(genres);
    }

    @GetMapping("/age")
    public List<Book> getByAgeLowerThan(String age){
        return bookService.showAllBookByAgeLowerThan(Integer.parseInt(age));
    }

}
