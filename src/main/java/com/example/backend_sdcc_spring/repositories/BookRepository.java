package com.example.backend_sdcc_spring.repositories;

import com.example.backend_sdcc_spring.entities.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {

    List<Book> findBookByAuthorInAndNameContainingIgnoreCase(List<String> authors, String name);

    List<Book> findBookByAgeInAndNameContainingIgnoreCase(List<String> ages, String name);

    List<Book> findBookByGenreInAndNameContainingIgnoreCase(List<String> genres, String name);

    List<Book> findBookByNameContainsIgnoreCase(String name);

    List<Book> findBookByNameContainsIgnoreCaseAndGenreInAndAuthorInAndAgeIn(String name, List<String> genres, List<String> authors, List<String> ages);

    List<Book> findBookByNameContainsIgnoreCaseAndGenreInAndAuthorIn(String name, List<String> genres, List<String> authors);

    List<Book> findBookByNameContainsIgnoreCaseAndGenreInAndAgeIn(String name, List<String> genres, List<String> ages);
    List<Book> findBookByNameContainsIgnoreCaseAndAuthorInAndAgeIn(String name, List<String> authors, List<String> ages);



}
