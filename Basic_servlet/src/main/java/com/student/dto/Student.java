package com.student.dto;

public class Student {
    private int id;
    private String name;
    private long phone;
    private String mail;
    private String branch;
    private String location;
    private String pass;
    private String date;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public long getPhone() { return phone; }
    public void setPhone(long phone) { this.phone = phone; }
    public String getMail() { return mail; }
    public void setMail(String mail) { this.mail = mail; }
    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", phone=" + phone +
                ", mail=" + mail + ", branch=" + branch + ", location=" + location + "]";
    }
}
