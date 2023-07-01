package com.example.backend_sdcc_spring;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class BackendSdccSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(BackendSdccSpringApplication.class, args);
    }
}
