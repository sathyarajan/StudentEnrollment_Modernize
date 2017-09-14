package com.github.elizabetht.service;

import com.github.elizabetht.client.StudentClient;
import com.github.elizabetht.model.Student;
import com.github.elizabetht.model.User;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

	private StudentClient studentClient;

	public StudentService(StudentClient studentClient) {
		this.studentClient = studentClient;
	}

	public String save(Student student) {
		if (studentClient != null) {
			if (studentClient.findByUserName(student.getUserName())) {
				return "SignupFailure-UserNameExists";
			}
			studentClient.save(student);
			return "SignupSuccess";
		} else {
			return "SignupFailure";
		}
	}

	public String findByLogin(User user) {
		String result = "LoginFailure";
		if (studentClient != null) {
			boolean status = studentClient.findByLogin(user);
			if (status) {
				result = "LoginSuccess";
			}
		}
		return result;
	}
}
