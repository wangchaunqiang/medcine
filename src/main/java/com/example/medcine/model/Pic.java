package com.example.medcine.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Pic {

    @Id
    @GeneratedValue
    private int pid;

    private String picpath;

    public Pic() {
    }

    public Pic(String picpath) {
        this.picpath = picpath;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPicpath() {
        return picpath;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }

    @Override
    public String toString() {
        return "Pic{" +
                "pid=" + pid +
                ", picpath='" + picpath + '\'' +
                '}';
    }
}
