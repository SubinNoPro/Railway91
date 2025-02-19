package com.vti.entity.exercise5;

public class NhanVien extends CanBo{
    private String congViec;

    public NhanVien(String hoTen, int age, GioiTinh gioiTinh, String diaChi, String congViec) {
        super(hoTen, age, gioiTinh, diaChi);
        this.congViec = congViec;
    }

    public String getCongViec() {
        return congViec;
    }

    public void setCongViec(String congViec) {
        this.congViec = congViec;
    }
}
