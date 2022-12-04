package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {

    List<Book> findBookByAuthorIn(List<String> authors);

    List<Book> findBookByAgeIn(List<Integer> ages);

    List<Book> findBookByGenreIn(List<String> genres);

    List<Book> findBookByNameStartingWith(String name);


}
