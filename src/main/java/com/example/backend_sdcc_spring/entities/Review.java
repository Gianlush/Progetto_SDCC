package com.example.backend_sdcc_spring.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
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
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @ToString.Exclude
    @JsonIgnore
    @JoinColumn(name = "book")
    private Book book;

    @ManyToOne
    @ToString.Exclude
    @JsonIgnore
    @JoinColumn(name = "user")
    private User user;

    @Basic
    @Column(name = "star_number")
    private int star_number;


    @Basic
    @Column(name = "images")
    private String images;


    @Basic
    @Column(name = "title")
    private String title;


}
