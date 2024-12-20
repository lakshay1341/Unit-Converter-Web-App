package com.bank.dto;

import java.util.Date;

public class ComplaintDTO {
    private int complaintNo;
    private String accountNumber;
    private Date complaintDate;
    private String subject;
    private String description;
    private String status;
    private String closed;

    // Getters and Setters
    public int getComplaintNo() {
        return complaintNo;
    }

    public void setComplaintNo(int complaintNo) {
        this.complaintNo = complaintNo;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public Date getComplaintDate() {
        return complaintDate;
    }

    public void setComplaintDate(Date complaintDate) {
        this.complaintDate = complaintDate;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    public String getClosed() {
        return closed;
    }

    public void setClosed(String closed) {
        this.closed = closed;
    }
}
