package com.bank.dto;

public class CustomerDTO {
    
	private String fname;
    private String lname;
    private String dob;
    private String userId;
    private String password;
    private String accountNumber;
    private String gender;
    private double balance;
    
    public CustomerDTO(){}
    
    public CustomerDTO(String fname, String lname, String dob, String userId, String password, String accountNumber,
			String gender, double balance) {
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.userId = userId;
		this.password = password;
		this.accountNumber = accountNumber;
		this.gender = gender;
		this.balance = balance;
	}
    
    // Getters and Setters

	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public double getBalance() {
		return balance;
	}


	public void setBalance(double balance) {
		this.balance = balance;
	}
    
    
}
