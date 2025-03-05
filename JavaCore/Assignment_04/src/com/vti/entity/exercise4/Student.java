package com.vti.backtend.exercise4;

public class Student {
    private int studentID;
    private String studentName;
    private String studentHomeTown;
    private double score;

    public Student(String studentName, String studentHomeTown) {
        this.studentName = studentName;
        this.studentHomeTown = studentHomeTown;
        this.score = 0.0;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double plusScore(Double scoreP){
        this.score =score + scoreP;
        return score;
    }

    public void displayStudent(){
        System.out.println("Tên: " + studentName);
        if (score < 4.0){
            System.out.println("Học lực Yếu");
        }else if (score > 4.0 && score < 6.0 ){
            System.out.println("Học lực Trung bình");
        }else if (score > 6.0 && score < 8.0){
            System.out.println("Học lực Khá");
        }else {
            System.out.println("Học lực Giỏi");
        }
    }
}
