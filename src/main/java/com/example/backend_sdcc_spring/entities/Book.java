package com.example.backend_sdcc_spring.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Set;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "book", schema = "my_library")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name")
    private String name;

    @Basic
    @Column(name = "genre")
    private String genre;


    @Basic
    @Column(name = "age")
    private int age;


    @Basic
    @Column(name = "author")
    private String author;


    @OneToMany(mappedBy = "book")
    @JsonIgnore
    @ToString.Exclude
    private Set<Review> reviews;

    private void addReview(Review review){
        this.reviews.add(review);
    }

}
