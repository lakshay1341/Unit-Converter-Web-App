package com.bank.dto;

import java.util.Date;

public class TransactionDTO {
	
    private int transactionId;
    private String accountNumber;
    private Date transactionDate;
    private String description;
    private String status;
    private String remarks;
    
    public TransactionDTO() {}
    
	public TransactionDTO(int transactionId, String accountNumber, Date transactionDate, String description,
			String status, String remarks) {
		this.transactionId = transactionId;
		this.accountNumber = accountNumber;
		this.transactionDate = transactionDate;
		this.description = description;
		this.status = status;
		this.remarks = remarks;
	}
	
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
