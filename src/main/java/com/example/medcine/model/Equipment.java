package com.example.medcine.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Equipment {

    @Id
    @GeneratedValue
    private  int eid;

    private  String ename;

    private  String estatus;

    private  String eposition;

    public Equipment() {
    }

    public Equipment(String ename, String estatus, String eposition) {
        this.ename = ename;
        this.estatus = estatus;
        this.eposition = eposition;
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public String getEposition() {
        return eposition;
    }

    public void setEposition(String eposition) {
        this.eposition = eposition;
    }

    @Override
    public String toString() {
        return "Equipment{" +
                "eid=" + eid +
                ", ename='" + ename + '\'' +
                ", estatus='" + estatus + '\'' +
                ", eposition='" + eposition + '\'' +
                '}';
    }
}
