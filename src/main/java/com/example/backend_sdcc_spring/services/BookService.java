package com.example.backend_sdcc_spring.services;
import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class BookService {
    @Autowired
    private BookRepository bookRepository;

    public List<Book> showAllBookByNameContaining(String name){
        return bookRepository.findBookByNameContainsIgnoreCase(name);
    }
}
