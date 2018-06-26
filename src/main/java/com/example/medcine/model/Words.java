package com.example.medcine.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Words {

    @Id
    @GeneratedValue
    private int wid;

    private String wname;

    private String wtip;

    private String words;

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getWname() {
        return wname;
    }

    public void setWname(String wname) {
        this.wname = wname;
    }

    public String getWtip() {
        return wtip;
    }

    public void setWtip(String wtip) {
        this.wtip = wtip;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    @Override
    public String toString() {
        return "Words{" +
                "wid=" + wid +
                ", wname='" + wname + '\'' +
                ", words='" + words + '\'' +
                '}';
    }
}
