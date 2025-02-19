package com.vti.entity.exercise5;

public class KySu extends CanBo{
    private String nganhDaoTao;

    public KySu(String hoTen, int age, GioiTinh gioiTinh, String diaChi, String nganhDaoTao) {
        super(hoTen, age, gioiTinh, diaChi);
        this.nganhDaoTao = nganhDaoTao;
    }

    public String getNganhDaoTao() {
        return nganhDaoTao;
    }

    public void setNganhDaoTao(String nganhDaoTao) {
        this.nganhDaoTao = nganhDaoTao;
    }
}
