package com.example.backend_sdcc_spring.repositories;
import com.example.backend_sdcc_spring.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public  interface UserRepository extends JpaRepository<User, Integer> {

    User findUserByEmailAndPassword(String email, String password);

    boolean existsUserByEmail(String email);
}
