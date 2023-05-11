package com.example.backend_sdcc_spring.services;

import com.example.backend_sdcc_spring.entities.Book;
import com.example.backend_sdcc_spring.repositories.BookRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class BookService {
    @Autowired
    private BookRepository bookRepository;
    public List<Book> showAllBook(String name, String listAges, String listGenres, String listAuthors) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        List<String> ages = mapper.readValue(listAges, List.class);
        List<String> genres = mapper.readValue(listGenres, List.class);
        List<String> authors = mapper.readValue(listAuthors, List.class);

        if(ages.contains("Per adulti (18 )")) {
            ages.remove("Per adulti (18 )");
            ages.add("Per adulti (18+)");
        }


        if(!ages.isEmpty() && !authors.isEmpty() && !genres.isEmpty())
            return bookRepository.findBookByNameContainsIgnoreCaseAndGenreInAndAuthorInAndAgeIn(name, genres, authors, ages);
        if(!ages.isEmpty() && !authors.isEmpty())
            return bookRepository.findBookByNameContainsIgnoreCaseAndAuthorInAndAgeIn(name, authors, ages);
        if(!ages.isEmpty() && !genres.isEmpty())
            return bookRepository.findBookByNameContainsIgnoreCaseAndGenreInAndAgeIn(name, genres, ages);
        if(!authors.isEmpty() && !genres.isEmpty())
            return bookRepository.findBookByNameContainsIgnoreCaseAndGenreInAndAuthorIn(name, genres, authors);
        if(!ages.isEmpty())
            return bookRepository.findBookByAgeInAndNameContainingIgnoreCase(ages, name);
        if(!genres.isEmpty())
            return bookRepository.findBookByGenreInAndNameContainingIgnoreCase(genres, name);
        if(!authors.isEmpty())
            return bookRepository.findBookByAuthorInAndNameContainingIgnoreCase(authors, name);
        return bookRepository.findBookByNameContainsIgnoreCase(name);
    }

/*    public List<Book> showAllBookByNameContaining(String name){
        return bookRepository.findBookByNameContainsIgnoreCase(name);
    }

    public List<Book> showAllBookByAuthorsIn(List<String> authors){
        return bookRepository.findBookByAuthorIn(authors);
    }

    public List<Book> showAllBookByGenresIn(List<String> genres){
        return bookRepository.findBookByGenreIn(genres);
    }

    public List<Book> showAllBookByInAgeIn(List<String> ages){
        return bookRepository.findBookByAgeIn(ages);
    }*/
}
