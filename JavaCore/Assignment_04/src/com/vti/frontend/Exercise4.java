package com.vti.frontend;

import com.vti.backtend.exercise4.Student;

public class Exercise4 {
    public static void main(String[] args){
        Student student = new Student("Xa Qúy Toại","Hòa Bình");
        student.plusScore(3.0);
        student.displayStudent();
    }

}
