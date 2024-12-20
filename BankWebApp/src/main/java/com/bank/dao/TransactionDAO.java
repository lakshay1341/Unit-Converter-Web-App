package com.bank.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bank.dto.TransactionDTO;
import com.bank.utils.ConnectionFactory;

public class TransactionDAO {
	
	
	public List<TransactionDTO> getTransactionsByAccount(String accountNumber) throws SQLException {
	    String sql = "SELECT * FROM Transaction WHERE ACT_NO = ?";
	    try (Connection conn = ConnectionFactory.requestConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, accountNumber);
	        ResultSet rs = ps.executeQuery();

	        List<TransactionDTO> transactions = new ArrayList<>();
	        while (rs.next()) {
	            TransactionDTO transaction = new TransactionDTO();
	            transaction.setTransactionId(rs.getInt("TRANID"));
	            transaction.setAccountNumber(rs.getString("ACT_NO"));
	            transaction.setTransactionDate(rs.getDate("TRAN_DATE"));
	            transaction.setDescription(rs.getString("TRAN_DESC"));
	            transaction.setStatus(rs.getString("TRAN_STATUS"));
	            transaction.setRemarks(rs.getString("REMARKS"));
	            transactions.add(transaction);
	        }
	        return transactions;
	    }
	}
	
	
	public List<TransactionDTO> getTransactionsByDateRange(String accountNumber, Date startDate, Date endDate) throws SQLException {
	    String sql = "SELECT * FROM Transaction WHERE ACT_NO = ? AND TRAN_DATE BETWEEN ? AND ?";
	    try (Connection conn = ConnectionFactory.requestConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, accountNumber);
	        ps.setDate(2, startDate);
	        ps.setDate(3, endDate);
	        ResultSet rs = ps.executeQuery();

	        List<TransactionDTO> transactions = new ArrayList<>();
	        while (rs.next()) {
	            TransactionDTO transaction = new TransactionDTO();
	            transaction.setTransactionId(rs.getInt("TRANID"));
	            transaction.setAccountNumber(rs.getString("ACT_NO"));
	            transaction.setTransactionDate(rs.getDate("TRAN_DATE"));
	            transaction.setDescription(rs.getString("TRAN_DESC"));
	            transaction.setStatus(rs.getString("TRAN_STATUS"));
	            transaction.setRemarks(rs.getString("REMARKS"));
	            transactions.add(transaction);
	        }
	        return transactions;
	    }
	}
	
	public boolean transferMoney(String senderActNo, String receiverActNo, double amount) {
	    Connection conn = null;
	    PreparedStatement debitStmt = null;
	    PreparedStatement creditStmt = null;
	    PreparedStatement insertTxnStmt = null;

	    String debitQuery = "UPDATE Customer SET BALANCE = BALANCE - ? WHERE ACT_NO = ?";
	    String creditQuery = "UPDATE Customer SET BALANCE = BALANCE + ? WHERE ACT_NO = ?";
	    String insertTransactionQuery = "INSERT INTO Transaction (ACT_NO, TRAN_DATE, TRAN_DESC, TRAN_STATUS, REMARKS) VALUES (?, NOW(), ?, ?, ?)";

	    try {
	        conn = ConnectionFactory.requestConnection();
	        conn.setAutoCommit(false); // Start transaction

	        // Debit sender
	        debitStmt = conn.prepareStatement(debitQuery);
	        debitStmt.setDouble(1, amount);
	        debitStmt.setString(2, senderActNo);
	        int senderRows = debitStmt.executeUpdate();
	        if (senderRows != 1) {
	            conn.rollback();
	            throw new SQLException("Failed to debit sender.");
	        }

	        // Credit receiver
	        creditStmt = conn.prepareStatement(creditQuery);
	        creditStmt.setDouble(1, amount);
	        creditStmt.setString(2, receiverActNo);
	        int receiverRows = creditStmt.executeUpdate();
	        if (receiverRows != 1) {
	            conn.rollback();
	            throw new SQLException("Failed to credit receiver.");
	        }

	        // Insert transaction record
	        insertTxnStmt = conn.prepareStatement(insertTransactionQuery);
	        insertTxnStmt.setString(1, senderActNo);
	        insertTxnStmt.setString(2, "Transferred to: " + receiverActNo);
	        insertTxnStmt.setString(3, "SUCCESS");
	        insertTxnStmt.setString(4, "Debit");
	        insertTxnStmt.executeUpdate();

	        insertTxnStmt.setString(1, receiverActNo);
	        insertTxnStmt.setString(2, "Received from: " + senderActNo);
	        insertTxnStmt.setString(3, "SUCCESS");
	        insertTxnStmt.setString(4, "Credit");
	        insertTxnStmt.executeUpdate();

	        conn.commit(); // Commit transaction
	        return true;
	    } catch (SQLException e) {
	        if (conn != null) {
	            try {
	                conn.rollback(); // Rollback transaction on error
	            } catch (SQLException rollbackEx) {
	                rollbackEx.printStackTrace();
	            }
	        }
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Close resources
	        try {
	            if (debitStmt != null) debitStmt.close();
	            if (creditStmt != null) creditStmt.close();
	            if (insertTxnStmt != null) insertTxnStmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	}
	
	// Method to get all transactions
    public List<TransactionDTO> getAllTransactions() throws SQLException {
        String sql = "SELECT * FROM Transaction";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            List<TransactionDTO> transactions = new ArrayList<>();
            while (rs.next()) {
                TransactionDTO transaction = new TransactionDTO();
                transaction.setTransactionId(rs.getInt("TRANID"));
                transaction.setAccountNumber(rs.getString("ACT_NO"));
                transaction.setTransactionDate(rs.getDate("TRAN_DATE"));
                transaction.setDescription(rs.getString("TRAN_DESC"));
                transaction.setStatus(rs.getString("TRAN_STATUS"));
                transaction.setRemarks(rs.getString("REMARKS"));
                transactions.add(transaction);
            }
            return transactions;
        }
    }
    
    
    public List<TransactionDTO> getLatestTransactions() throws SQLException {
        String sql = "SELECT * FROM Transaction ORDER BY TRAN_DATE DESC LIMIT 3";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();

            List<TransactionDTO> transactions = new ArrayList<>();
            while (rs.next()) {
                TransactionDTO transaction = new TransactionDTO();
                transaction.setTransactionId(rs.getInt("TRANID"));
                transaction.setAccountNumber(rs.getString("ACT_NO"));
                transaction.setTransactionDate(rs.getDate("TRAN_DATE"));
                transaction.setDescription(rs.getString("TRAN_DESC"));
                transaction.setStatus(rs.getString("TRAN_STATUS"));
                transaction.setRemarks(rs.getString("REMARKS"));
                transactions.add(transaction);
            }
            return transactions;
        }
    }


}
