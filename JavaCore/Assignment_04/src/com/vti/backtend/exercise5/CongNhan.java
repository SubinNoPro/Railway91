package com.vti.entity.exercise5;

public class CongNhan extends CanBo{
    private int bac;

    public CongNhan(String hoTen, int age, GioiTinh gioiTinh, String diaChi, int bac) {
        super(hoTen, age, gioiTinh, diaChi);
        this.bac = bac;
    }

    public int getBac() {
        return bac;
    }

    public void setBac(int bac) {
        this.bac = bac;
    }
}
