package com.example.medcine.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Medicines {

    @Id
    @GeneratedValue
    private int mid;

    private String mname;

    private String mtype;

    private int myear;

    private String mfunction;

    private String mway;

    private String detail;

    public Medicines() {
    }

    public Medicines(String mname, String mtype, int myear, String mfunction, String mway, String detail) {
        this.mname = mname;
        this.mtype = mtype;
        this.myear = myear;
        this.mfunction = mfunction;
        this.mway = mway;
        this.detail = detail;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMtype() {
        return mtype;
    }

    public void setMtype(String mtype) {
        this.mtype = mtype;
    }

    public int getMyear() {
        return myear;
    }

    public void setMyear(int myear) {
        this.myear = myear;
    }

    public String getMfunction() {
        return mfunction;
    }

    public void setMfunction(String mfunction) {
        this.mfunction = mfunction;
    }

    public String getMway() {
        return mway;
    }

    public void setMway(String mway) {
        this.mway = mway;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Medicines{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", mtype='" + mtype + '\'' +
                ", myear=" + myear +
                ", mfunction='" + mfunction + '\'' +
                ", mway='" + mway + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
