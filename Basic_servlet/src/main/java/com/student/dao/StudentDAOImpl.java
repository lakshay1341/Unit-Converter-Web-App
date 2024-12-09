package com.student.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.student.connectors.ConnectionFactory;
import com.student.dto.Student;

public class StudentDAOImpl implements StudentDAO {
    private Connection con;

    public StudentDAOImpl() {
        this.con = ConnectionFactory.requestConnection();
    }

    @Override
    public boolean insertStudent(Student s) {
        String query = "INSERT INTO student VALUES (0,?,?,?,?,?,?,SYSDATE())";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, s.getName());
            ps.setLong(2, s.getPhone());
            ps.setString(3, s.getMail());
            ps.setString(4, s.getBranch());
            ps.setString(5, s.getLocation());
            ps.setString(6, s.getPass());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateStudent(Student s) {
        String query = "UPDATE student SET name=?, phone=?, mailid=?, branch=?, location=?, password=? WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, s.getName());
            ps.setLong(2, s.getPhone());
            ps.setString(3, s.getMail());
            ps.setString(4, s.getBranch());
            ps.setString(5, s.getLocation());
            ps.setString(6, s.getPass());
            ps.setInt(7, s.getId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteStudent(Student s) {
        String query = "DELETE FROM student WHERE ID=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, s.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }




    @Override
    public List<Student> getStudent() {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM student";
        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getLong("phone"));
                s.setMail(rs.getString("mailid"));
                s.setBranch(rs.getString("branch"));
                s.setLocation(rs.getString("location"));
                s.setPass(rs.getString("password"));
                s.setDate(rs.getString("date"));
                students.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public Student getStudent(String mail, String pass) {
        String query = "SELECT * FROM student WHERE MAILID=? AND PASSWORD=?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, mail);
            ps.setString(2, pass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Student s = new Student();
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    s.setPhone(rs.getLong("phone"));
                    s.setMail(rs.getString("mailid"));
                    s.setBranch(rs.getString("branch"));
                    s.setLocation(rs.getString("location"));
                    s.setPass(rs.getString("password"));
                    s.setDate(rs.getString("date"));
                    return s;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
  //  @Override
    public Student getStudent(long phone, String mail) {
    	String query = "SELECT * FROM student WHERE PHONE = ? AND MAILID = ?";
    	Student s = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement(query);
            ps.setLong(1, phone);
            ps.setString(2, mail);
            rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPhone(rs.getLong("phone"));
                s.setMail(rs.getString("mail"));
                s.setBranch(rs.getString("branch"));
                s.setLocation(rs.getString("location"));
                s.setPass(rs.getString("password"));
                s.setDate(rs.getString("date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }
}
