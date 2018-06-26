package com.example.medcine.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Prescript {
    @Id
    @GeneratedValue
    private  int  pid;

    private String pname;

    private String pgroup;

    private String ptype;

    private String pcome;

    private String pinfo;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPgroup() {
        return pgroup;
    }

    public void setPgroup(String pgroup) {
        this.pgroup = pgroup;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getPcome() {
        return pcome;
    }

    public void setPcome(String pcome) {
        this.pcome = pcome;
    }

    public String getPinfo() {
        return pinfo;
    }

    public void setPinfo(String pinfo) {
        this.pinfo = pinfo;
    }

    @Override
    public String toString() {
        return "Prescript{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", pgroup='" + pgroup + '\'' +
                ", ptype='" + ptype + '\'' +
                ", pcome='" + pcome + '\'' +
                ", pinfo='" + pinfo + '\'' +
                '}';
    }
}
