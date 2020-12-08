package com.example.my27_listview2;

public class SingerDto {
    String name;
    String phonenum;
    int age;
    int resId;      // 사진의 resource

    public SingerDto(String name, String phonenum, int age, int resId) {
        this.name = name;
        this.phonenum = phonenum;
        this.age = age;
        this.resId = resId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }
}//class
