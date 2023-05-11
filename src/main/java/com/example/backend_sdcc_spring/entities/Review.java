package com.example.backend_sdcc_spring.entities;


import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(name = "review", schema = "my_library")
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "book")
    private Book book;

    @ManyToOne
    @JoinColumn(name = "user")
    private User user;

    @Basic
    @Column(name = "comment")
    private String comment;

    @Basic
    @Column(name = "star_number")
    private int starNumber;


    @Basic
    @Column(name = "images")
    private String images;


    @Basic
    @Column(name = "title")
    private String title;


}
