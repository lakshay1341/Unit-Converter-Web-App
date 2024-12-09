package com.student.dao;

import java.util.List;
import com.student.dto.Student;

public interface StudentDAO {
    boolean insertStudent(Student s);
    boolean updateStudent(Student s);
    boolean deleteStudent(Student s);
    Student getStudent(String mail, String pass);
    List<Student> getStudent();
	Student getStudent(long phone, String mail);
}
