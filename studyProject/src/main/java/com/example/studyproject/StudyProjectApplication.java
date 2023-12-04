package com.example.studyproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class StudyProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudyProjectApplication.class, args);
    }

}