package com.vti.backtend;

import com.vti.entity.Student;

public class Exercise4 {
    public static void main(String[] args){
        Student student = new Student("Xa Qúy Toại","Hòa Bình");
        student.plusScore(3.0);
        student.displayStudent();
    }

}
