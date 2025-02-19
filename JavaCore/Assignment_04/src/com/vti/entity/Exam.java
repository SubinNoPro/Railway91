package com.vti.entity;

import java.time.LocalDate;

public class Exam {
    private int examId;
    private String code;
    private String title;
    private CategoryQuestion[] category;
    private int duration;
    private Account creator;
    private LocalDate createdDate;
    private Question[] question;

    public Exam(int id, String code, String title, CategoryQuestion[] category, int duration, Account creator, LocalDate createdDate, Question[] question) {
        this.examId = id;
        this.code = code;
        this.title = title;
        this.category = category;
        this.duration = duration;
        this.creator = creator;
        this.createdDate = createdDate;
        this.question = question;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public CategoryQuestion[] getCategory() {
        return category;
    }

    public void setCategory(CategoryQuestion[] category) {
        this.category = category;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Account getCreator() {
        return creator;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public Question[] getQuestion() {
        return question;
    }

    public void setQuestion(Question[] question) {
        this.question = question;
    }
}
