package com.vti.entity;

import java.time.LocalDate;

public class Exam {
    private int id;
    private String code;
    private String title;
    private CategoryQuestion[] category;
    private int duration;
    private Account creator;
    private LocalDate createdDate;
    private Question[] question;
}
