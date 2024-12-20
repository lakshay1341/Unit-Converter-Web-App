package com.bank.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bank.dto.ComplaintDTO;
import com.bank.utils.ConnectionFactory;

public class ComplaintDAO {

	// Method to get all complaints (fetch all records from the Complaint table)
	public List<ComplaintDTO> getAllComplaints() throws SQLException {
		String sql = "SELECT * FROM Complaint"; // No filtering condition, fetch all complaints
		try (Connection conn = ConnectionFactory.requestConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			List<ComplaintDTO> complaints = new ArrayList<>();
			while (rs.next()) {
				ComplaintDTO complaint = new ComplaintDTO();
				complaint.setComplaintNo(rs.getInt("COMPLAINT_NO"));
				complaint.setAccountNumber(rs.getString("ACT_NO"));
				complaint.setComplaintDate(rs.getDate("COMPLAINT_DATE"));
				complaint.setSubject(rs.getString("SUBJECT"));
				complaint.setDescription(rs.getString("DESCRIPTION"));
				complaint.setStatus(rs.getString("STATUS"));
				complaint.setClosed(rs.getString("CLOSED"));
				complaints.add(complaint);
			}
			return complaints;
		}
	}

	// Method to get complaints for a specific user by account number
	public List<ComplaintDTO> getComplaintsByAccount(String accountNumber) throws SQLException {
		String sql = "SELECT * FROM Complaint WHERE ACT_NO = ?";
		try (Connection conn = ConnectionFactory.requestConnection();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, accountNumber);
			ResultSet rs = ps.executeQuery();

			List<ComplaintDTO> complaints = new ArrayList<>();
			while (rs.next()) {
				ComplaintDTO complaint = new ComplaintDTO();
				complaint.setComplaintNo(rs.getInt("COMPLAINT_NO"));
				complaint.setAccountNumber(rs.getString("ACT_NO"));
				complaint.setComplaintDate(rs.getDate("COMPLAINT_DATE"));
				complaint.setSubject(rs.getString("SUBJECT"));
				complaint.setDescription(rs.getString("DESCRIPTION"));
				complaint.setStatus(rs.getString("STATUS"));
				complaint.setClosed(rs.getString("CLOSED"));
				complaints.add(complaint);
			}
			return complaints;
		}
	}

	// Method to add a new complaint
	public void addComplaint(ComplaintDTO complaint) throws SQLException {
		String sql = "INSERT INTO Complaint (ACT_NO, COMPLAINT_DATE, SUBJECT, DESCRIPTION, STATUS, CLOSED) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection conn = ConnectionFactory.requestConnection();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, complaint.getAccountNumber());
			ps.setDate(2, new java.sql.Date(complaint.getComplaintDate().getTime()));
			ps.setString(3, complaint.getSubject());
			ps.setString(4, complaint.getDescription());
			ps.setString(5, complaint.getStatus());
			ps.setString(6, complaint.getClosed());
			ps.executeUpdate();
		}
	}

	// Method to get recent complaints
	public List<ComplaintDTO> getRecentComplaints() throws SQLException {
		String sql = "SELECT * FROM Complaint ORDER BY COMPLAINT_DATE DESC LIMIT 3";
		try (Connection conn = ConnectionFactory.requestConnection();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();

			List<ComplaintDTO> complaints = new ArrayList<>();
			while (rs.next()) {
				ComplaintDTO complaint = new ComplaintDTO();
				complaint.setComplaintNo(rs.getInt("COMPLAINT_NO"));
				complaint.setAccountNumber(rs.getString("ACT_NO"));
				complaint.setComplaintDate(rs.getDate("COMPLAINT_DATE"));
				complaint.setSubject(rs.getString("SUBJECT"));
				complaint.setDescription(rs.getString("DESCRIPTION"));
				complaint.setStatus(rs.getString("STATUS"));
				complaint.setClosed(rs.getString("CLOSED"));
				complaints.add(complaint);
			}
			return complaints;
		}
	}

	// Method to resolve complaints for a specific account number
	public boolean resolveComplaint(String complaint_no) throws SQLException {
		String sql = "UPDATE Complaint SET STATUS = 'Resolved', CLOSED = 'Yes' WHERE COMPLAINT_NO = ?";
		try (Connection conn = ConnectionFactory.requestConnection();
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, complaint_no);
			int rowsUpdated = ps.executeUpdate();
			if (rowsUpdated > 0) {
				return true;
			} else {
				return false;
			}
		}
	}

}
