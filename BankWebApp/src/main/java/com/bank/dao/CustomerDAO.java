package com.bank.dao;

import com.bank.dto.CustomerDTO;
import com.bank.utils.ConnectionFactory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public boolean registerCustomer(CustomerDTO customer) throws SQLException {
    	System.out.println("Inside registerCustomer method");

        String sql = "INSERT INTO Customer (FNAME, LNAME, DOB, USER_ID, PWORD, ACT_NO, GENDER, BALANCE) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, customer.getFname());
            ps.setString(2, customer.getLname());
            ps.setString(3, customer.getDob());
            ps.setString(4, customer.getUserId());
            ps.setString(5, customer.getPassword());
            ps.setString(6, customer.getAccountNumber());
            ps.setString(7, customer.getGender());
            ps.setDouble(8, customer.getBalance());

            return ps.executeUpdate() > 0;
        }
    }

    public CustomerDTO loginCustomer(String userId, String password) throws SQLException {
    	System.out.println("login method");
        String sql = "SELECT * FROM Customer WHERE USER_ID = ? AND PWORD = ?";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                CustomerDTO customer = new CustomerDTO();
                customer.setFname(rs.getString("FNAME"));
                customer.setLname(rs.getString("LNAME"));
                customer.setDob(rs.getString("DOB"));
                customer.setUserId(rs.getString("USER_ID"));
                customer.setPassword(rs.getString("PWORD"));
                customer.setAccountNumber(rs.getString("ACT_NO"));
                customer.setGender(rs.getString("GENDER"));
                customer.setBalance(rs.getDouble("BALANCE"));
                return customer;
            }
            return null;
        }
    }
    
    public boolean updateCustomerBalance(String accountNumber, double newBalance) throws SQLException {
        String sql = "UPDATE Customer SET BALANCE = ? WHERE ACT_NO = ?";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDouble(1, newBalance);
            ps.setString(2, accountNumber);

            return ps.executeUpdate() > 0;
        }
    }
    
    
    public CustomerDTO getCustomerByAccountNumber(String accountNumber) throws SQLException {
        String sql = "SELECT * FROM Customer WHERE ACT_NO = ?";
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                CustomerDTO customer = new CustomerDTO();
                customer.setFname(rs.getString("FNAME"));
                customer.setLname(rs.getString("LNAME"));
                customer.setDob(rs.getString("DOB"));
                customer.setUserId(rs.getString("USER_ID"));
                customer.setPassword(rs.getString("PWORD"));
                customer.setAccountNumber(rs.getString("ACT_NO"));
                customer.setGender(rs.getString("GENDER"));
                customer.setBalance(rs.getDouble("BALANCE"));
                return customer;
            }
            return null;
        }
    }
    
    public boolean updateCustomerInfo(CustomerDTO customer) throws SQLException {
        String sql = "UPDATE Customer SET FNAME = ?, LNAME = ?, DOB = ?, PWORD = ?, GENDER = ? WHERE ACT_NO = ?";

        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, customer.getFname());  // Update first name
            ps.setString(2, customer.getLname());  // Update last name
            ps.setString(3, customer.getDob());    // Update date of birth
            ps.setString(4, customer.getPassword()); // Update password
            ps.setString(5, customer.getGender()); // Update gender
            ps.setString(6, customer.getAccountNumber()); // Specify the account to update

            // Execute the update query and return success status
            return ps.executeUpdate() > 0;
        }
    }
    
    public List<CustomerDTO> getAllCustomers() throws SQLException {
        List<CustomerDTO> customerList = new ArrayList<>();
        String query = "SELECT * FROM Customer"; // Replace with your actual table name

        try (Connection connection = ConnectionFactory.requestConnection(); 
             Statement stmt = connection.createStatement(); 
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                // Create a new CustomerDTO object and populate it with data from the result set
                CustomerDTO customer = new CustomerDTO();
                customer.setAccountNumber(rs.getString("ACT_NO"));
                customer.setFname(rs.getString("FNAME"));
                customer.setLname(rs.getString("LNAME"));
                customer.setDob(rs.getString("DOB"));
                customer.setUserId(rs.getString("USER_ID"));
                customer.setPassword(rs.getString("PWORD"));
                customer.setGender(rs.getString("GENDER"));
                customer.setBalance(rs.getDouble("BALANCE"));

                // Add the customer to the list
                customerList.add(customer);
            }
        }

        return customerList;
    }
    
    public boolean deleteCustomerByAccountNumber(String accountNumber) throws SQLException {
        System.out.println("Inside deleteCustomerByAccountNumber method");

        // SQL query to delete a customer based on account number
        String sql = "DELETE FROM Customer WHERE ACT_NO = ?";
        
        try (Connection conn = ConnectionFactory.requestConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            // Set the account number in the prepared statement
            ps.setString(1, accountNumber);

            // Execute the update and return true if a record was deleted
            return ps.executeUpdate() > 0;
        }
    }


}
