package com.vti.entity.exercise5;

public class CanBo {
    private String hoTen;
    private int age;
    private GioiTinh gioiTinh;
    private String diaChi;

    public CanBo(String hoTen, int age, GioiTinh gioiTinh, String diaChi) {
        this.hoTen = hoTen;
        this.age = age;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public GioiTinh getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(GioiTinh gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
