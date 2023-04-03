package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {

    List<Book> findBookByAuthorIn(List<String> authors);

    List<Book> findBookByAgeIn(List<String> ages);

    List<Book> findBookByGenreIn(List<String> genres);

    List<Book> findBookByNameContainsIgnoreCase(String name);


}
