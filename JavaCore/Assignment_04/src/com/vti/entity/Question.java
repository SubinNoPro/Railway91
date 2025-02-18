package com.vti.entity;

import java.time.LocalDate;

public class Question {
    private int id;
    private String content;
    private CategoryQuestion categoryQuestion;
    private TypeQuestion typeQuestion;
    private Account account;
    private LocalDate createdDate;

}
